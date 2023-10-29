/*
    Shaman v1.2.0 SHA256 hardware encoder, for tinytapeout 5.
    Copyright (C) 2023 Pat Deegan, https://psychogenic.com
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman.shapi.blockproc" *)
(* generator = "Amaranth" *)
module blockproc(rst, newMessage, hbuf0, hbuf1, hbuf2, hbuf3, hbuf4, hbuf5, hbuf6, hbuf7, initBufferReady, doProcessBlock, bp_initdat, bp_outrdy, processingCount, clk);
  reg \$auto$verilog_backend.cc:2083:dump_module$62  = 0;
  wire \$1 ;
  wire [32:0] \$10 ;
  wire [32:0] \$12 ;
  wire [32:0] \$13 ;
  wire [32:0] \$15 ;
  wire [32:0] \$16 ;
  wire [32:0] \$18 ;
  wire [32:0] \$19 ;
  wire [32:0] \$21 ;
  wire [32:0] \$22 ;
  wire [32:0] \$24 ;
  wire [32:0] \$25 ;
  wire [32:0] \$27 ;
  wire [32:0] \$28 ;
  wire [7:0] \$3 ;
  wire \$30 ;
  wire \$32 ;
  wire [32:0] \$34 ;
  wire [32:0] \$35 ;
  wire [32:0] \$37 ;
  wire [32:0] \$38 ;
  wire [7:0] \$4 ;
  wire [32:0] \$6 ;
  wire [32:0] \$7 ;
  wire [32:0] \$9 ;
  reg [31:0] bp_a = 32'd0;
  reg [31:0] \bp_a$next ;
  reg [31:0] bp_b = 32'd0;
  reg [31:0] \bp_b$next ;
  reg [31:0] bp_c = 32'd0;
  reg [31:0] \bp_c$next ;
  reg [31:0] bp_d = 32'd0;
  reg [31:0] \bp_d$next ;
  reg [31:0] bp_e = 32'd0;
  reg [31:0] \bp_e$next ;
  reg [31:0] bp_f = 32'd0;
  reg [31:0] \bp_f$next ;
  reg [31:0] bp_g = 32'd0;
  reg [31:0] \bp_g$next ;
  reg [31:0] bp_h = 32'd0;
  reg [31:0] \bp_h$next ;
  input [511:0] bp_initdat;
  wire [511:0] bp_initdat;
  output bp_outrdy;
  reg bp_outrdy = 1'h0;
  reg \bp_outrdy$next ;
  (* enum_base_type = "BlockProcessorState" *)
  (* enum_value_0000 = "PowerUp" *)
  (* enum_value_0001 = "NewMessageBegin" *)
  (* enum_value_0010 = "NewBlockBegin" *)
  (* enum_value_0011 = "WaitForReady" *)
  (* enum_value_0100 = "ValueSnapShot" *)
  (* enum_value_0101 = "ProcessBlockUnit" *)
  (* enum_value_0110 = "CheckBlockDone" *)
  (* enum_value_0111 = "ProcessBlockDone" *)
  (* enum_value_1000 = "HashReady" *)
  reg [3:0] bp_procst = 4'h0;
  reg [3:0] \bp_procst$next ;
  input clk;
  wire clk;
  input doProcessBlock;
  wire doProcessBlock;
  output [31:0] hbuf0;
  reg [31:0] hbuf0 = 32'd0;
  reg [31:0] \hbuf0$next ;
  output [31:0] hbuf1;
  reg [31:0] hbuf1 = 32'd0;
  reg [31:0] \hbuf1$next ;
  output [31:0] hbuf2;
  reg [31:0] hbuf2 = 32'd0;
  reg [31:0] \hbuf2$next ;
  output [31:0] hbuf3;
  reg [31:0] hbuf3 = 32'd0;
  reg [31:0] \hbuf3$next ;
  output [31:0] hbuf4;
  reg [31:0] hbuf4 = 32'd0;
  reg [31:0] \hbuf4$next ;
  output [31:0] hbuf5;
  reg [31:0] hbuf5 = 32'd0;
  reg [31:0] \hbuf5$next ;
  output [31:0] hbuf6;
  reg [31:0] hbuf6 = 32'd0;
  reg [31:0] \hbuf6$next ;
  output [31:0] hbuf7;
  reg [31:0] hbuf7 = 32'd0;
  reg [31:0] \hbuf7$next ;
  input initBufferReady;
  wire initBufferReady;
  input newMessage;
  wire newMessage;
  reg [31:0] opT1Output = 32'd0;
  reg [31:0] \opT1Output$next ;
  reg [31:0] opT2Output = 32'd0;
  reg [31:0] \opT2Output$next ;
  output [6:0] processingCount;
  wire [6:0] processingCount;
  input rst;
  wire rst;
  wire t1_initBufferReady;
  reg [6:0] t1_t1_count = 7'h00;
  reg [6:0] \t1_t1_count$next ;
  wire [31:0] t1_t1_e;
  wire [31:0] t1_t1_f;
  wire [31:0] t1_t1_g;
  wire [31:0] t1_t1_h;
  wire [511:0] t1_t1_initdat;
  wire [31:0] t1_t1_out;
  wire t1_t1_outrdy;
  wire [31:0] t2_t2_a;
  wire [31:0] t2_t2_b;
  wire [31:0] t2_t2_c;
  wire [31:0] t2_t2_out;
  reg thisIsLastUnitInBlock = 1'h0;
  reg \thisIsLastUnitInBlock$next ;
  assign \$10  = hbuf1 + bp_b;
  assign \$13  = hbuf2 + bp_c;
  assign \$16  = hbuf3 + bp_d;
  assign \$1  = ~ doProcessBlock;
  assign \$19  = hbuf4 + bp_e;
  assign \$22  = hbuf5 + bp_f;
  assign \$25  = hbuf6 + bp_g;
  assign \$28  = hbuf7 + bp_h;
  assign \$30  = t1_t1_count == 6'h3f;
  assign \$32  = ~ doProcessBlock;
  assign \$35  = opT1Output + opT2Output;
  assign \$38  = bp_d + opT1Output;
  assign \$4  = t1_t1_count + 1'h1;
  assign \$7  = hbuf0 + bp_a;
  always @(posedge clk)
    opT2Output <= \opT2Output$next ;
  always @(posedge clk)
    opT1Output <= \opT1Output$next ;
  always @(posedge clk)
    bp_h <= \bp_h$next ;
  always @(posedge clk)
    bp_g <= \bp_g$next ;
  always @(posedge clk)
    bp_f <= \bp_f$next ;
  always @(posedge clk)
    bp_e <= \bp_e$next ;
  always @(posedge clk)
    bp_d <= \bp_d$next ;
  always @(posedge clk)
    bp_c <= \bp_c$next ;
  always @(posedge clk)
    bp_b <= \bp_b$next ;
  always @(posedge clk)
    bp_a <= \bp_a$next ;
  always @(posedge clk)
    bp_outrdy <= \bp_outrdy$next ;
  always @(posedge clk)
    thisIsLastUnitInBlock <= \thisIsLastUnitInBlock$next ;
  always @(posedge clk)
    hbuf7 <= \hbuf7$next ;
  always @(posedge clk)
    hbuf6 <= \hbuf6$next ;
  always @(posedge clk)
    hbuf5 <= \hbuf5$next ;
  always @(posedge clk)
    hbuf4 <= \hbuf4$next ;
  always @(posedge clk)
    hbuf3 <= \hbuf3$next ;
  always @(posedge clk)
    hbuf2 <= \hbuf2$next ;
  always @(posedge clk)
    hbuf1 <= \hbuf1$next ;
  always @(posedge clk)
    hbuf0 <= \hbuf0$next ;
  always @(posedge clk)
    t1_t1_count <= \t1_t1_count$next ;
  always @(posedge clk)
    bp_procst <= \bp_procst$next ;
  t1 t1 (
    .clk(clk),
    .initBufferReady(t1_initBufferReady),
    .rst(rst),
    .t1_count(t1_t1_count),
    .t1_e(t1_t1_e),
    .t1_f(t1_t1_f),
    .t1_g(t1_t1_g),
    .t1_h(t1_t1_h),
    .t1_initdat(t1_t1_initdat),
    .t1_out(t1_t1_out),
    .t1_outrdy(t1_t1_outrdy)
  );
  t2 t2 (
    .t2_a(t2_t2_a),
    .t2_b(t2_t2_b),
    .t2_c(t2_t2_c),
    .t2_out(t2_t2_out)
  );
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \bp_procst$next  = bp_procst;
    (* full_case = 32'd1 *)
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          \bp_procst$next  = 4'h1;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:161" */
            1'h1:
                \bp_procst$next  = 4'h2;
          endcase
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:171" */
            1'h1:
                \bp_procst$next  = 4'h3;
          endcase
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          casez (t1_t1_outrdy)
            /* src = "shaman/blockproc.py:184" */
            1'h1:
                \bp_procst$next  = 4'h4;
          endcase
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          \bp_procst$next  = 4'h5;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          \bp_procst$next  = 4'h6;
      /* \amaranth.decoding  = "CheckBlockDone/6" */
      /* src = "shaman/blockproc.py:212" */
      4'h6:
          (* full_case = 32'd1 *)
          casez (thisIsLastUnitInBlock)
            /* src = "shaman/blockproc.py:213" */
            1'h1:
                \bp_procst$next  = 4'h7;
            /* src = "shaman/blockproc.py:215" */
            default:
                \bp_procst$next  = 4'h3;
          endcase
      /* \amaranth.decoding  = "ProcessBlockDone/7" */
      /* src = "shaman/blockproc.py:218" */
      4'h7:
          \bp_procst$next  = 4'h8;
      /* \amaranth.decoding  = "HashReady/8" */
      /* src = "shaman/blockproc.py:227" */
      4'h8:
          casez (\$1 )
            /* src = "shaman/blockproc.py:229" */
            1'h1:
                \bp_procst$next  = 4'h2;
          endcase
      /* \amaranth.decoding  = {0{1'b0}} */
      /* src = "shaman/blockproc.py:236" */
      default:
          \bp_procst$next  = 4'h0;
    endcase
    casez (newMessage)
      /* src = "shaman/blockproc.py:240" */
      1'h1:
          \bp_procst$next  = 4'h0;
    endcase
    casez (rst)
      1'h1:
          \bp_procst$next  = 4'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \t1_t1_count$next  = t1_t1_count;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:161" */
            1'h1:
                \t1_t1_count$next  = 7'h00;
          endcase
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:171" */
            1'h1:
                \t1_t1_count$next  = 7'h00;
          endcase
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          \t1_t1_count$next  = \$4 [6:0];
    endcase
    casez (rst)
      1'h1:
          \t1_t1_count$next  = 7'h00;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \hbuf0$next  = hbuf0;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:161" */
            1'h1:
                \hbuf0$next  = 32'd1779033703;
          endcase
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          /* empty */;
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          /* empty */;
      /* \amaranth.decoding  = "CheckBlockDone/6" */
      /* src = "shaman/blockproc.py:212" */
      4'h6:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockDone/7" */
      /* src = "shaman/blockproc.py:218" */
      4'h7:
          \hbuf0$next  = \$7 [31:0];
    endcase
    casez (rst)
      1'h1:
          \hbuf0$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \hbuf1$next  = hbuf1;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:161" */
            1'h1:
                \hbuf1$next  = 32'd3144134277;
          endcase
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          /* empty */;
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          /* empty */;
      /* \amaranth.decoding  = "CheckBlockDone/6" */
      /* src = "shaman/blockproc.py:212" */
      4'h6:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockDone/7" */
      /* src = "shaman/blockproc.py:218" */
      4'h7:
          \hbuf1$next  = \$10 [31:0];
    endcase
    casez (rst)
      1'h1:
          \hbuf1$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \hbuf2$next  = hbuf2;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:161" */
            1'h1:
                \hbuf2$next  = 32'd1013904242;
          endcase
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          /* empty */;
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          /* empty */;
      /* \amaranth.decoding  = "CheckBlockDone/6" */
      /* src = "shaman/blockproc.py:212" */
      4'h6:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockDone/7" */
      /* src = "shaman/blockproc.py:218" */
      4'h7:
          \hbuf2$next  = \$13 [31:0];
    endcase
    casez (rst)
      1'h1:
          \hbuf2$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \hbuf3$next  = hbuf3;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:161" */
            1'h1:
                \hbuf3$next  = 32'd2773480762;
          endcase
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          /* empty */;
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          /* empty */;
      /* \amaranth.decoding  = "CheckBlockDone/6" */
      /* src = "shaman/blockproc.py:212" */
      4'h6:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockDone/7" */
      /* src = "shaman/blockproc.py:218" */
      4'h7:
          \hbuf3$next  = \$16 [31:0];
    endcase
    casez (rst)
      1'h1:
          \hbuf3$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \hbuf4$next  = hbuf4;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:161" */
            1'h1:
                \hbuf4$next  = 32'd1359893119;
          endcase
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          /* empty */;
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          /* empty */;
      /* \amaranth.decoding  = "CheckBlockDone/6" */
      /* src = "shaman/blockproc.py:212" */
      4'h6:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockDone/7" */
      /* src = "shaman/blockproc.py:218" */
      4'h7:
          \hbuf4$next  = \$19 [31:0];
    endcase
    casez (rst)
      1'h1:
          \hbuf4$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \hbuf5$next  = hbuf5;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:161" */
            1'h1:
                \hbuf5$next  = 32'd2600822924;
          endcase
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          /* empty */;
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          /* empty */;
      /* \amaranth.decoding  = "CheckBlockDone/6" */
      /* src = "shaman/blockproc.py:212" */
      4'h6:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockDone/7" */
      /* src = "shaman/blockproc.py:218" */
      4'h7:
          \hbuf5$next  = \$22 [31:0];
    endcase
    casez (rst)
      1'h1:
          \hbuf5$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \hbuf6$next  = hbuf6;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:161" */
            1'h1:
                \hbuf6$next  = 32'd528734635;
          endcase
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          /* empty */;
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          /* empty */;
      /* \amaranth.decoding  = "CheckBlockDone/6" */
      /* src = "shaman/blockproc.py:212" */
      4'h6:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockDone/7" */
      /* src = "shaman/blockproc.py:218" */
      4'h7:
          \hbuf6$next  = \$25 [31:0];
    endcase
    casez (rst)
      1'h1:
          \hbuf6$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \hbuf7$next  = hbuf7;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:161" */
            1'h1:
                \hbuf7$next  = 32'd1541459225;
          endcase
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          /* empty */;
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          /* empty */;
      /* \amaranth.decoding  = "CheckBlockDone/6" */
      /* src = "shaman/blockproc.py:212" */
      4'h6:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockDone/7" */
      /* src = "shaman/blockproc.py:218" */
      4'h7:
          \hbuf7$next  = \$28 [31:0];
    endcase
    casez (rst)
      1'h1:
          \hbuf7$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \thisIsLastUnitInBlock$next  = thisIsLastUnitInBlock;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          /* empty */;
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:171" */
            1'h1:
                \thisIsLastUnitInBlock$next  = 1'h0;
          endcase
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          casez (\$30 )
            /* src = "shaman/blockproc.py:201" */
            1'h1:
                \thisIsLastUnitInBlock$next  = 1'h1;
          endcase
    endcase
    casez (rst)
      1'h1:
          \thisIsLastUnitInBlock$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \bp_outrdy$next  = bp_outrdy;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          /* empty */;
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:171" */
            1'h1:
                \bp_outrdy$next  = 1'h0;
          endcase
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          /* empty */;
      /* \amaranth.decoding  = "CheckBlockDone/6" */
      /* src = "shaman/blockproc.py:212" */
      4'h6:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockDone/7" */
      /* src = "shaman/blockproc.py:218" */
      4'h7:
          /* empty */;
      /* \amaranth.decoding  = "HashReady/8" */
      /* src = "shaman/blockproc.py:227" */
      4'h8:
        begin
          \bp_outrdy$next  = 1'h1;
          casez (\$32 )
            /* src = "shaman/blockproc.py:229" */
            1'h1:
                \bp_outrdy$next  = 1'h0;
          endcase
        end
    endcase
    casez (rst)
      1'h1:
          \bp_outrdy$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \bp_a$next  = bp_a;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          /* empty */;
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:171" */
            1'h1:
                \bp_a$next  = hbuf0;
          endcase
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          \bp_a$next  = \$35 [31:0];
    endcase
    casez (rst)
      1'h1:
          \bp_a$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \bp_b$next  = bp_b;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          /* empty */;
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:171" */
            1'h1:
                \bp_b$next  = hbuf1;
          endcase
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          \bp_b$next  = bp_a;
    endcase
    casez (rst)
      1'h1:
          \bp_b$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \bp_c$next  = bp_c;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          /* empty */;
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:171" */
            1'h1:
                \bp_c$next  = hbuf2;
          endcase
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          \bp_c$next  = bp_b;
    endcase
    casez (rst)
      1'h1:
          \bp_c$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \bp_d$next  = bp_d;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          /* empty */;
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:171" */
            1'h1:
                \bp_d$next  = hbuf3;
          endcase
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          \bp_d$next  = bp_c;
    endcase
    casez (rst)
      1'h1:
          \bp_d$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \bp_e$next  = bp_e;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          /* empty */;
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:171" */
            1'h1:
                \bp_e$next  = hbuf4;
          endcase
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          \bp_e$next  = \$38 [31:0];
    endcase
    casez (rst)
      1'h1:
          \bp_e$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \bp_f$next  = bp_f;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          /* empty */;
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:171" */
            1'h1:
                \bp_f$next  = hbuf5;
          endcase
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          \bp_f$next  = bp_e;
    endcase
    casez (rst)
      1'h1:
          \bp_f$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \bp_g$next  = bp_g;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          /* empty */;
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:171" */
            1'h1:
                \bp_g$next  = hbuf6;
          endcase
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          \bp_g$next  = bp_f;
    endcase
    casez (rst)
      1'h1:
          \bp_g$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \bp_h$next  = bp_h;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          /* empty */;
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          casez (doProcessBlock)
            /* src = "shaman/blockproc.py:171" */
            1'h1:
                \bp_h$next  = hbuf7;
          endcase
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          /* empty */;
      /* \amaranth.decoding  = "ProcessBlockUnit/5" */
      /* src = "shaman/blockproc.py:198" */
      4'h5:
          \bp_h$next  = bp_g;
    endcase
    casez (rst)
      1'h1:
          \bp_h$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \opT1Output$next  = opT1Output;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          /* empty */;
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          /* empty */;
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          \opT1Output$next  = t1_t1_out;
    endcase
    casez (rst)
      1'h1:
          \opT1Output$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$62 ) begin end
    \opT2Output$next  = opT2Output;
    casez (bp_procst)
      /* \amaranth.decoding  = "PowerUp/0" */
      /* src = "shaman/blockproc.py:148" */
      4'h0:
          /* empty */;
      /* \amaranth.decoding  = "NewMessageBegin/1" */
      /* src = "shaman/blockproc.py:159" */
      4'h1:
          /* empty */;
      /* \amaranth.decoding  = "NewBlockBegin/2" */
      /* src = "shaman/blockproc.py:169" */
      4'h2:
          /* empty */;
      /* \amaranth.decoding  = "WaitForReady/3" */
      /* src = "shaman/blockproc.py:183" */
      4'h3:
          /* empty */;
      /* \amaranth.decoding  = "ValueSnapShot/4" */
      /* src = "shaman/blockproc.py:189" */
      4'h4:
          \opT2Output$next  = t2_t2_out;
    endcase
    casez (rst)
      1'h1:
          \opT2Output$next  = 32'd0;
    endcase
  end
  assign \$3  = \$4 ;
  assign \$6  = \$7 ;
  assign \$9  = \$10 ;
  assign \$12  = \$13 ;
  assign \$15  = \$16 ;
  assign \$18  = \$19 ;
  assign \$21  = \$22 ;
  assign \$24  = \$25 ;
  assign \$27  = \$28 ;
  assign \$34  = \$35 ;
  assign \$37  = \$38 ;
  assign processingCount = t1_t1_count;
  assign t2_t2_c = bp_c;
  assign t2_t2_b = bp_b;
  assign t2_t2_a = bp_a;
  assign t1_t1_h = bp_h;
  assign t1_t1_g = bp_g;
  assign t1_t1_f = bp_f;
  assign t1_t1_e = bp_e;
  assign t1_t1_initdat = bp_initdat;
  assign t1_initBufferReady = initBufferReady;
