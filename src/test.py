'''
Created on Oct 28, 2023

@author: Pat Deegan
@copyright: Copyright (C) 2023 Pat Deegan, https://psychogenic.com
'''

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles
import hashlib

TestMessage = b'if I was a cat, I might be fat but--unlike a cat--I wear a hat, and am in the end not (so) fat... however ' * 9
TestMessageIndy = b'There was a young man of Killarney Who was chock full of what is called blarney'

'''

    wire [7:0] dataByteIn = ui_in[7:0];
    wire [7:0] resultbyteOut = ui_out[7:0];
    
    wire resultReady =                  uio_out[0];
    wire beginProcessingDataBlock =     uio_out[1];
    wire parallelLoading =              uio_in[2];
    wire resultNext =                   uio_in[3];
    wire busy =                         uio_out[4];
    wire processingReceivedDataBlock =  uio_out[5];
    wire start =                        uio_in[6];
    wire clockinData =                  uio_in[7];

'''


async def loadMessageBlock(dut, message_block):
    # print(f' handle message block (f{message_block}) len {len(message_block)}')
    t = 0
    numSlots = len(message_block)/4
    while t < numSlots:
        #print(message_block[t])
        i = int.from_bytes(bytes(message_block[t*4:(t*4)+4]), 'big')
        for btIdx in range(4):
            daShift = ((3-btIdx)*8)
            byteVal = (i & (0xff << daShift)) >> daShift
            
            numBusyTicks = 0
            isBusy = dut.busy.value
            while isBusy and numBusyTicks < 1000:
                await ClockCycles(dut.clk, 1)
                isBusy = dut.busy.value
                
            assert numBusyTicks < 1000
            
            dut.databyteIn.value = byteVal 
            dut.clockinData.value = 1
            await ClockCycles(dut.clk, 4)
            dut.clockinData.value = 0
            await ClockCycles(dut.clk, 4)
            
            
        isBusy = dut.busy.value
        if (t < numSlots - 1 ) and isBusy:
            dut._log.info("hum busy")
        
        t += 1
        

async def processMessageBlocks(dut, encodedMsg, message_blocks):
    dut.start.value = 1
    await ClockCycles(dut.clk, 10)
    dut.start.value = 0
    await ClockCycles(dut.clk, 10)
    tickCountTotal = 0
    
    for block in message_blocks:
        await loadMessageBlock(dut, block)
        
        numBusyTicks = 0
        isBusy = dut.busy.value
        outputReady = dut.resultReady.value
        while (isBusy and (not outputReady)):
            await ClockCycles(dut.clk, 1)
            numBusyTicks += 1
            isBusy = dut.busy.value
            outputReady = dut.resultReady.value
        
        tickCountTotal += numBusyTicks
        # dut._log.info(f'Processed block in {numBusyTicks} ticks')
    
    avgTickCount = int(tickCountTotal/len(message_blocks))
    dut._log.info(f'Spent avg of {avgTickCount} waiting on processing, per block')

    dut._log.info(f'All blocks input, waiting until done...')
    numWaitFinalTicks = 0
    await ClockCycles(dut.clk, 1)
    outputReady = dut.resultReady.value
    while not outputReady:
        outputReady = dut.resultReady.value
        await ClockCycles(dut.clk, 1)
        numWaitFinalTicks += 1
        
    dut._log.info(f'Done after {numWaitFinalTicks}')
        
    results_bytes = []
    for i in range(32):
        results_bytes.append(dut.resultbyteOut.value)
        dut.resultNext.value = 1
        await ClockCycles(dut.clk, 2)
        dut.resultNext.value = 0
        await ClockCycles(dut.clk, 2)
        
    calculated = ''.join(map(lambda i: f'{int(i):02x}', results_bytes))
    m = hashlib.sha256()
    
    m.update(encodedMsg)
    hashed = m.hexdigest()
    
    dut._log.info('SHA256 RESULT:')
    dut._log.info(f'calculated: {calculated}')
    dut._log.info(f'hashlib dg: {hashed}')
    
    assert hashed == calculated 
    
    


async def reset(dut):
    
    # reset
    dut._log.info("reset")
    dut.databyteIn.value = 0
    dut.parallelLoading.value = 0
    dut.resultNext.value = 0
    dut.start.value = 0
    dut.resultNext.value = 0
    
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 100)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 30)


    
@cocotb.test()
async def test_synchronous(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())
    
    await reset(dut)
    message_blocks = message_to_blocks(TestMessageIndy)
    dut._log.info(f'Encoding "{TestMessageIndy}" using spinlock')
    dut.parallelLoading.value = 0
    await ClockCycles(dut.clk, 2)
    await processMessageBlocks(dut, TestMessageIndy, message_blocks)
    

@cocotb.test()
async def testBothSHA(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())
    
    await reset(dut)
    
    message_blocks = message_to_blocks(TestMessage)
    dut._log.info(f'Encoding "{TestMessage}" using spinlock')
    dut.parallelLoading.value = 0
    await processMessageBlocks(dut, TestMessage, message_blocks)
    
    await ClockCycles(dut.clk, 20)
    dut.parallelLoading.value = 1
    await ClockCycles(dut.clk, 20)
    dut._log.info(f'Encoding "{TestMessage}" using parallel loads')
    await processMessageBlocks(dut, TestMessage, message_blocks)
        

@cocotb.test()
async def test_parallel(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())
    
    await reset(dut)
    
    msg = TestMessageIndy
    message_blocks = message_to_blocks(msg)
    dut._log.info(f'Encoding "{msg}" using parallel')
    dut.parallelLoading.value = 1
    await ClockCycles(dut.clk, 2)
    
    await processMessageBlocks(dut, msg, message_blocks)



def message_to_blocks(message: bytearray) -> bytearray:
    """chunk message bytearray into 512 bit block(s) with any required padding"""

    if isinstance(message, str):
        message = bytearray(message, 'ascii')
    elif isinstance(message, bytes):
        message = bytearray(message)
    elif not isinstance(message, bytearray):
        raise TypeError

    # Padding
    length = len(message) * 8 # len(message) is number of BYTES!!!
    message.append(0x80)
    while (len(message) * 8 + 64) % 512 != 0:
        message.append(0x00)

    message += length.to_bytes(8, 'big') # pad to 8 bytes or 64 bits

    assert (len(message) * 8) % 512 == 0, "Padding did not complete properly!"

    # Parsing
    blocks = [] # contains 512-bit chunks of message
    for i in range(0, len(message), 64): # 64 bytes is 512 bits
        blocks.append(message[i:i+64])
        
    return blocks