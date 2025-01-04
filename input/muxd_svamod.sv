`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

module muxd_svamod
  #(parameter N = 4)
  (
   input logic 		      clk,
   input logic 		      rst_n,
   input logic [$clog2(N)-1:0] sel_in,
   input logic [N-1:0][15:0]  d_in,   
   input logic [15:0] 	      m_out
   );
   
   `xcheck(sel_in);
   `xcheck(d_in);
   `xcheck(m_out);
   
endmodule

`endif