endmodule

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman.shapi.blockproc.t1.wt.buf" *)
(* generator = "Amaranth" *)
module \buf ();
  wire \$empty_module_filler ;
endmodule

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman.shapi.blockproc.t1.ch" *)
(* generator = "Amaranth" *)
module ch(ch_y, ch_z, ch_out, ch_x);
  wire [31:0] \$1 ;
  wire [31:0] \$3 ;
  wire [31:0] \$5 ;
  wire [31:0] \$7 ;
  output [31:0] ch_out;
  wire [31:0] ch_out;
  input [31:0] ch_x;
  wire [31:0] ch_x;
  input [31:0] ch_y;
  wire [31:0] ch_y;
  input [31:0] ch_z;
  wire [31:0] ch_z;
  assign \$1  = ch_x & ch_y;
  assign \$3  = ~ ch_x;
  assign \$5  = \$3  & ch_z;
  assign \$7  = \$1  ^ \$5 ;
  assign ch_out = \$7 ;
endmodule

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman.shapi.blockproc.t2.maj" *)
(* generator = "Amaranth" *)
module maj(maj_y, maj_z, maj_out, maj_x);
  wire [31:0] \$1 ;
  wire [31:0] \$3 ;
  wire [31:0] \$5 ;
  wire [31:0] \$7 ;
  wire [31:0] \$9 ;
  output [31:0] maj_out;
  wire [31:0] maj_out;
  input [31:0] maj_x;
  wire [31:0] maj_x;
  input [31:0] maj_y;
  wire [31:0] maj_y;
  input [31:0] maj_z;
  wire [31:0] maj_z;
  assign \$9  = \$5  ^ \$7 ;
  assign \$1  = maj_x & maj_y;
  assign \$3  = maj_x & maj_z;
  assign \$5  = \$1  ^ \$3 ;
  assign \$7  = maj_y & maj_z;
  assign maj_out = \$9 ;
endmodule

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman.shapi.blockproc.t2.rot0" *)
(* generator = "Amaranth" *)
module rot0(rot0_out, rot0_x);
  wire [31:0] \$1 ;
  wire [31:0] \$3 ;
  wire [31:0] a;
  wire [31:0] b;
  wire [31:0] c;
  output [31:0] rot0_out;
  wire [31:0] rot0_out;
  input [31:0] rot0_x;
  wire [31:0] rot0_x;
  assign \$1  = a ^ b;
  assign \$3  = \$1  ^ c;
  assign rot0_out = \$3 ;
  assign c = { rot0_x[21:0], rot0_x[31:22] };
  assign b = { rot0_x[12:0], rot0_x[31:13] };
  assign a = { rot0_x[1:0], rot0_x[31:2] };
endmodule

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman.shapi.blockproc.t1.rot1" *)
(* generator = "Amaranth" *)
module rot1(rot1_out, rot1_x);
  wire [31:0] \$1 ;
  wire [31:0] \$3 ;
  wire [31:0] a;
  wire [31:0] b;
  wire [31:0] c;
  output [31:0] rot1_out;
  wire [31:0] rot1_out;
  input [31:0] rot1_x;
  wire [31:0] rot1_x;
  assign \$1  = a ^ b;
  assign \$3  = \$1  ^ c;
  assign rot1_out = \$3 ;
  assign c = { rot1_x[24:0], rot1_x[31:25] };
  assign b = { rot1_x[10:0], rot1_x[31:11] };
  assign a = { rot1_x[5:0], rot1_x[31:6] };
