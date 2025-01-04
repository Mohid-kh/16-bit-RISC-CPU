`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;


module muxd_tb  #(parameter DUT_VS_REF_SIMULATION = 0);
   logic clk;
   logic rst_n;   
   logic [1:0] sel_in;
   logic [2:0][15:0] d_in;
   logic [15:0] m_out;

muxd DUT(.*);         // muxd DUT  instance
muxd_test TEST(.*);   // muxd test instance

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
   
