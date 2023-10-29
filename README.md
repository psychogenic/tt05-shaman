![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

# SHAman

SHAman is a hardware (ASIC) implementation of a sha256 hasher for inclusion on TinyTapeout.  It is

  Copyright (C) 2023 Pat Deegan, [https://psychogenic.com/](https://psychogenic.com/)

<p align="center">
  <img src="https://raw.githubusercontent.com/psychogenic/tt05-shaman/main/img/shaman-logo.jpg" width="300" />
</p>


This implements the SHA-256 digest to create hashes of the data you feed in.  It is a naive, mostly unoptimized, implementation
of the algorithm (though you can interleave data input while it's processing, using parallel mode, if you respect busy).

Data is fed into the system in 64 byte blocks.  The hash is available after each 64 byte block has been input (allowing for
some cycles to finish processing).

The process is to:
  * toggle start, to reset the digest
  * put data byte on the databyte input (the "in" port)
  * wait until busy is de-asserted (if required)
  * clock the clockin_data pin

After each complete block, the digest will become available after some clocks.  In short if
  * busy is not asserted; and
  * result_ready goes high

The first hash byte will be available on the out port.  To get the next bytes, clock result_next and read the port.

Parallel mode allows you to start feeding in more input data while the system is still processing the previous 
block.  You need to pay attention to and respect "busy", here, or things will get badly munged.  
Also, in parallel mode, you need to hold the clockin_data for an extra cycle when you bring it high.

Pinout looks a little weird but it is hoped this will be a nice match for the PMOD arrangement on the demo boards.

NOTES

It does NOT massage the input data into suitable blocks. Messages need to be appended with an 0x80 byte, padded 
such that the entire thing, along with an 8 byte suffix containing the length (big end), is a multiple of 512 
bits (64 bytes). You can see this in action in the message_to_blocks() function, in test.py.

I don't think it's super fast but, in parallel mode, I *think* simulation indicates it takes on the order of 8.3 microseconds
per byte using a 1MHz system clock.  So, if we could feed this a 50MHz clock, say, we'd get down to 166 ns/byte.
That's only hashing on the order of 6 megabytes per second, I dunno maybe 100x slower than my laptop, but my 
laptop doesn't run on a 50MHz clock and whatevs: should do the job if it holds in realy life.  All this 
is when processing longer messages, to swamp out the minor overhead of setup etc.

When loading input data, if using parallel mode, hold clockin_data for an extra system clock.  So
  * data byte on inputs
  * clockin_data HIGH
  * hold one system clock
  * clockin_data LOW
  * ... loop for next byte


# Testing

Might be good to run the cocotb test to get VCDs if you really want to see it in action.  But we want to play with hardware!
So... There will be a python script in the repository to convert any content into the expected 512 bit blocks of bytes
padded and everything to make the system happy.

With that list of bytes in hand, this should work nicely:

  * hold n_reset low for a few clock cycles
  * bring n_reset high, and give it a few cycles
  * start a new message digest my clocking start (bring high for one cycle, then low)
for each block in your message
   while "busy" is HIGH, wait a bit and check again
   for each byte in that block
      put the byte on in port (dedicated input pins)
      while "busy" is HIGH, wait a bit and check again
      bring clockin_data HIGH
      if using parallel mode, hold for an extra clock cycle
      bring clockin_data LOW
      
Check and wait until "busy" is LOW and "result_ready" goes HIGH.
Your first result byte will already be present on the output port.
Grab it and stash it.
Then, for the next 31 bytes:
  bring result_next HIGH
  hold it there for one clock cycle
  bring result_next LOW
  grab and stash the byte on output pins

If the hash is going to be, say "90fc0a268f8b81b...", they'll be present in that order
0x90, then 0xfc, then 0x0a etc
      

## Pinout
inputs:               
  - data_input bit 0
  - data_input bit 1
  - data_input bit 2
  - data_input bit 3
  - data_input bit 4
  - data_input bit 5
  - data_input bit 6
  - data_input bit 7

outputs:
  - result_byte bit 0
  - result_byte bit 1
  - result_byte bit 2
  - result_byte bit 3
  - result_byte bit 4
  - result_byte bit 5
  - result_byte bit 6
  - result_byte bit 7

bidirectional:
  - OUTPUT: result_ready 
  - OUTPUT: begin processing data debug 
  - INPUT:  parallel loading enable 
  - INPUT:  result_next 
  - OUTPUT: busy 
  - OUTPUT: processing data block debug
  - INPUT:  start new digest 
  - INPUT:  clockin_data



# What is Tiny Tapeout?

TinyTapeout is an educational project that aims to make it easier and cheaper than ever to get your digital designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

## Verilog Projects

Edit the [info.yaml](info.yaml) and uncomment the `source_files` and `top_module` properties, and change the value of `language` to "Verilog". Add your Verilog files to the `src` folder, and list them in the `source_files` property.

The GitHub action will automatically build the ASIC files using [OpenLane](https://www.zerotoasiccourse.com/terminology/openlane/).

## How to enable the GitHub actions to build the ASIC files

Please see the instructions for:

- [Enabling GitHub Actions](https://tinytapeout.com/faq/#when-i-commit-my-change-the-gds-action-isnt-running)
- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## Resources

- [FAQ](https://tinytapeout.com/faq/)
- [Digital design lessons](https://tinytapeout.com/digital_design/)
- [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
- [Join the community](https://discord.gg/rPK2nSjxy8)

## What next?

- Submit your design to the next shuttle [on the website](https://tinytapeout.com/#submit-your-design). The closing date is **November 4th**.
- Edit this [README](README.md) and explain your design, how it works, and how to test it.
- Share your GDS on your social network of choice, tagging it #tinytapeout and linking Matt's profile:
  - LinkedIn [#tinytapeout](https://www.linkedin.com/search/results/content/?keywords=%23tinytapeout) [matt-venn](https://www.linkedin.com/in/matt-venn/)
  - Mastodon [#tinytapeout](https://chaos.social/tags/tinytapeout) [@matthewvenn](https://chaos.social/@matthewvenn)
  - Twitter [#tinytapeout](https://twitter.com/hashtag/tinytapeout?src=hashtag_click) [@matthewvenn](https://twitter.com/matthewvenn)