endmodule

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman.shapi.blockproc.t1.wt.s0" *)
(* generator = "Amaranth" *)
module s0(s0_out, s0_x);
  wire [31:0] \$1 ;
  wire [31:0] \$3 ;
  wire [31:0] \$5 ;
  wire [31:0] a;
  wire [31:0] b;
  wire [31:0] c;
  output [31:0] s0_out;
  wire [31:0] s0_out;
  input [31:0] s0_x;
  wire [31:0] s0_x;
  assign \$3  = a ^ b;
  assign \$5  = \$3  ^ c;
  assign s0_out = \$5 ;
  assign c = \$1 ;
  assign b = { s0_x[17:0], s0_x[31:18] };
  assign a = { s0_x[6:0], s0_x[31:7] };
  assign \$1  = { 3'h0, s0_x[31:3] };
endmodule

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman.shapi.blockproc.t1.wt.s1" *)
(* generator = "Amaranth" *)
module s1(s1_out, s1_x);
  wire [31:0] \$1 ;
  wire [31:0] \$3 ;
  wire [31:0] \$5 ;
  output [31:0] s1_out;
  wire [31:0] s1_out;
  input [31:0] s1_x;
  wire [31:0] s1_x;
  assign \$1  = { s1_x[16:0], s1_x[31:17] } ^ { s1_x[18:0], s1_x[31:19] };
  assign \$5  = \$1  ^ \$3 ;
  assign s1_out = \$5 ;
  assign \$3  = { 10'h000, s1_x[31:10] };
endmodule

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman.shapi" *)
(* generator = "Amaranth" *)
module shapi(rst, databyteIn, resultbyteOut, resultReady, beginProcessingDataBlock, parallelLoading, resultNext, busy, processingReceivedDataBlock, start, clockinData, clk);
  reg \$auto$verilog_backend.cc:2083:dump_module$63  = 0;
  wire \$1 ;
  wire [5:0] \$10 ;
  wire \$100 ;
  wire \$102 ;
  wire \$104 ;
  wire \$106 ;
  wire \$108 ;
  wire \$110 ;
  wire \$112 ;
  wire \$114 ;
  wire \$116 ;
  wire \$118 ;
  wire \$12 ;
  wire \$120 ;
  wire \$122 ;
  wire \$124 ;
  wire \$126 ;
  wire \$128 ;
  wire \$130 ;
  wire \$132 ;
  wire \$134 ;
  wire \$136 ;
  wire \$138 ;
  wire [6:0] \$14 ;
  wire \$140 ;
  wire \$142 ;
  wire \$144 ;
  wire \$146 ;
  wire \$148 ;
  wire \$150 ;
  wire \$152 ;
  wire \$154 ;
  wire \$156 ;
  wire \$158 ;
  wire \$16 ;
  wire \$160 ;
  wire \$162 ;
  wire \$164 ;
  wire \$166 ;
  wire \$168 ;
  wire \$170 ;
  wire \$172 ;
  wire \$174 ;
  wire \$176 ;
  wire \$178 ;
  wire \$18 ;
  wire \$180 ;
  wire \$182 ;
  wire \$184 ;
  wire \$186 ;
  wire \$188 ;
  wire \$190 ;
  wire \$192 ;
  wire \$194 ;
  wire \$196 ;
  wire \$198 ;
  wire \$2 ;
  wire \$20 ;
  wire \$200 ;
  wire \$202 ;
  wire \$204 ;
  wire \$206 ;
  wire \$208 ;
  wire \$210 ;
  wire \$212 ;
  wire \$214 ;
  wire \$216 ;
  wire \$218 ;
  wire \$22 ;
  wire \$220 ;
  wire \$222 ;
  wire \$224 ;
  wire \$226 ;
  wire \$228 ;
  wire \$230 ;
  wire \$232 ;
  wire \$234 ;
  wire \$236 ;
  wire \$238 ;
  wire \$24 ;
  wire \$240 ;
  wire \$242 ;
  wire \$244 ;
  wire \$246 ;
  wire \$248 ;
  wire \$250 ;
  wire \$252 ;
  wire \$254 ;
  wire \$256 ;
  wire \$258 ;
  wire \$26 ;
  wire \$260 ;
  wire \$262 ;
  wire \$264 ;
  wire \$266 ;
  wire \$268 ;
  wire \$270 ;
  wire \$272 ;
  wire \$274 ;
  wire \$276 ;
  wire \$278 ;
  wire [7:0] \$28 ;
  wire \$280 ;
  wire \$282 ;
  wire \$284 ;
  wire \$286 ;
  wire \$288 ;
  wire [7:0] \$29 ;
  wire \$290 ;
  wire \$292 ;
  wire \$294 ;
  wire \$296 ;
  wire \$298 ;
  wire \$300 ;
  wire \$302 ;
  wire \$304 ;
  wire \$306 ;
  wire \$308 ;
  wire \$31 ;
  wire \$310 ;
  wire \$312 ;
  wire \$314 ;
  wire \$316 ;
  wire \$318 ;
  wire \$320 ;
  wire \$322 ;
  wire \$324 ;
  wire [6:0] \$326 ;
  wire \$328 ;
  wire \$33 ;
  wire \$330 ;
  wire \$332 ;
  wire \$334 ;
  wire \$336 ;
  wire \$338 ;
  wire \$340 ;
  wire \$342 ;
  wire \$344 ;
  wire \$346 ;
  wire [6:0] \$348 ;
  wire \$35 ;
  wire \$350 ;
  wire \$352 ;
  wire \$354 ;
  wire \$356 ;
  wire \$358 ;
  wire \$360 ;
  wire \$362 ;
  wire \$364 ;
  wire \$366 ;
  wire \$368 ;
  wire [7:0] \$37 ;
  wire \$370 ;
  wire [6:0] \$372 ;
  wire \$374 ;
  wire \$376 ;
  wire \$378 ;
  wire [7:0] \$38 ;
  wire \$380 ;
  wire \$382 ;
  wire \$384 ;
  wire \$386 ;
  wire \$40 ;
  wire [6:0] \$42 ;
  wire \$44 ;
  wire \$46 ;
  wire \$48 ;
  wire \$5 ;
  wire \$50 ;
  wire \$52 ;
  wire \$54 ;
  wire \$56 ;
  wire \$58 ;
  wire \$60 ;
  wire \$62 ;
  wire \$64 ;
  wire \$66 ;
  wire \$68 ;
  wire \$7 ;
  wire \$70 ;
  wire \$72 ;
  wire \$74 ;
  wire \$76 ;
  wire \$78 ;
  wire \$80 ;
  wire \$82 ;
  wire \$84 ;
  wire \$86 ;
  wire \$88 ;
  wire [5:0] \$9 ;
  wire \$90 ;
  wire \$92 ;
  wire \$94 ;
  wire \$96 ;
  wire \$98 ;
  reg [511:0] apibuf = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  reg [511:0] \apibuf$next ;
  output beginProcessingDataBlock;
  reg beginProcessingDataBlock = 1'h0;
  reg \beginProcessingDataBlock$next ;
  reg [511:0] blockproc_bp_initdat = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  reg [511:0] \blockproc_bp_initdat$next ;
  wire blockproc_bp_outrdy;
  reg blockproc_doProcessBlock = 1'h0;
  reg \blockproc_doProcessBlock$next ;
  wire [31:0] blockproc_hbuf0;
  wire [31:0] blockproc_hbuf1;
  wire [31:0] blockproc_hbuf2;
  wire [31:0] blockproc_hbuf3;
  wire [31:0] blockproc_hbuf4;
  wire [31:0] blockproc_hbuf5;
  wire [31:0] blockproc_hbuf6;
  wire [31:0] blockproc_hbuf7;
  reg blockproc_initBufferReady = 1'h0;
  reg \blockproc_initBufferReady$next ;
  wire blockproc_newMessage;
  wire [6:0] blockproc_processingCount;
  output busy;
  reg busy = 1'h0;
  reg \busy$next ;
  input clk;
  wire clk;
  input clockinData;
  wire clockinData;
  reg dataInSeen = 1'h0;
  reg \dataInSeen$next ;
  input [7:0] databyteIn;
  wire [7:0] databyteIn;
  input parallelLoading;
  wire parallelLoading;
  output processingReceivedDataBlock;
  reg processingReceivedDataBlock = 1'h0;
  reg \processingReceivedDataBlock$next ;
  reg resultIncrementSeen = 1'h0;
  reg \resultIncrementSeen$next ;
  reg [4:0] resultIndex = 5'h00;
  reg [4:0] \resultIndex$next ;
  input resultNext;
  wire resultNext;
  output resultReady;
  wire resultReady;
  output [7:0] resultbyteOut;
  reg [7:0] resultbyteOut = 8'h00;
  reg [7:0] \resultbyteOut$next ;
  input rst;
  wire rst;
  reg [6:0] slotsByteIndex = 7'h00;
  reg [6:0] \slotsByteIndex$next ;
  input start;
  wire start;
  assign \$100  = slotsByteIndex == 5'h16;
  assign \$102  = slotsByteIndex == 5'h17;
  assign \$104  = slotsByteIndex == 5'h18;
  assign \$106  = slotsByteIndex == 5'h19;
  assign \$108  = slotsByteIndex == 5'h1a;
  assign \$10  = resultIndex + 1'h1;
  assign \$110  = slotsByteIndex == 5'h1b;
  assign \$112  = slotsByteIndex == 5'h1c;
  assign \$114  = slotsByteIndex == 5'h1d;
  assign \$116  = slotsByteIndex == 5'h1e;
  assign \$118  = slotsByteIndex == 5'h1f;
  assign \$120  = slotsByteIndex == 6'h20;
  assign \$122  = slotsByteIndex == 6'h21;
  assign \$124  = slotsByteIndex == 6'h22;
  assign \$126  = slotsByteIndex == 6'h23;
  assign \$128  = slotsByteIndex == 6'h24;
  assign \$12  = beginProcessingDataBlock | processingReceivedDataBlock;
  assign \$130  = slotsByteIndex == 6'h25;
  assign \$132  = slotsByteIndex == 6'h26;
  assign \$134  = slotsByteIndex == 6'h27;
  assign \$136  = slotsByteIndex == 6'h28;
  assign \$138  = slotsByteIndex == 6'h29;
  assign \$140  = slotsByteIndex == 6'h2a;
  assign \$142  = slotsByteIndex == 6'h2b;
  assign \$144  = slotsByteIndex == 6'h2c;
  assign \$146  = slotsByteIndex == 6'h2d;
  assign \$148  = slotsByteIndex == 6'h2e;
  assign \$14  = blockproc_processingCount & 6'h3f;
  assign \$150  = slotsByteIndex == 6'h2f;
  assign \$152  = slotsByteIndex == 6'h30;
  assign \$154  = slotsByteIndex == 6'h31;
  assign \$156  = slotsByteIndex == 6'h32;
  assign \$158  = slotsByteIndex == 6'h33;
  assign \$160  = slotsByteIndex == 6'h34;
  assign \$162  = slotsByteIndex == 6'h35;
  assign \$164  = slotsByteIndex == 6'h36;
  assign \$166  = slotsByteIndex == 6'h37;
  assign \$168  = slotsByteIndex == 6'h38;
  assign \$16  = \$14  < 2'h2;
  assign \$170  = slotsByteIndex == 6'h39;
  assign \$172  = slotsByteIndex == 6'h3a;
  assign \$174  = slotsByteIndex == 6'h3b;
  assign \$176  = slotsByteIndex == 6'h3c;
  assign \$178  = slotsByteIndex == 6'h3d;
  assign \$180  = slotsByteIndex == 6'h3e;
  assign \$182  = slotsByteIndex == 6'h3f;
  assign \$184  = ~ clockinData;
  assign \$186  = ~ dataInSeen;
  assign \$188  = slotsByteIndex == 6'h3f;
  assign \$18  = beginProcessingDataBlock | \$16 ;
  assign \$190  = ! slotsByteIndex;
  assign \$192  = slotsByteIndex == 1'h1;
  assign \$194  = slotsByteIndex == 2'h2;
  assign \$196  = slotsByteIndex == 2'h3;
  assign \$198  = slotsByteIndex == 3'h4;
  assign \$200  = slotsByteIndex == 3'h5;
  assign \$202  = slotsByteIndex == 3'h6;
  assign \$204  = slotsByteIndex == 3'h7;
  assign \$206  = slotsByteIndex == 4'h8;
  assign \$208  = slotsByteIndex == 4'h9;
  assign \$20  = slotsByteIndex < 6'h3d;
  assign \$210  = slotsByteIndex == 4'ha;
  assign \$212  = slotsByteIndex == 4'hb;
  assign \$214  = slotsByteIndex == 4'hc;
  assign \$216  = slotsByteIndex == 4'hd;
  assign \$218  = slotsByteIndex == 4'he;
  assign \$220  = slotsByteIndex == 4'hf;
  assign \$222  = slotsByteIndex == 5'h10;
  assign \$224  = slotsByteIndex == 5'h11;
  assign \$226  = slotsByteIndex == 5'h12;
  assign \$228  = slotsByteIndex == 5'h13;
  assign \$22  = ~ clockinData;
  assign \$230  = slotsByteIndex == 5'h14;
  assign \$232  = slotsByteIndex == 5'h15;
  assign \$234  = slotsByteIndex == 5'h16;
  assign \$236  = slotsByteIndex == 5'h17;
  assign \$238  = slotsByteIndex == 5'h18;
  assign \$240  = slotsByteIndex == 5'h19;
  assign \$242  = slotsByteIndex == 5'h1a;
  assign \$244  = slotsByteIndex == 5'h1b;
  assign \$246  = slotsByteIndex == 5'h1c;
  assign \$248  = slotsByteIndex == 5'h1d;
  assign \$24  = ~ dataInSeen;
  assign \$250  = slotsByteIndex == 5'h1e;
  assign \$252  = slotsByteIndex == 5'h1f;
  assign \$254  = slotsByteIndex == 6'h20;
  assign \$256  = slotsByteIndex == 6'h21;
  assign \$258  = slotsByteIndex == 6'h22;
  assign \$260  = slotsByteIndex == 6'h23;
  assign \$262  = slotsByteIndex == 6'h24;
  assign \$264  = slotsByteIndex == 6'h25;
  assign \$266  = slotsByteIndex == 6'h26;
  assign \$268  = slotsByteIndex == 6'h27;
  assign \$26  = slotsByteIndex == 6'h3f;
  assign \$270  = slotsByteIndex == 6'h28;
  assign \$272  = slotsByteIndex == 6'h29;
  assign \$274  = slotsByteIndex == 6'h2a;
  assign \$276  = slotsByteIndex == 6'h2b;
  assign \$278  = slotsByteIndex == 6'h2c;
  assign \$280  = slotsByteIndex == 6'h2d;
  assign \$282  = slotsByteIndex == 6'h2e;
  assign \$284  = slotsByteIndex == 6'h2f;
  assign \$286  = slotsByteIndex == 6'h30;
  assign \$288  = slotsByteIndex == 6'h31;
  assign \$290  = slotsByteIndex == 6'h32;
  assign \$292  = slotsByteIndex == 6'h33;
  assign \$294  = slotsByteIndex == 6'h34;
  assign \$296  = slotsByteIndex == 6'h35;
  assign \$298  = slotsByteIndex == 6'h36;
  assign \$2  = beginProcessingDataBlock | processingReceivedDataBlock;
  assign \$29  = slotsByteIndex + 1'h1;
  assign \$300  = slotsByteIndex == 6'h37;
  assign \$302  = slotsByteIndex == 6'h38;
  assign \$304  = slotsByteIndex == 6'h39;
  assign \$306  = slotsByteIndex == 6'h3a;
  assign \$308  = slotsByteIndex == 6'h3b;
  assign \$310  = slotsByteIndex == 6'h3c;
  assign \$312  = slotsByteIndex == 6'h3d;
  assign \$314  = slotsByteIndex == 6'h3e;
  assign \$316  = slotsByteIndex == 6'h3f;
  assign \$318  = beginProcessingDataBlock | processingReceivedDataBlock;
  assign \$31  = ~ clockinData;
  assign \$320  = beginProcessingDataBlock | processingReceivedDataBlock;
  assign \$322  = beginProcessingDataBlock | processingReceivedDataBlock;
  assign \$324  = beginProcessingDataBlock | processingReceivedDataBlock;
  assign \$326  = blockproc_processingCount & 6'h3f;
  assign \$328  = \$326  < 2'h2;
  assign \$330  = beginProcessingDataBlock | \$328 ;
  assign \$332  = slotsByteIndex < 6'h3d;
  assign \$334  = ~ clockinData;
  assign \$336  = ~ dataInSeen;
  assign \$338  = slotsByteIndex == 6'h3f;
  assign \$33  = ~ dataInSeen;
  assign \$340  = ~ clockinData;
  assign \$342  = ~ dataInSeen;
  assign \$344  = slotsByteIndex == 6'h3f;
  assign \$346  = beginProcessingDataBlock | processingReceivedDataBlock;
  assign \$348  = blockproc_processingCount & 6'h3f;
  assign \$350  = \$348  < 2'h2;
  assign \$352  = beginProcessingDataBlock | \$350 ;
  assign \$354  = slotsByteIndex < 6'h3d;
  assign \$356  = ~ clockinData;
  assign \$358  = ~ dataInSeen;
  assign \$35  = slotsByteIndex == 6'h3f;
  assign \$360  = slotsByteIndex == 6'h3f;
  assign \$362  = ~ clockinData;
  assign \$364  = ~ dataInSeen;
  assign \$366  = slotsByteIndex == 6'h3f;
  assign \$368  = beginProcessingDataBlock | processingReceivedDataBlock;
  assign \$370  = beginProcessingDataBlock | processingReceivedDataBlock;
  assign \$372  = blockproc_processingCount & 6'h3f;
  assign \$374  = \$372  < 2'h2;
  assign \$376  = beginProcessingDataBlock | \$374 ;
  assign \$378  = slotsByteIndex < 6'h3d;
  assign \$380  = ~ clockinData;
  assign \$382  = ~ dataInSeen;
  assign \$384  = ~ clockinData;
  assign \$386  = ~ dataInSeen;
  assign \$38  = slotsByteIndex + 1'h1;
  assign \$1  = ~ \$2 ;
  assign \$40  = beginProcessingDataBlock | processingReceivedDataBlock;
  assign \$42  = blockproc_processingCount & 6'h3f;
  assign \$44  = \$42  < 2'h2;
  assign \$46  = beginProcessingDataBlock | \$44 ;
  assign \$48  = slotsByteIndex < 6'h3d;
  assign \$50  = ~ clockinData;
  assign \$52  = ~ dataInSeen;
  assign \$54  = slotsByteIndex == 6'h3f;
  assign \$56  = ! slotsByteIndex;
  assign \$58  = slotsByteIndex == 1'h1;
  assign \$5  = ~ resultIncrementSeen;
  assign \$60  = slotsByteIndex == 2'h2;
  assign \$62  = slotsByteIndex == 2'h3;
  assign \$64  = slotsByteIndex == 3'h4;
  assign \$66  = slotsByteIndex == 3'h5;
  assign \$68  = slotsByteIndex == 3'h6;
  assign \$70  = slotsByteIndex == 3'h7;
  assign \$72  = slotsByteIndex == 4'h8;
  assign \$74  = slotsByteIndex == 4'h9;
  assign \$76  = slotsByteIndex == 4'ha;
  assign \$78  = slotsByteIndex == 4'hb;
  assign \$7  = ~ resultIncrementSeen;
  assign \$80  = slotsByteIndex == 4'hc;
  assign \$82  = slotsByteIndex == 4'hd;
  assign \$84  = slotsByteIndex == 4'he;
  assign \$86  = slotsByteIndex == 4'hf;
  assign \$88  = slotsByteIndex == 5'h10;
  assign \$90  = slotsByteIndex == 5'h11;
  assign \$92  = slotsByteIndex == 5'h12;
  assign \$94  = slotsByteIndex == 5'h13;
  assign \$96  = slotsByteIndex == 5'h14;
  assign \$98  = slotsByteIndex == 5'h15;
  always @(posedge clk)
    dataInSeen <= \dataInSeen$next ;
  always @(posedge clk)
    resultbyteOut <= \resultbyteOut$next ;
  always @(posedge clk)
    resultIndex <= \resultIndex$next ;
  always @(posedge clk)
    resultIncrementSeen <= \resultIncrementSeen$next ;
  always @(posedge clk)
    blockproc_bp_initdat <= \blockproc_bp_initdat$next ;
  always @(posedge clk)
    busy <= \busy$next ;
  always @(posedge clk)
    beginProcessingDataBlock <= \beginProcessingDataBlock$next ;
  always @(posedge clk)
    processingReceivedDataBlock <= \processingReceivedDataBlock$next ;
  always @(posedge clk)
    blockproc_doProcessBlock <= \blockproc_doProcessBlock$next ;
  always @(posedge clk)
    blockproc_initBufferReady <= \blockproc_initBufferReady$next ;
  always @(posedge clk)
    apibuf <= \apibuf$next ;
  always @(posedge clk)
    slotsByteIndex <= \slotsByteIndex$next ;
  blockproc blockproc (
    .bp_initdat(blockproc_bp_initdat),
    .bp_outrdy(blockproc_bp_outrdy),
    .clk(clk),
    .doProcessBlock(blockproc_doProcessBlock),
    .hbuf0(blockproc_hbuf0),
    .hbuf1(blockproc_hbuf1),
    .hbuf2(blockproc_hbuf2),
    .hbuf3(blockproc_hbuf3),
    .hbuf4(blockproc_hbuf4),
    .hbuf5(blockproc_hbuf5),
    .hbuf6(blockproc_hbuf6),
    .hbuf7(blockproc_hbuf7),
    .initBufferReady(blockproc_initBufferReady),
    .newMessage(blockproc_newMessage),
    .processingCount(blockproc_processingCount),
    .rst(rst)
  );
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$63 ) begin end
    \beginProcessingDataBlock$next  = beginProcessingDataBlock;
    (* full_case = 32'd1 *)
    casez (start)
      /* src = "shaman/api.py:198" */
      1'h1:
          \beginProcessingDataBlock$next  = 1'h0;
      /* src = "shaman/api.py:209" */
      default:
          (* full_case = 32'd1 *)
          casez (\$324 )
            /* src = "shaman/api.py:213" */
            1'h1:
              begin
                casez (beginProcessingDataBlock)
                  /* src = "shaman/api.py:81" */
                  1'h1:
                      \beginProcessingDataBlock$next  = 1'h0;
                endcase
                casez (parallelLoading)
                  /* src = "shaman/api.py:216" */
                  1'h1:
                      casez ({ \$332 , \$330  })
                        /* src = "shaman/api.py:217" */
                        2'b?1:
                            /* empty */;
                        /* src = "shaman/api.py:219" */
                        2'b1?:
                            (* full_case = 32'd1 *)
                            casez (\$334 )
                              /* src = "shaman/api.py:107" */
                              1'h1:
                                  /* empty */;
                              /* src = "shaman/api.py:112" */
                              default:
                                  casez (\$336 )
                                    /* src = "shaman/api.py:115" */
                                    1'h1:
                                        casez (\$338 )
                                          /* src = "shaman/api.py:122" */
                                          1'h1:
                                              \beginProcessingDataBlock$next  = 1'h1;
                                        endcase
                                  endcase
                            endcase
                      endcase
                endcase
              end
            /* src = "shaman/api.py:226" */
            default:
                (* full_case = 32'd1 *)
                casez (\$340 )
                  /* src = "shaman/api.py:107" */
                  1'h1:
                      /* empty */;
                  /* src = "shaman/api.py:112" */
                  default:
                      casez (\$342 )
                        /* src = "shaman/api.py:115" */
                        1'h1:
                            casez (\$344 )
                              /* src = "shaman/api.py:122" */
                              1'h1:
                                  \beginProcessingDataBlock$next  = 1'h1;
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \beginProcessingDataBlock$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$63 ) begin end
    \busy$next  = busy;
    (* full_case = 32'd1 *)
    casez (start)
      /* src = "shaman/api.py:198" */
      1'h1:
          \busy$next  = 1'h0;
      /* src = "shaman/api.py:209" */
      default:
          (* full_case = 32'd1 *)
          casez (\$346 )
            /* src = "shaman/api.py:213" */
            1'h1:
                casez (parallelLoading)
                  /* src = "shaman/api.py:216" */
                  1'h1:
                      (* full_case = 32'd1 *)
                      casez ({ \$354 , \$352  })
                        /* src = "shaman/api.py:217" */
                        2'b?1:
                            \busy$next  = 1'h1;
                        /* src = "shaman/api.py:219" */
                        2'b1?:
                          begin
                            \busy$next  = 1'h0;
                            (* full_case = 32'd1 *)
                            casez (\$356 )
                              /* src = "shaman/api.py:107" */
                              1'h1:
                                  /* empty */;
                              /* src = "shaman/api.py:112" */
                              default:
                                  casez (\$358 )
                                    /* src = "shaman/api.py:115" */
                                    1'h1:
                                        casez (\$360 )
                                          /* src = "shaman/api.py:122" */
                                          1'h1:
                                              \busy$next  = 1'h1;
                                        endcase
                                  endcase
                            endcase
                          end
                        /* src = "shaman/api.py:222" */
                        default:
                            \busy$next  = 1'h1;
                      endcase
                endcase
            /* src = "shaman/api.py:226" */
            default:
              begin
                \busy$next  = 1'h0;
                (* full_case = 32'd1 *)
                casez (\$362 )
                  /* src = "shaman/api.py:107" */
                  1'h1:
                      /* empty */;
                  /* src = "shaman/api.py:112" */
                  default:
                      casez (\$364 )
                        /* src = "shaman/api.py:115" */
                        1'h1:
                            casez (\$366 )
                              /* src = "shaman/api.py:122" */
                              1'h1:
                                  \busy$next  = 1'h1;
                            endcase
                      endcase
                endcase
              end
          endcase
    endcase
    casez (rst)
      1'h1:
          \busy$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$63 ) begin end
    \blockproc_bp_initdat$next  = blockproc_bp_initdat;
    (* full_case = 32'd1 *)
    casez (start)
      /* src = "shaman/api.py:198" */
      1'h1:
          /* empty */;
      /* src = "shaman/api.py:209" */
      default:
          casez (\$368 )
            /* src = "shaman/api.py:213" */
            1'h1:
                casez (beginProcessingDataBlock)
                  /* src = "shaman/api.py:81" */
                  1'h1:
                      \blockproc_bp_initdat$next  = apibuf;
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \blockproc_bp_initdat$next  = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$63 ) begin end
    \dataInSeen$next  = dataInSeen;
    (* full_case = 32'd1 *)
    casez (start)
      /* src = "shaman/api.py:198" */
      1'h1:
          /* empty */;
      /* src = "shaman/api.py:209" */
      default:
          (* full_case = 32'd1 *)
          casez (\$370 )
            /* src = "shaman/api.py:213" */
            1'h1:
                casez (parallelLoading)
                  /* src = "shaman/api.py:216" */
                  1'h1:
                      casez ({ \$378 , \$376  })
                        /* src = "shaman/api.py:217" */
                        2'b?1:
                            /* empty */;
                        /* src = "shaman/api.py:219" */
                        2'b1?:
                            (* full_case = 32'd1 *)
                            casez (\$380 )
                              /* src = "shaman/api.py:107" */
                              1'h1:
                                  \dataInSeen$next  = 1'h0;
                              /* src = "shaman/api.py:112" */
                              default:
                                  casez (\$382 )
                                    /* src = "shaman/api.py:115" */
                                    1'h1:
                                        \dataInSeen$next  = 1'h1;
                                  endcase
                            endcase
                      endcase
                endcase
            /* src = "shaman/api.py:226" */
            default:
                (* full_case = 32'd1 *)
                casez (\$384 )
                  /* src = "shaman/api.py:107" */
                  1'h1:
                      \dataInSeen$next  = 1'h0;
                  /* src = "shaman/api.py:112" */
                  default:
                      casez (\$386 )
                        /* src = "shaman/api.py:115" */
                        1'h1:
                            \dataInSeen$next  = 1'h1;
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \dataInSeen$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$63 ) begin end
    \resultIncrementSeen$next  = resultIncrementSeen;
    (* full_case = 32'd1 *)
    casez (resultNext)
      /* src = "shaman/api.py:165" */
      1'h1:
          casez (\$5 )
            /* src = "shaman/api.py:166" */
            1'h1:
                \resultIncrementSeen$next  = 1'h1;
          endcase
      /* src = "shaman/api.py:172" */
      default:
          \resultIncrementSeen$next  = 1'h0;
    endcase
    casez (rst)
      1'h1:
          \resultIncrementSeen$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$63 ) begin end
    \resultIndex$next  = resultIndex;
    casez (resultNext)
      /* src = "shaman/api.py:165" */
      1'h1:
          casez (\$7 )
            /* src = "shaman/api.py:166" */
            1'h1:
                \resultIndex$next  = \$10 [4:0];
          endcase
    endcase
    casez (start)
      /* src = "shaman/api.py:198" */
      1'h1:
          \resultIndex$next  = 5'h00;
    endcase
    casez (rst)
      1'h1:
          \resultIndex$next  = 5'h00;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$63 ) begin end
    (* full_case = 32'd1 *)
    casez (resultIndex)
      /* src = "shaman/api.py:149" */
      5'h00:
          \resultbyteOut$next  = blockproc_hbuf0[31:24];
      /* src = "shaman/api.py:149" */
      5'h01:
          \resultbyteOut$next  = blockproc_hbuf0[23:16];
      /* src = "shaman/api.py:149" */
      5'h02:
          \resultbyteOut$next  = blockproc_hbuf0[15:8];
      /* src = "shaman/api.py:149" */
      5'h03:
          \resultbyteOut$next  = blockproc_hbuf0[7:0];
      /* src = "shaman/api.py:149" */
      5'h04:
          \resultbyteOut$next  = blockproc_hbuf1[31:24];
      /* src = "shaman/api.py:149" */
      5'h05:
          \resultbyteOut$next  = blockproc_hbuf1[23:16];
      /* src = "shaman/api.py:149" */
      5'h06:
          \resultbyteOut$next  = blockproc_hbuf1[15:8];
      /* src = "shaman/api.py:149" */
      5'h07:
          \resultbyteOut$next  = blockproc_hbuf1[7:0];
      /* src = "shaman/api.py:149" */
      5'h08:
          \resultbyteOut$next  = blockproc_hbuf2[31:24];
      /* src = "shaman/api.py:149" */
      5'h09:
          \resultbyteOut$next  = blockproc_hbuf2[23:16];
      /* src = "shaman/api.py:149" */
      5'h0a:
          \resultbyteOut$next  = blockproc_hbuf2[15:8];
      /* src = "shaman/api.py:149" */
      5'h0b:
          \resultbyteOut$next  = blockproc_hbuf2[7:0];
      /* src = "shaman/api.py:149" */
      5'h0c:
          \resultbyteOut$next  = blockproc_hbuf3[31:24];
      /* src = "shaman/api.py:149" */
      5'h0d:
          \resultbyteOut$next  = blockproc_hbuf3[23:16];
      /* src = "shaman/api.py:149" */
      5'h0e:
          \resultbyteOut$next  = blockproc_hbuf3[15:8];
      /* src = "shaman/api.py:149" */
      5'h0f:
          \resultbyteOut$next  = blockproc_hbuf3[7:0];
      /* src = "shaman/api.py:149" */
      5'h10:
          \resultbyteOut$next  = blockproc_hbuf4[31:24];
      /* src = "shaman/api.py:149" */
      5'h11:
          \resultbyteOut$next  = blockproc_hbuf4[23:16];
      /* src = "shaman/api.py:149" */
      5'h12:
          \resultbyteOut$next  = blockproc_hbuf4[15:8];
      /* src = "shaman/api.py:149" */
      5'h13:
          \resultbyteOut$next  = blockproc_hbuf4[7:0];
      /* src = "shaman/api.py:149" */
      5'h14:
          \resultbyteOut$next  = blockproc_hbuf5[31:24];
      /* src = "shaman/api.py:149" */
      5'h15:
          \resultbyteOut$next  = blockproc_hbuf5[23:16];
      /* src = "shaman/api.py:149" */
      5'h16:
          \resultbyteOut$next  = blockproc_hbuf5[15:8];
      /* src = "shaman/api.py:149" */
      5'h17:
          \resultbyteOut$next  = blockproc_hbuf5[7:0];
      /* src = "shaman/api.py:149" */
      5'h18:
          \resultbyteOut$next  = blockproc_hbuf6[31:24];
      /* src = "shaman/api.py:149" */
      5'h19:
          \resultbyteOut$next  = blockproc_hbuf6[23:16];
      /* src = "shaman/api.py:149" */
      5'h1a:
          \resultbyteOut$next  = blockproc_hbuf6[15:8];
      /* src = "shaman/api.py:149" */
      5'h1b:
          \resultbyteOut$next  = blockproc_hbuf6[7:0];
      /* src = "shaman/api.py:149" */
      5'h1c:
          \resultbyteOut$next  = blockproc_hbuf7[31:24];
      /* src = "shaman/api.py:149" */
      5'h1d:
          \resultbyteOut$next  = blockproc_hbuf7[23:16];
      /* src = "shaman/api.py:149" */
      5'h1e:
          \resultbyteOut$next  = blockproc_hbuf7[15:8];
      /* src = "shaman/api.py:149" */
      5'h1f:
          \resultbyteOut$next  = blockproc_hbuf7[7:0];
    endcase
    casez (rst)
      1'h1:
          \resultbyteOut$next  = 8'h00;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$63 ) begin end
    \slotsByteIndex$next  = slotsByteIndex;
    (* full_case = 32'd1 *)
    casez (start)
      /* src = "shaman/api.py:198" */
      1'h1:
          \slotsByteIndex$next  = 7'h00;
      /* src = "shaman/api.py:209" */
      default:
          (* full_case = 32'd1 *)
          casez (\$12 )
            /* src = "shaman/api.py:213" */
            1'h1:
                casez (parallelLoading)
                  /* src = "shaman/api.py:216" */
                  1'h1:
                      casez ({ \$20 , \$18  })
                        /* src = "shaman/api.py:217" */
                        2'b?1:
                            /* empty */;
                        /* src = "shaman/api.py:219" */
                        2'b1?:
                            (* full_case = 32'd1 *)
                            casez (\$22 )
                              /* src = "shaman/api.py:107" */
                              1'h1:
                                  /* empty */;
                              /* src = "shaman/api.py:112" */
                              default:
                                  casez (\$24 )
                                    /* src = "shaman/api.py:115" */
                                    1'h1:
                                        (* full_case = 32'd1 *)
                                        casez (\$26 )
                                          /* src = "shaman/api.py:122" */
                                          1'h1:
                                              \slotsByteIndex$next  = 7'h00;
                                          /* src = "shaman/api.py:131" */
                                          default:
                                              \slotsByteIndex$next  = \$29 [6:0];
                                        endcase
                                  endcase
                            endcase
                      endcase
                endcase
            /* src = "shaman/api.py:226" */
            default:
                (* full_case = 32'd1 *)
                casez (\$31 )
                  /* src = "shaman/api.py:107" */
                  1'h1:
                      /* empty */;
                  /* src = "shaman/api.py:112" */
                  default:
                      casez (\$33 )
                        /* src = "shaman/api.py:115" */
                        1'h1:
                            (* full_case = 32'd1 *)
                            casez (\$35 )
                              /* src = "shaman/api.py:122" */
                              1'h1:
                                  \slotsByteIndex$next  = 7'h00;
                              /* src = "shaman/api.py:131" */
                              default:
                                  \slotsByteIndex$next  = \$38 [6:0];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \slotsByteIndex$next  = 7'h00;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$63 ) begin end
    \apibuf$next  = apibuf;
    (* full_case = 32'd1 *)
    casez (start)
      /* src = "shaman/api.py:198" */
      1'h1:
          \apibuf$next  = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      /* src = "shaman/api.py:209" */
      default:
          (* full_case = 32'd1 *)
          casez (\$40 )
            /* src = "shaman/api.py:213" */
            1'h1:
                casez (parallelLoading)
                  /* src = "shaman/api.py:216" */
                  1'h1:
                      casez ({ \$48 , \$46  })
                        /* src = "shaman/api.py:217" */
                        2'b?1:
                            /* empty */;
                        /* src = "shaman/api.py:219" */
                        2'b1?:
                            (* full_case = 32'd1 *)
                            casez (\$50 )
                              /* src = "shaman/api.py:107" */
                              1'h1:
                                  /* empty */;
                              /* src = "shaman/api.py:112" */
                              default:
                                  casez (\$52 )
                                    /* src = "shaman/api.py:115" */
                                    1'h1:
                                        (* full_case = 32'd1 *)
                                        casez (\$54 )
                                          /* src = "shaman/api.py:122" */
                                          1'h1:
                                              \apibuf$next [7:0] = databyteIn;
                                          /* src = "shaman/api.py:131" */
                                          default:
                                            begin
                                              casez (\$56 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [511:504] = databyteIn;
                                              endcase
                                              casez (\$58 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [503:496] = databyteIn;
                                              endcase
                                              casez (\$60 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [495:488] = databyteIn;
                                              endcase
                                              casez (\$62 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [487:480] = databyteIn;
                                              endcase
                                              casez (\$64 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [479:472] = databyteIn;
                                              endcase
                                              casez (\$66 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [471:464] = databyteIn;
                                              endcase
                                              casez (\$68 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [463:456] = databyteIn;
                                              endcase
                                              casez (\$70 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [455:448] = databyteIn;
                                              endcase
                                              casez (\$72 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [447:440] = databyteIn;
                                              endcase
                                              casez (\$74 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [439:432] = databyteIn;
                                              endcase
                                              casez (\$76 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [431:424] = databyteIn;
                                              endcase
                                              casez (\$78 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [423:416] = databyteIn;
                                              endcase
                                              casez (\$80 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [415:408] = databyteIn;
                                              endcase
                                              casez (\$82 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [407:400] = databyteIn;
                                              endcase
                                              casez (\$84 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [399:392] = databyteIn;
                                              endcase
                                              casez (\$86 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [391:384] = databyteIn;
                                              endcase
                                              casez (\$88 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [383:376] = databyteIn;
                                              endcase
                                              casez (\$90 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [375:368] = databyteIn;
                                              endcase
                                              casez (\$92 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [367:360] = databyteIn;
                                              endcase
                                              casez (\$94 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [359:352] = databyteIn;
                                              endcase
                                              casez (\$96 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [351:344] = databyteIn;
                                              endcase
                                              casez (\$98 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [343:336] = databyteIn;
                                              endcase
                                              casez (\$100 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [335:328] = databyteIn;
                                              endcase
                                              casez (\$102 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [327:320] = databyteIn;
                                              endcase
                                              casez (\$104 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [319:312] = databyteIn;
                                              endcase
                                              casez (\$106 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [311:304] = databyteIn;
                                              endcase
                                              casez (\$108 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [303:296] = databyteIn;
                                              endcase
                                              casez (\$110 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [295:288] = databyteIn;
                                              endcase
                                              casez (\$112 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [287:280] = databyteIn;
                                              endcase
                                              casez (\$114 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [279:272] = databyteIn;
                                              endcase
                                              casez (\$116 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [271:264] = databyteIn;
                                              endcase
                                              casez (\$118 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [263:256] = databyteIn;
                                              endcase
                                              casez (\$120 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [255:248] = databyteIn;
                                              endcase
                                              casez (\$122 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [247:240] = databyteIn;
                                              endcase
                                              casez (\$124 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [239:232] = databyteIn;
                                              endcase
                                              casez (\$126 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [231:224] = databyteIn;
                                              endcase
                                              casez (\$128 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [223:216] = databyteIn;
                                              endcase
                                              casez (\$130 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [215:208] = databyteIn;
                                              endcase
                                              casez (\$132 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [207:200] = databyteIn;
                                              endcase
                                              casez (\$134 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [199:192] = databyteIn;
                                              endcase
                                              casez (\$136 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [191:184] = databyteIn;
                                              endcase
                                              casez (\$138 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [183:176] = databyteIn;
                                              endcase
                                              casez (\$140 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [175:168] = databyteIn;
                                              endcase
                                              casez (\$142 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [167:160] = databyteIn;
                                              endcase
                                              casez (\$144 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [159:152] = databyteIn;
                                              endcase
                                              casez (\$146 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [151:144] = databyteIn;
                                              endcase
                                              casez (\$148 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [143:136] = databyteIn;
                                              endcase
                                              casez (\$150 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [135:128] = databyteIn;
                                              endcase
                                              casez (\$152 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [127:120] = databyteIn;
                                              endcase
                                              casez (\$154 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [119:112] = databyteIn;
                                              endcase
                                              casez (\$156 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [111:104] = databyteIn;
                                              endcase
                                              casez (\$158 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [103:96] = databyteIn;
                                              endcase
                                              casez (\$160 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [95:88] = databyteIn;
                                              endcase
                                              casez (\$162 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [87:80] = databyteIn;
                                              endcase
                                              casez (\$164 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [79:72] = databyteIn;
                                              endcase
                                              casez (\$166 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [71:64] = databyteIn;
                                              endcase
                                              casez (\$168 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [63:56] = databyteIn;
                                              endcase
                                              casez (\$170 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [55:48] = databyteIn;
                                              endcase
                                              casez (\$172 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [47:40] = databyteIn;
                                              endcase
                                              casez (\$174 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [39:32] = databyteIn;
                                              endcase
                                              casez (\$176 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [31:24] = databyteIn;
                                              endcase
                                              casez (\$178 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [23:16] = databyteIn;
                                              endcase
                                              casez (\$180 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [15:8] = databyteIn;
                                              endcase
                                              casez (\$182 )
                                                /* src = "shaman/api.py:134" */
                                                1'h1:
                                                    \apibuf$next [7:0] = databyteIn;
                                              endcase
                                            end
                                        endcase
                                  endcase
                            endcase
                      endcase
                endcase
            /* src = "shaman/api.py:226" */
            default:
                (* full_case = 32'd1 *)
                casez (\$184 )
                  /* src = "shaman/api.py:107" */
                  1'h1:
                      /* empty */;
                  /* src = "shaman/api.py:112" */
                  default:
                      casez (\$186 )
                        /* src = "shaman/api.py:115" */
                        1'h1:
                            (* full_case = 32'd1 *)
                            casez (\$188 )
                              /* src = "shaman/api.py:122" */
                              1'h1:
                                  \apibuf$next [7:0] = databyteIn;
                              /* src = "shaman/api.py:131" */
                              default:
                                begin
                                  casez (\$190 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [511:504] = databyteIn;
                                  endcase
                                  casez (\$192 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [503:496] = databyteIn;
                                  endcase
                                  casez (\$194 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [495:488] = databyteIn;
                                  endcase
                                  casez (\$196 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [487:480] = databyteIn;
                                  endcase
                                  casez (\$198 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [479:472] = databyteIn;
                                  endcase
                                  casez (\$200 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [471:464] = databyteIn;
                                  endcase
                                  casez (\$202 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [463:456] = databyteIn;
                                  endcase
                                  casez (\$204 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [455:448] = databyteIn;
                                  endcase
                                  casez (\$206 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [447:440] = databyteIn;
                                  endcase
                                  casez (\$208 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [439:432] = databyteIn;
                                  endcase
                                  casez (\$210 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [431:424] = databyteIn;
                                  endcase
                                  casez (\$212 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [423:416] = databyteIn;
                                  endcase
                                  casez (\$214 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [415:408] = databyteIn;
                                  endcase
                                  casez (\$216 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [407:400] = databyteIn;
                                  endcase
                                  casez (\$218 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [399:392] = databyteIn;
                                  endcase
                                  casez (\$220 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [391:384] = databyteIn;
                                  endcase
                                  casez (\$222 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [383:376] = databyteIn;
                                  endcase
                                  casez (\$224 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [375:368] = databyteIn;
                                  endcase
                                  casez (\$226 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [367:360] = databyteIn;
                                  endcase
                                  casez (\$228 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [359:352] = databyteIn;
                                  endcase
                                  casez (\$230 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [351:344] = databyteIn;
                                  endcase
                                  casez (\$232 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [343:336] = databyteIn;
                                  endcase
                                  casez (\$234 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [335:328] = databyteIn;
                                  endcase
                                  casez (\$236 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [327:320] = databyteIn;
                                  endcase
                                  casez (\$238 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [319:312] = databyteIn;
                                  endcase
                                  casez (\$240 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [311:304] = databyteIn;
                                  endcase
                                  casez (\$242 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [303:296] = databyteIn;
                                  endcase
                                  casez (\$244 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [295:288] = databyteIn;
                                  endcase
                                  casez (\$246 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [287:280] = databyteIn;
                                  endcase
                                  casez (\$248 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [279:272] = databyteIn;
                                  endcase
                                  casez (\$250 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [271:264] = databyteIn;
                                  endcase
                                  casez (\$252 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [263:256] = databyteIn;
                                  endcase
                                  casez (\$254 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [255:248] = databyteIn;
                                  endcase
                                  casez (\$256 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [247:240] = databyteIn;
                                  endcase
                                  casez (\$258 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [239:232] = databyteIn;
                                  endcase
                                  casez (\$260 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [231:224] = databyteIn;
                                  endcase
                                  casez (\$262 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [223:216] = databyteIn;
                                  endcase
                                  casez (\$264 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [215:208] = databyteIn;
                                  endcase
                                  casez (\$266 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [207:200] = databyteIn;
                                  endcase
                                  casez (\$268 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [199:192] = databyteIn;
                                  endcase
                                  casez (\$270 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [191:184] = databyteIn;
                                  endcase
                                  casez (\$272 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [183:176] = databyteIn;
                                  endcase
                                  casez (\$274 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [175:168] = databyteIn;
                                  endcase
                                  casez (\$276 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [167:160] = databyteIn;
                                  endcase
                                  casez (\$278 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [159:152] = databyteIn;
                                  endcase
                                  casez (\$280 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [151:144] = databyteIn;
                                  endcase
                                  casez (\$282 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [143:136] = databyteIn;
                                  endcase
                                  casez (\$284 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [135:128] = databyteIn;
                                  endcase
                                  casez (\$286 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [127:120] = databyteIn;
                                  endcase
                                  casez (\$288 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [119:112] = databyteIn;
                                  endcase
                                  casez (\$290 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [111:104] = databyteIn;
                                  endcase
                                  casez (\$292 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [103:96] = databyteIn;
                                  endcase
                                  casez (\$294 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [95:88] = databyteIn;
                                  endcase
                                  casez (\$296 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [87:80] = databyteIn;
                                  endcase
                                  casez (\$298 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [79:72] = databyteIn;
                                  endcase
                                  casez (\$300 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [71:64] = databyteIn;
                                  endcase
                                  casez (\$302 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [63:56] = databyteIn;
                                  endcase
                                  casez (\$304 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [55:48] = databyteIn;
                                  endcase
                                  casez (\$306 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [47:40] = databyteIn;
                                  endcase
                                  casez (\$308 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [39:32] = databyteIn;
                                  endcase
                                  casez (\$310 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [31:24] = databyteIn;
                                  endcase
                                  casez (\$312 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [23:16] = databyteIn;
                                  endcase
                                  casez (\$314 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [15:8] = databyteIn;
                                  endcase
                                  casez (\$316 )
                                    /* src = "shaman/api.py:134" */
                                    1'h1:
                                        \apibuf$next [7:0] = databyteIn;
                                  endcase
                                end
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \apibuf$next  = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$63 ) begin end
    \blockproc_initBufferReady$next  = blockproc_initBufferReady;
    (* full_case = 32'd1 *)
    casez (start)
      /* src = "shaman/api.py:198" */
      1'h1:
          \blockproc_initBufferReady$next  = 1'h0;
      /* src = "shaman/api.py:209" */
      default:
          casez (\$318 )
            /* src = "shaman/api.py:213" */
            1'h1:
                (* full_case = 32'd1 *)
                casez (beginProcessingDataBlock)
                  /* src = "shaman/api.py:81" */
                  1'h1:
                      \blockproc_initBufferReady$next  = 1'h1;
                  /* src = "shaman/api.py:91" */
                  default:
                      \blockproc_initBufferReady$next  = 1'h0;
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \blockproc_initBufferReady$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$63 ) begin end
    \blockproc_doProcessBlock$next  = blockproc_doProcessBlock;
    (* full_case = 32'd1 *)
    casez (start)
      /* src = "shaman/api.py:198" */
      1'h1:
          \blockproc_doProcessBlock$next  = 1'h0;
      /* src = "shaman/api.py:209" */
      default:
          casez (\$320 )
            /* src = "shaman/api.py:213" */
            1'h1:
                (* full_case = 32'd1 *)
                casez (beginProcessingDataBlock)
                  /* src = "shaman/api.py:81" */
                  1'h1:
                      \blockproc_doProcessBlock$next  = 1'h1;
                  /* src = "shaman/api.py:91" */
                  default:
                      casez (blockproc_bp_outrdy)
                        /* src = "shaman/api.py:95" */
                        1'h1:
                            \blockproc_doProcessBlock$next  = 1'h0;
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \blockproc_doProcessBlock$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$63 ) begin end
    \processingReceivedDataBlock$next  = processingReceivedDataBlock;
    (* full_case = 32'd1 *)
    casez (start)
      /* src = "shaman/api.py:198" */
      1'h1:
          \processingReceivedDataBlock$next  = 1'h0;
      /* src = "shaman/api.py:209" */
      default:
          casez (\$322 )
            /* src = "shaman/api.py:213" */
            1'h1:
                (* full_case = 32'd1 *)
                casez (beginProcessingDataBlock)
                  /* src = "shaman/api.py:81" */
                  1'h1:
                      \processingReceivedDataBlock$next  = 1'h1;
                  /* src = "shaman/api.py:91" */
                  default:
                      casez (blockproc_bp_outrdy)
                        /* src = "shaman/api.py:95" */
                        1'h1:
                            \processingReceivedDataBlock$next  = 1'h0;
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \processingReceivedDataBlock$next  = 1'h0;
    endcase
  end
  assign \$9  = \$10 ;
  assign \$28  = \$29 ;
  assign \$37  = \$38 ;
  assign resultReady = \$1 ;
  assign blockproc_newMessage = start;
endmodule

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman.shapi.blockproc.t1" *)
(* generator = "Amaranth" *)
module t1(rst, initBufferReady, t1_initdat, t1_e, t1_f, t1_g, t1_h, t1_count, t1_outrdy, t1_out, clk);
  reg \$auto$verilog_backend.cc:2083:dump_module$64  = 0;
  wire \$1 ;
  wire \$10 ;
  wire \$101 ;
  wire \$103 ;
  wire \$105 ;
  wire \$107 ;
  wire \$109 ;
  wire \$111 ;
  wire \$113 ;
  wire \$115 ;
  wire \$117 ;
  wire \$119 ;
  wire [35:0] \$12 ;
  wire \$121 ;
  wire \$123 ;
  wire \$125 ;
  wire \$127 ;
  wire \$129 ;
  wire [32:0] \$13 ;
  wire \$131 ;
  wire \$133 ;
  wire \$135 ;
  wire \$137 ;
  wire \$139 ;
  wire \$141 ;
  wire \$143 ;
  wire \$145 ;
  wire \$147 ;
  wire [33:0] \$15 ;
  wire [34:0] \$17 ;
  wire [35:0] \$19 ;
  wire \$21 ;
  wire \$23 ;
  wire \$25 ;
  wire \$27 ;
  wire \$29 ;
  wire \$3 ;
  wire \$31 ;
  wire \$33 ;
  wire \$35 ;
  wire \$37 ;
  wire \$39 ;
  wire \$41 ;
  wire \$43 ;
  wire \$45 ;
  wire \$47 ;
  wire \$49 ;
  wire [4:0] \$5 ;
  wire \$51 ;
  wire \$53 ;
  wire \$55 ;
  wire \$57 ;
  wire \$59 ;
  wire [4:0] \$6 ;
  wire \$61 ;
  wire \$63 ;
  wire \$65 ;
  wire \$67 ;
  wire \$69 ;
  wire \$71 ;
  wire \$73 ;
  wire \$75 ;
  wire \$77 ;
  wire \$79 ;
  wire \$8 ;
  wire \$81 ;
  wire \$83 ;
  wire \$85 ;
  wire \$87 ;
  wire \$89 ;
  wire \$91 ;
  wire \$93 ;
  wire \$95 ;
  wire \$97 ;
  wire \$99 ;
  reg [31:0] bigK;
  wire [31:0] ch_ch_out;
  wire [31:0] ch_ch_x;
  wire [31:0] ch_ch_y;
  wire [31:0] ch_ch_z;
  input clk;
  wire clk;
  reg [3:0] delayCount = 4'h0;
  reg [3:0] \delayCount$next ;
  input initBufferReady;
  wire initBufferReady;
  reg [6:0] lastCount = 7'h00;
  reg [6:0] \lastCount$next ;
  reg myOutReady;
  wire [31:0] rot1_rot1_out;
  wire [31:0] rot1_rot1_x;
  input rst;
  wire rst;
  input [6:0] t1_count;
  wire [6:0] t1_count;
  input [31:0] t1_e;
  wire [31:0] t1_e;
  input [31:0] t1_f;
  wire [31:0] t1_f;
  input [31:0] t1_g;
  wire [31:0] t1_g;
  input [31:0] t1_h;
  wire [31:0] t1_h;
  input [511:0] t1_initdat;
  wire [511:0] t1_initdat;
  output [31:0] t1_out;
  wire [31:0] t1_out;
  output t1_outrdy;
  wire t1_outrdy;
  wire wt_initBufferReady;
  wire [5:0] wt_wt_count;
  wire [511:0] wt_wt_initdat;
  wire [31:0] wt_wt_out;
  wire wt_wt_outrdy;
  assign \$99  = t1_count == 6'h27;
  assign \$101  = t1_count == 6'h28;
  assign \$103  = t1_count == 6'h29;
  assign \$105  = t1_count == 6'h2a;
  assign \$107  = t1_count == 6'h2b;
  assign \$10  = delayCount < 3'h4;
  assign \$109  = t1_count == 6'h2c;
  assign \$111  = t1_count == 6'h2d;
  assign \$113  = t1_count == 6'h2e;
  assign \$115  = t1_count == 6'h2f;
  assign \$117  = t1_count == 6'h30;
  assign \$119  = t1_count == 6'h31;
  assign \$121  = t1_count == 6'h32;
  assign \$123  = t1_count == 6'h33;
  assign \$125  = t1_count == 6'h34;
  assign \$127  = t1_count == 6'h35;
  assign \$129  = t1_count == 6'h36;
  assign \$131  = t1_count == 6'h37;
  assign \$133  = t1_count == 6'h38;
  assign \$135  = t1_count == 6'h39;
  assign \$137  = t1_count == 6'h3a;
  assign \$13  = t1_h + rot1_rot1_out;
  assign \$139  = t1_count == 6'h3b;
  assign \$141  = t1_count == 6'h3c;
  assign \$143  = t1_count == 6'h3d;
  assign \$145  = t1_count == 6'h3e;
  assign \$147  = t1_count == 6'h3f;
  assign \$15  = \$13  + ch_ch_out;
  assign \$17  = \$15  + bigK;
  assign \$1  = lastCount != t1_count;
  assign \$19  = \$17  + wt_wt_out;
  assign \$21  = ! t1_count;
  assign \$23  = t1_count == 1'h1;
  assign \$25  = t1_count == 2'h2;
  assign \$27  = t1_count == 2'h3;
  assign \$29  = t1_count == 3'h4;
  assign \$31  = t1_count == 3'h5;
  assign \$33  = t1_count == 3'h6;
  assign \$35  = t1_count == 3'h7;
  assign \$37  = t1_count == 4'h8;
  assign \$3  = delayCount < 3'h4;
  assign \$39  = t1_count == 4'h9;
  assign \$41  = t1_count == 4'ha;
  assign \$43  = t1_count == 4'hb;
  assign \$45  = t1_count == 4'hc;
  assign \$47  = t1_count == 4'hd;
  assign \$49  = t1_count == 4'he;
  assign \$51  = t1_count == 4'hf;
  assign \$53  = t1_count == 5'h10;
  assign \$55  = t1_count == 5'h11;
  assign \$57  = t1_count == 5'h12;
  assign \$59  = t1_count == 5'h13;
  assign \$61  = t1_count == 5'h14;
  assign \$63  = t1_count == 5'h15;
  assign \$65  = t1_count == 5'h16;
  assign \$67  = t1_count == 5'h17;
  assign \$6  = delayCount + 1'h1;
  assign \$69  = t1_count == 5'h18;
  assign \$71  = t1_count == 5'h19;
  assign \$73  = t1_count == 5'h1a;
  assign \$75  = t1_count == 5'h1b;
  assign \$77  = t1_count == 5'h1c;
  assign \$79  = t1_count == 5'h1d;
  assign \$81  = t1_count == 5'h1e;
  assign \$83  = t1_count == 5'h1f;
  assign \$85  = t1_count == 6'h20;
  assign \$87  = t1_count == 6'h21;
  assign \$8  = lastCount != t1_count;
  assign \$89  = t1_count == 6'h22;
  assign \$91  = t1_count == 6'h23;
  assign \$93  = t1_count == 6'h24;
  assign \$95  = t1_count == 6'h25;
  assign \$97  = t1_count == 6'h26;
  always @(posedge clk)
    lastCount <= \lastCount$next ;
  always @(posedge clk)
    delayCount <= \delayCount$next ;
  ch ch (
    .ch_out(ch_ch_out),
    .ch_x(ch_ch_x),
    .ch_y(ch_ch_y),
    .ch_z(ch_ch_z)
  );
  rot1 rot1 (
    .rot1_out(rot1_rot1_out),
    .rot1_x(rot1_rot1_x)
  );
  wt wt (
    .clk(clk),
    .initBufferReady(wt_initBufferReady),
    .rst(rst),
    .wt_count(wt_wt_count),
    .wt_initdat(wt_wt_initdat),
    .wt_out(wt_wt_out),
    .wt_outrdy(wt_wt_outrdy)
  );
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$64 ) begin end
    bigK = 32'd0;
    casez (\$21 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1116352408;
    endcase
    casez (\$23 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1899447441;
    endcase
    casez (\$25 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3049323471;
    endcase
    casez (\$27 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3921009573;
    endcase
    casez (\$29 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd961987163;
    endcase
    casez (\$31 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1508970993;
    endcase
    casez (\$33 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2453635748;
    endcase
    casez (\$35 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2870763221;
    endcase
    casez (\$37 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3624381080;
    endcase
    casez (\$39 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd310598401;
    endcase
    casez (\$41 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd607225278;
    endcase
    casez (\$43 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1426881987;
    endcase
    casez (\$45 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1925078388;
    endcase
    casez (\$47 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2162078206;
    endcase
    casez (\$49 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2614888103;
    endcase
    casez (\$51 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3248222580;
    endcase
    casez (\$53 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3835390401;
    endcase
    casez (\$55 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd4022224774;
    endcase
    casez (\$57 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd264347078;
    endcase
    casez (\$59 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd604807628;
    endcase
    casez (\$61 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd770255983;
    endcase
    casez (\$63 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1249150122;
    endcase
    casez (\$65 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1555081692;
    endcase
    casez (\$67 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1996064986;
    endcase
    casez (\$69 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2554220882;
    endcase
    casez (\$71 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2821834349;
    endcase
    casez (\$73 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2952996808;
    endcase
    casez (\$75 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3210313671;
    endcase
    casez (\$77 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3336571891;
    endcase
    casez (\$79 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3584528711;
    endcase
    casez (\$81 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd113926993;
    endcase
    casez (\$83 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd338241895;
    endcase
    casez (\$85 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd666307205;
    endcase
    casez (\$87 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd773529912;
    endcase
    casez (\$89 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1294757372;
    endcase
    casez (\$91 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1396182291;
    endcase
    casez (\$93 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1695183700;
    endcase
    casez (\$95 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1986661051;
    endcase
    casez (\$97 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2177026350;
    endcase
    casez (\$99 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2456956037;
    endcase
    casez (\$101 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2730485921;
    endcase
    casez (\$103 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2820302411;
    endcase
    casez (\$105 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3259730800;
    endcase
    casez (\$107 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3345764771;
    endcase
    casez (\$109 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3516065817;
    endcase
    casez (\$111 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3600352804;
    endcase
    casez (\$113 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd4094571909;
    endcase
    casez (\$115 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd275423344;
    endcase
    casez (\$117 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd430227734;
    endcase
    casez (\$119 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd506948616;
    endcase
    casez (\$121 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd659060556;
    endcase
    casez (\$123 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd883997877;
    endcase
    casez (\$125 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd958139571;
    endcase
    casez (\$127 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1322822218;
    endcase
    casez (\$129 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1537002063;
    endcase
    casez (\$131 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1747873779;
    endcase
    casez (\$133 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd1955562222;
    endcase
    casez (\$135 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2024104815;
    endcase
    casez (\$137 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2227730452;
    endcase
    casez (\$139 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2361852424;
    endcase
    casez (\$141 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2428436474;
    endcase
    casez (\$143 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd2756734187;
    endcase
    casez (\$145 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3204031479;
    endcase
    casez (\$147 )
      /* src = "shaman/operations/t1.py:164" */
      1'h1:
          bigK = 32'd3329325298;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$64 ) begin end
    \delayCount$next  = delayCount;
    casez (\$1 )
      /* src = "shaman/operations/t1.py:128" */
      1'h1:
          \delayCount$next  = 4'h0;
    endcase
    casez (\$3 )
      /* src = "shaman/operations/t1.py:132" */
      1'h1:
          \delayCount$next  = \$6 [3:0];
    endcase
    casez (rst)
      1'h1:
          \delayCount$next  = 4'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$64 ) begin end
    \lastCount$next  = lastCount;
    casez (\$8 )
      /* src = "shaman/operations/t1.py:128" */
      1'h1:
          \lastCount$next  = t1_count;
    endcase
    casez (rst)
      1'h1:
          \lastCount$next  = 7'h00;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$64 ) begin end
    (* full_case = 32'd1 *)
    casez (\$10 )
      /* src = "shaman/operations/t1.py:132" */
      1'h1:
          myOutReady = 1'h0;
      /* src = "shaman/operations/t1.py:135" */
      default:
          myOutReady = wt_wt_outrdy;
    endcase
  end
  assign \$5  = \$6 ;
  assign \$12  = \$19 ;
  assign t1_out = \$19 [31:0];
  assign ch_ch_z = t1_g;
  assign ch_ch_y = t1_f;
  assign ch_ch_x = t1_e;
  assign rot1_rot1_x = t1_e;
  assign t1_outrdy = myOutReady;
  assign wt_wt_count = t1_count[5:0];
  assign wt_wt_initdat = t1_initdat;
  assign wt_initBufferReady = initBufferReady;
endmodule

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman.shapi.blockproc.t2" *)
(* generator = "Amaranth" *)
module t2(t2_b, t2_c, t2_out, t2_a);
  wire [32:0] \$1 ;
  wire [32:0] \$2 ;
  wire [31:0] maj_maj_out;
  wire [31:0] maj_maj_x;
  wire [31:0] maj_maj_y;
  wire [31:0] maj_maj_z;
  wire [31:0] rot0_rot0_out;
  wire [31:0] rot0_rot0_x;
  input [31:0] t2_a;
  wire [31:0] t2_a;
  input [31:0] t2_b;
  wire [31:0] t2_b;
  input [31:0] t2_c;
  wire [31:0] t2_c;
  output [31:0] t2_out;
  wire [31:0] t2_out;
  assign \$2  = rot0_rot0_out + maj_maj_out;
  maj maj (
    .maj_out(maj_maj_out),
    .maj_x(maj_maj_x),
    .maj_y(maj_maj_y),
    .maj_z(maj_maj_z)
  );
  rot0 rot0 (
    .rot0_out(rot0_rot0_out),
    .rot0_x(rot0_rot0_x)
  );
  assign \$1  = \$2 ;
  assign t2_out = \$2 [31:0];
  assign maj_maj_z = t2_c;
  assign maj_maj_y = t2_b;
  assign maj_maj_x = t2_a;
  assign rot0_rot0_x = t2_a;
endmodule

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman" *)
(* top =  1  *)
(* generator = "Amaranth" *)
module tt_um_psychogenic_shaman(uo_out, uio_in, uio_out, uio_oe, ena, clk, rst_n, ui_in);
  wire \$1 ;
  input clk;
  wire clk;
  input ena;
  wire ena;
  input rst_n;
  wire rst_n;
  wire shapi_beginProcessingDataBlock;
  wire shapi_busy;
  wire shapi_clk;
  wire shapi_clockinData;
  wire [7:0] shapi_databyteIn;
  wire shapi_parallelLoading;
  wire shapi_processingReceivedDataBlock;
  wire shapi_resultNext;
  wire shapi_resultReady;
  wire [7:0] shapi_resultbyteOut;
  wire shapi_rst;
  wire shapi_start;
  input [7:0] ui_in;
  wire [7:0] ui_in;
  input [7:0] uio_in;
  wire [7:0] uio_in;
  output [7:0] uio_oe;
  wire [7:0] uio_oe;
  output [7:0] uio_out;
  wire [7:0] uio_out;
  output [7:0] uo_out;
  wire [7:0] uo_out;
  assign \$1  = ~ rst_n;
  shapi shapi (
    .beginProcessingDataBlock(shapi_beginProcessingDataBlock),
    .busy(shapi_busy),
    .clk(shapi_clk),
    .clockinData(shapi_clockinData),
    .databyteIn(shapi_databyteIn),
    .parallelLoading(shapi_parallelLoading),
    .processingReceivedDataBlock(shapi_processingReceivedDataBlock),
    .resultNext(shapi_resultNext),
    .resultReady(shapi_resultReady),
    .resultbyteOut(shapi_resultbyteOut),
    .rst(shapi_rst),
    .start(shapi_start)
  );
  assign shapi_clockinData = uio_in[7];
  assign shapi_start = uio_in[6];
  assign shapi_resultNext = uio_in[3];
  assign shapi_parallelLoading = uio_in[2];
  assign uio_out[5] = shapi_processingReceivedDataBlock;
  assign uio_out[4] = shapi_busy;
  assign uio_out[1] = shapi_beginProcessingDataBlock;
  assign uio_out[0] = shapi_resultReady;
  assign { uio_out[7:6], uio_out[3:2] } = 4'h0;
  assign uio_oe = 8'h33;
  assign uo_out = shapi_resultbyteOut;
  assign shapi_databyteIn = ui_in;
  assign shapi_rst = \$1 ;
  assign shapi_clk = clk;
endmodule

(* \amaranth.hierarchy  = "tt_um_psychogenic_shaman.shapi.blockproc.t1.wt" *)
(* generator = "Amaranth" *)
module wt(rst, initBufferReady, wt_initdat, wt_outrdy, wt_count, wt_out, clk);
  reg \$auto$verilog_backend.cc:2083:dump_module$65  = 0;
  wire \$1 ;
  wire [574:0] \$10 ;
  wire \$101 ;
  wire \$103 ;
  wire \$105 ;
  wire \$107 ;
  wire \$109 ;
  wire \$111 ;
  wire \$113 ;
  wire \$115 ;
  wire \$117 ;
  wire \$119 ;
  wire [574:0] \$12 ;
  wire \$121 ;
  wire \$123 ;
  wire \$125 ;
  wire \$127 ;
  wire \$129 ;
  wire \$131 ;
  wire \$133 ;
  wire \$135 ;
  wire \$137 ;
  wire \$139 ;
  wire [34:0] \$14 ;
  wire \$141 ;
  wire \$143 ;
  wire \$145 ;
  wire \$147 ;
  wire \$149 ;
  wire [32:0] \$15 ;
  wire \$151 ;
  wire \$153 ;
  wire \$155 ;
  wire \$157 ;
  wire \$159 ;
  wire \$161 ;
  wire \$163 ;
  wire \$165 ;
  wire \$167 ;
  wire \$169 ;
  wire [33:0] \$17 ;
  wire \$171 ;
  wire \$173 ;
  wire \$175 ;
  wire \$177 ;
  wire \$179 ;
  wire \$181 ;
  wire \$183 ;
  wire \$185 ;
  wire \$187 ;
  wire \$189 ;
  wire [34:0] \$19 ;
  wire \$191 ;
  wire \$193 ;
  wire \$195 ;
  wire \$197 ;
  wire \$199 ;
  wire \$201 ;
  wire \$203 ;
  wire \$205 ;
  wire \$207 ;
  wire \$209 ;
  wire \$21 ;
  wire \$211 ;
  wire \$213 ;
  wire \$215 ;
  wire \$217 ;
  wire \$219 ;
  wire \$221 ;
  wire \$223 ;
  wire \$225 ;
  wire \$227 ;
  wire [32:0] \$229 ;
  wire \$23 ;
  wire [32:0] \$230 ;
  wire \$232 ;
  wire \$234 ;
  wire \$236 ;
  wire \$238 ;
  wire \$240 ;
  wire \$242 ;
  wire \$25 ;
  wire \$27 ;
  wire \$29 ;
  wire \$3 ;
  wire \$31 ;
  wire \$33 ;
  wire \$35 ;
  wire \$37 ;
  wire \$39 ;
  wire \$41 ;
  wire \$43 ;
  wire \$45 ;
  wire \$47 ;
  wire \$49 ;
  wire \$5 ;
  wire \$51 ;
  wire \$53 ;
  wire \$55 ;
  wire \$57 ;
  wire \$59 ;
  wire \$61 ;
  wire \$63 ;
  wire \$65 ;
  wire \$67 ;
  wire \$69 ;
  wire \$7 ;
  wire \$71 ;
  wire \$73 ;
  wire \$75 ;
  wire [2:0] \$77 ;
  wire [2:0] \$78 ;
  wire \$80 ;
  wire \$82 ;
  wire \$84 ;
  wire \$86 ;
  wire \$88 ;
  wire [574:0] \$9 ;
  wire \$90 ;
  wire \$92 ;
  wire \$94 ;
  wire \$96 ;
  wire [10:0] \$98 ;
  wire [10:0] \$99 ;
  input clk;
  wire clk;
  reg [31:0] currentResult = 32'd0;
  reg [31:0] \currentResult$next ;
  reg [31:0] debug_sig = 32'd0;
  reg [31:0] \debug_sig$next ;
  input initBufferReady;
  wire initBufferReady;
  reg [31:0] lastResult = 32'd0;
  reg [31:0] \lastResult$next ;
  reg [31:0] lastVal = 32'd0;
  reg [31:0] \lastVal$next ;
  input rst;
  wire rst;
  wire [31:0] s0_s0_out;
  reg [31:0] s0_s0_x;
  wire [31:0] s1_s1_out;
  reg [31:0] s1_s1_x;
  reg [31:0] \sbuf-1  = 32'd0;
  reg [31:0] \sbuf-1$next ;
  reg [31:0] \sbuf-10  = 32'd0;
  reg [31:0] \sbuf-10$next ;
  reg [31:0] \sbuf-11  = 32'd0;
  reg [31:0] \sbuf-11$next ;
  reg [31:0] \sbuf-12  = 32'd0;
  reg [31:0] \sbuf-12$next ;
  reg [31:0] \sbuf-13  = 32'd0;
  reg [31:0] \sbuf-13$next ;
  reg [31:0] \sbuf-14  = 32'd0;
  reg [31:0] \sbuf-14$next ;
  reg [31:0] \sbuf-15  = 32'd0;
  reg [31:0] \sbuf-15$next ;
  reg [31:0] \sbuf-2  = 32'd0;
  reg [31:0] \sbuf-2$next ;
  reg [31:0] \sbuf-3  = 32'd0;
  reg [31:0] \sbuf-3$next ;
  reg [31:0] \sbuf-4  = 32'd0;
  reg [31:0] \sbuf-4$next ;
  reg [31:0] \sbuf-5  = 32'd0;
  reg [31:0] \sbuf-5$next ;
  reg [31:0] \sbuf-6  = 32'd0;
  reg [31:0] \sbuf-6$next ;
  reg [31:0] \sbuf-7  = 32'd0;
  reg [31:0] \sbuf-7$next ;
  reg [31:0] \sbuf-8  = 32'd0;
  reg [31:0] \sbuf-8$next ;
  reg [31:0] \sbuf-9  = 32'd0;
  reg [31:0] \sbuf-9$next ;
  reg [9:0] shiftCount = 10'h000;
  reg [9:0] \shiftCount$next ;
  reg [1:0] tickDelay = 2'h0;
  reg [1:0] \tickDelay$next ;
  reg [511:0] wt_buf = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  reg [511:0] \wt_buf$next ;
  input [5:0] wt_count;
  wire [5:0] wt_count;
  input [511:0] wt_initdat;
  wire [511:0] wt_initdat;
  reg [5:0] wt_lastcnt = 6'h00;
  reg [5:0] \wt_lastcnt$next ;
  output [31:0] wt_out;
  reg [31:0] wt_out = 32'd0;
  reg [31:0] \wt_out$next ;
  output wt_outrdy;
  reg wt_outrdy = 1'h0;
  reg \wt_outrdy$next ;
  reg [31:0] wt_res;
  assign \$99  = shiftCount + 1'h1;
  assign \$101  = wt_count < 5'h10;
  assign \$103  = wt_count > wt_lastcnt;
  assign \$105  = ! tickDelay;
  assign \$107  = wt_count > 5'h10;
  assign \$109  = wt_count < 5'h10;
  assign \$111  = wt_count > wt_lastcnt;
  assign \$113  = ! tickDelay;
  assign \$115  = wt_count > 5'h10;
  assign \$117  = wt_count < 5'h10;
  assign \$119  = wt_count > wt_lastcnt;
  assign \$121  = ! tickDelay;
  assign \$123  = wt_count > 5'h10;
  assign \$125  = wt_count < 5'h10;
  assign \$127  = wt_count > wt_lastcnt;
  assign \$12  = \$10  | currentResult;
  assign \$129  = ! tickDelay;
  assign \$131  = wt_count > 5'h10;
  assign \$133  = wt_count < 5'h10;
  assign \$135  = wt_count > wt_lastcnt;
  assign \$137  = ! tickDelay;
  assign \$139  = wt_count > 5'h10;
  assign \$141  = wt_count < 5'h10;
  assign \$143  = wt_count > wt_lastcnt;
  assign \$145  = ! tickDelay;
  assign \$147  = wt_count > 5'h10;
  assign \$149  = wt_count < 5'h10;
  assign \$151  = wt_count > wt_lastcnt;
  assign \$153  = ! tickDelay;
  assign \$155  = wt_count > 5'h10;
  assign \$157  = wt_count < 5'h10;
  assign \$15  = s1_s1_out + wt_buf[223:192];
  assign \$159  = wt_count > wt_lastcnt;
  assign \$161  = ! tickDelay;
  assign \$163  = wt_count > 5'h10;
  assign \$165  = wt_count < 5'h10;
  assign \$167  = wt_count > wt_lastcnt;
  assign \$169  = ! tickDelay;
  assign \$171  = wt_count > 5'h10;
  assign \$173  = wt_count < 5'h10;
  assign \$175  = wt_count > wt_lastcnt;
  assign \$177  = ! tickDelay;
  assign \$17  = \$15  + s0_s0_out;
  assign \$179  = wt_count > 5'h10;
  assign \$181  = wt_count < 5'h10;
  assign \$183  = wt_count > wt_lastcnt;
  assign \$185  = ! tickDelay;
  assign \$187  = wt_count > 5'h10;
  assign \$189  = wt_count < 5'h10;
  assign \$191  = wt_count > wt_lastcnt;
  assign \$193  = ! tickDelay;
  assign \$195  = wt_count > 5'h10;
  assign \$197  = wt_count < 5'h10;
  assign \$1  = wt_count < 5'h10;
  assign \$19  = \$17  + wt_buf[511:480];
  assign \$199  = wt_count > wt_lastcnt;
  assign \$201  = ! tickDelay;
  assign \$203  = wt_count > 5'h10;
  assign \$205  = wt_count < 5'h10;
  assign \$207  = wt_count > wt_lastcnt;
  assign \$209  = ! tickDelay;
  assign \$211  = wt_count > 5'h10;
  assign \$213  = wt_count < 5'h10;
  assign \$215  = wt_count > wt_lastcnt;
  assign \$217  = ! tickDelay;
  assign \$21  = wt_lastcnt > wt_count;
  assign \$219  = wt_count > 5'h10;
  assign \$221  = wt_count < 5'h10;
  assign \$223  = wt_count > wt_lastcnt;
  assign \$225  = ! tickDelay;
  assign \$227  = wt_count > 5'h10;
  assign \$230  = debug_sig + 1'h1;
  assign \$232  = wt_count < 5'h10;
  assign \$234  = wt_count > wt_lastcnt;
  assign \$236  = tickDelay == 1'h1;
  assign \$238  = wt_count < 5'h10;
  assign \$23  = wt_count < 5'h10;
  assign \$240  = wt_count > wt_lastcnt;
  assign \$242  = tickDelay == 1'h1;
  assign \$25  = wt_count > wt_lastcnt;
  assign \$27  = tickDelay == 2'h2;
  assign \$29  = wt_count < 5'h10;
  assign \$31  = wt_count > wt_lastcnt;
  assign \$33  = ! tickDelay;
  assign \$35  = tickDelay == 1'h1;
  assign \$37  = tickDelay == 2'h2;
  assign \$3  = wt_count > wt_lastcnt;
  assign \$39  = wt_count < 5'h10;
  assign \$41  = ! wt_count;
  assign \$43  = wt_count == 1'h1;
  assign \$45  = wt_count == 2'h2;
  assign \$47  = wt_count == 2'h3;
  assign \$49  = wt_count == 3'h4;
  assign \$51  = wt_count == 3'h5;
  assign \$53  = wt_count == 3'h6;
  assign \$55  = wt_count == 3'h7;
  assign \$57  = wt_count == 4'h8;
  assign \$5  = ! tickDelay;
  assign \$59  = wt_count == 4'h9;
  assign \$61  = wt_count == 4'ha;
  assign \$63  = wt_count == 4'hb;
  assign \$65  = wt_count == 4'hc;
  assign \$67  = wt_count == 4'hd;
  assign \$69  = wt_count == 4'he;
  assign \$71  = wt_count == 4'hf;
  assign \$73  = wt_count < 5'h10;
  assign \$75  = wt_count > wt_lastcnt;
  assign \$78  = tickDelay + 1'h1;
  assign \$7  = wt_count > 5'h10;
  assign \$80  = tickDelay == 2'h2;
  assign \$82  = wt_count < 5'h10;
  assign \$84  = wt_count > wt_lastcnt;
  assign \$86  = ! tickDelay;
  assign \$88  = wt_count > 5'h10;
  assign \$90  = wt_count < 5'h10;
  assign \$92  = wt_count > wt_lastcnt;
  assign \$94  = ! tickDelay;
  assign \$96  = wt_count > 5'h10;
  always @(posedge clk)
    currentResult <= \currentResult$next ;
  always @(posedge clk)
    lastResult <= \lastResult$next ;
  always @(posedge clk)
    debug_sig <= \debug_sig$next ;
  always @(posedge clk)
    \sbuf-15  <= \sbuf-15$next ;
  always @(posedge clk)
    \sbuf-14  <= \sbuf-14$next ;
  always @(posedge clk)
    \sbuf-13  <= \sbuf-13$next ;
  always @(posedge clk)
    \sbuf-12  <= \sbuf-12$next ;
  always @(posedge clk)
    \sbuf-11  <= \sbuf-11$next ;
  always @(posedge clk)
    \sbuf-10  <= \sbuf-10$next ;
  always @(posedge clk)
    \sbuf-9  <= \sbuf-9$next ;
  always @(posedge clk)
    \sbuf-8  <= \sbuf-8$next ;
  always @(posedge clk)
    \sbuf-7  <= \sbuf-7$next ;
  always @(posedge clk)
    \sbuf-6  <= \sbuf-6$next ;
  always @(posedge clk)
    \sbuf-5  <= \sbuf-5$next ;
  always @(posedge clk)
    \sbuf-4  <= \sbuf-4$next ;
  always @(posedge clk)
    \sbuf-3  <= \sbuf-3$next ;
  always @(posedge clk)
    \sbuf-2  <= \sbuf-2$next ;
  always @(posedge clk)
    \sbuf-1  <= \sbuf-1$next ;
  always @(posedge clk)
    shiftCount <= \shiftCount$next ;
  always @(posedge clk)
    lastVal <= \lastVal$next ;
  always @(posedge clk)
    tickDelay <= \tickDelay$next ;
  always @(posedge clk)
    wt_out <= \wt_out$next ;
  always @(posedge clk)
    wt_outrdy <= \wt_outrdy$next ;
  always @(posedge clk)
    wt_lastcnt <= \wt_lastcnt$next ;
  always @(posedge clk)
    wt_buf <= \wt_buf$next ;
  \buf  \buf  (
  );
  s0 s0 (
    .s0_out(s0_s0_out),
    .s0_x(s0_s0_x)
  );
  s1 s1 (
    .s1_out(s1_s1_out),
    .s1_x(s1_s1_x)
  );
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \wt_buf$next  = wt_buf;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          \wt_buf$next  = wt_initdat;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$1 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$3 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$5 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$7 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \wt_buf$next  = \$12 [511:0];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \wt_buf$next  = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    s1_s1_x = 32'd0;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          s1_s1_x = wt_buf[63:32];
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-1$next  = \sbuf-1 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$101 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$103 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$105 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$107 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-1$next  = wt_buf[63:32];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-1$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-2$next  = \sbuf-2 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$109 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$111 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$113 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$115 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-2$next  = wt_buf[95:64];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-2$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-3$next  = \sbuf-3 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$117 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$119 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$121 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$123 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-3$next  = wt_buf[127:96];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-3$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-4$next  = \sbuf-4 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$125 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$127 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$129 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$131 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-4$next  = wt_buf[159:128];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-4$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-5$next  = \sbuf-5 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$133 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$135 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$137 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$139 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-5$next  = wt_buf[191:160];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-5$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-6$next  = \sbuf-6 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$141 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$143 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$145 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$147 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-6$next  = wt_buf[223:192];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-6$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-7$next  = \sbuf-7 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$149 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$151 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$153 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$155 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-7$next  = wt_buf[255:224];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-7$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-8$next  = \sbuf-8 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$157 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$159 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$161 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$163 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-8$next  = wt_buf[287:256];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-8$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-9$next  = \sbuf-9 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$165 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$167 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$169 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$171 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-9$next  = wt_buf[319:288];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-9$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-10$next  = \sbuf-10 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$173 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$175 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$177 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$179 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-10$next  = wt_buf[351:320];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-10$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    s0_s0_x = 32'd0;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          s0_s0_x = wt_buf[479:448];
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-11$next  = \sbuf-11 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$181 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$183 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$185 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$187 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-11$next  = wt_buf[383:352];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-11$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-12$next  = \sbuf-12 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$189 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$191 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$193 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$195 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-12$next  = wt_buf[415:384];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-12$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-13$next  = \sbuf-13 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$197 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$199 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$201 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$203 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-13$next  = wt_buf[447:416];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-13$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-14$next  = \sbuf-14 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$205 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$207 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$209 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$211 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-14$next  = wt_buf[479:448];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-14$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \sbuf-15$next  = \sbuf-15 ;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$213 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$215 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$217 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$219 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \sbuf-15$next  = wt_buf[511:480];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \sbuf-15$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \debug_sig$next  = debug_sig;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$221 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$223 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$225 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$227 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \debug_sig$next  = \$230 [31:0];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \debug_sig$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \lastResult$next  = lastResult;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$232 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$234 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$236 )
                        /* src = "shaman/operations/wt.py:176" */
                        1'h1:
                            \lastResult$next  = currentResult;
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \lastResult$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \currentResult$next  = currentResult;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$238 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$240 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$242 )
                        /* src = "shaman/operations/wt.py:176" */
                        1'h1:
                            \currentResult$next  = wt_res;
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \currentResult$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    wt_res = 32'd0;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          wt_res = \$19 [31:0];
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \wt_lastcnt$next  = wt_lastcnt;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
        begin
          casez (\$21 )
            /* src = "shaman/operations/wt.py:149" */
            1'h1:
                \wt_lastcnt$next  = wt_count;
          endcase
          (* full_case = 32'd1 *)
          casez (\$23 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$25 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$27 )
                        /* src = "shaman/operations/wt.py:180" */
                        1'h1:
                            \wt_lastcnt$next  = wt_count;
                      endcase
                endcase
          endcase
        end
    endcase
    casez (rst)
      1'h1:
          \wt_lastcnt$next  = 6'h00;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \wt_outrdy$next  = wt_outrdy;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$29 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                \wt_outrdy$next  = 1'h1;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$31 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                    begin
                      casez (\$33 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            \wt_outrdy$next  = 1'h0;
                      endcase
                      casez (\$35 )
                        /* src = "shaman/operations/wt.py:176" */
                        1'h1:
                            \wt_outrdy$next  = 1'h0;
                      endcase
                      casez (\$37 )
                        /* src = "shaman/operations/wt.py:180" */
                        1'h1:
                            \wt_outrdy$next  = 1'h1;
                      endcase
                    end
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \wt_outrdy$next  = 1'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \wt_out$next  = wt_out;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$39 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
              begin
                casez (\$41 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[511:480];
                endcase
                casez (\$43 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[479:448];
                endcase
                casez (\$45 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[447:416];
                endcase
                casez (\$47 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[415:384];
                endcase
                casez (\$49 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[383:352];
                endcase
                casez (\$51 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[351:320];
                endcase
                casez (\$53 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[319:288];
                endcase
                casez (\$55 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[287:256];
                endcase
                casez (\$57 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[255:224];
                endcase
                casez (\$59 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[223:192];
                endcase
                casez (\$61 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[191:160];
                endcase
                casez (\$63 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[159:128];
                endcase
                casez (\$65 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[127:96];
                endcase
                casez (\$67 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[95:64];
                endcase
                casez (\$69 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[63:32];
                endcase
                casez (\$71 )
                  /* src = "shaman/operations/wt.py:157" */
                  1'h1:
                      \wt_out$next  = wt_buf[31:0];
                endcase
              end
            /* src = "shaman/operations/wt.py:159" */
            default:
                \wt_out$next  = currentResult;
          endcase
    endcase
    casez (rst)
      1'h1:
          \wt_out$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \tickDelay$next  = tickDelay;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$73 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$75 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                    begin
                      \tickDelay$next  = \$78 [1:0];
                      casez (\$80 )
                        /* src = "shaman/operations/wt.py:180" */
                        1'h1:
                            \tickDelay$next  = 2'h0;
                      endcase
                    end
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \tickDelay$next  = 2'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \lastVal$next  = lastVal;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$82 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$84 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$86 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$88 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \lastVal$next  = currentResult;
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \lastVal$next  = 32'd0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$65 ) begin end
    \shiftCount$next  = shiftCount;
    (* full_case = 32'd1 *)
    casez (initBufferReady)
      /* src = "shaman/operations/wt.py:194" */
      1'h1:
          /* empty */;
      /* src = "shaman/operations/wt.py:196" */
      default:
          (* full_case = 32'd1 *)
          casez (\$90 )
            /* src = "shaman/operations/wt.py:153" */
            1'h1:
                /* empty */;
            /* src = "shaman/operations/wt.py:159" */
            default:
                casez (\$92 )
                  /* src = "shaman/operations/wt.py:168" */
                  1'h1:
                      casez (\$94 )
                        /* src = "shaman/operations/wt.py:171" */
                        1'h1:
                            casez (\$96 )
                              /* src = "shaman/operations/wt.py:173" */
                              1'h1:
                                  \shiftCount$next  = \$99 [9:0];
                            endcase
                      endcase
                endcase
          endcase
    endcase
    casez (rst)
      1'h1:
          \shiftCount$next  = 10'h000;
    endcase
  end
  assign \$9  = \$12 ;
  assign \$14  = \$19 ;
  assign \$77  = \$78 ;
  assign \$98  = \$99 ;
  assign \$229  = \$230 ;
  assign \$10  = { 31'h00000000, wt_buf, 32'h00000000 };
endmodule

