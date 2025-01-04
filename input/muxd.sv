`include "mycpu.svh"

import mycpu_pkg::*;

module muxd
  #(parameter N = 3)
  (input logic [$clog2(N)-1:0] sel_in,
   input logic [N-1:0][15:0]  d_in,
   output logic [15:0] m_out);
   
   // design program for muxd
   always_comb
   begin  : muxd_logic
     m_out = '0;
     for(int i = 0; i < N; i++)
     begin : for_loop
     if(sel_in == i)
       m_out = d_in[i];
     end   : for_loop
   end    : muxd_logic
   
endmodule
