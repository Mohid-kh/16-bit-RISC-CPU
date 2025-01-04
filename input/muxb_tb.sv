`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

module muxb_tb;
   logic clk;
   logic rst_n;
   logic sel_in;
   logic [15:0] d0_in;
   logic [15:0] d1_in;
   logic [15:0] m_out;
	
   muxb DUT(.*);
   muxb_test TEST(.*);   

   always
     begin : clock_generator
	if (clk === '0)
	  clk = '1;
	else
	  clk = '0;
	#CLK_PERIOD;
     end : clock_generator

   initial
     begin : reset_generator
	rst_n = '0;
	@(negedge clk);
	@(negedge clk);
	rst_n = '1;
     end : reset_generator
      
endmodule

`endif      
   
