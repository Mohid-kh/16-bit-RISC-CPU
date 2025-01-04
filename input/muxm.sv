`include "mycpu.svh"

import mycpu_pkg::*;

module muxm
  (input logic sel_in,
   input logic [15:0] d0_in,
   input logic [15:0] d1_in,
   output logic [15:0] m_out);
   
   // always combination for muxm 
   always_comb
   begin : muxm_logic
   if(sel_in)
   m_out = d1_in;
   else
   m_out = d0_in;
   end   : muxm_logic

endmodule

