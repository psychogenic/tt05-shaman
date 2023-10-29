`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

// testbench is controlled by test.py
module tb ();

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    reg  clk;
    reg  rst_n;
    reg  ena;
    reg  [7:0] ui_in;
    reg  [7:0] uio_in;
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;
    
    
    // utility wires for naming
    wire [7:0] databyteIn;
    assign ui_in[7:0] = databyteIn[7:0];
    wire [7:0] resultbyteOut = uo_out[7:0];

    wire parallelLoading;
    wire resultNext;
    wire start;
    wire clockinData;
    
    
    wire resultReady =                  uio_out[0];
    wire beginProcessingDataBlock =     uio_out[1];
    assign uio_in[0] = 0;
    assign uio_in[1] = 0;
    assign uio_in[2] = parallelLoading;
    assign uio_in[3] = resultNext;
    assign uio_in[4] = 0;
    assign uio_in[5] = 0;
    wire busy =                         uio_out[4];
    wire processingReceivedDataBlock =  uio_out[5];
    assign uio_in[6] = start;
    assign uio_in[7] = clockinData;
    
    tt_um_psychogenic_shaman tt_um_psychogenic_shaman (
    // include power ports for the Gate Level test
    `ifdef GL_TEST
        .VPWR( 1'b1),
        .VGND( 1'b0),
    `endif
        .ui_in      (ui_in),    // Dedicated inputs
        .uo_out     (uo_out),   // Dedicated outputs
        .uio_in     (uio_in),   // IOs: Input path
        .uio_out    (uio_out),  // IOs: Output path
        .uio_oe     (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
        .ena        (ena),      // enable - goes high when design is selected
        .clk        (clk),      // clock
        .rst_n      (rst_n)     // not reset
        );

endmodule
