`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

program muxd_test
  (
   input logic 		   clk,
   input logic 		   rst_n,
   output logic [1:0] 	   sel_in,
   output logic [2:0][15:0] d_in,
   input logic [15:0] 	   m_out
   );
   
   initial 
    begin : test_prog
    sel_in = '0;
    d_in   = '0;

    wait(rst_n); // wait until reset state is 1
   
     // Test T1
     $info("T1");
   
     repeat (20) // repeat the iterations 20 times
     begin : repeat_20
     
     // Stimulus
     @(negedge clk);
     sel_in     = $urandom_range(2,0);
     d_in[0]    = $urandom;
     d_in[1]    = $urandom;
     d_in[2]    = $urandom;
     
     // Response
     @(posedge clk);
     assert(!sel_in && (m_out == d_in[0]) || sel_in && (m_out == d_in[1]) || (sel_in == 2) && (m_out == d_in[2]))
     else $error("m_out incorrect");
   
     end : repeat_20
   end : test_prog
endprogram

`endif
