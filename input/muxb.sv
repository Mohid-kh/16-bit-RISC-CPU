`include "mycpu.svh"

import mycpu_pkg::*;

module muxb
  (input logic sel_in,
   input logic [15:0] d0_in,
   input logic [15:0] d1_in,
   output logic [15:0] m_out);
   
   // procedural program design for muxb
   always_comb
   begin : muxb_logic
   if(sel_in)
   m_out = 16'h0000 | d1_in[2:0];
   else
   m_out = d0_in;   
   end   : muxb_logic
endmodule
