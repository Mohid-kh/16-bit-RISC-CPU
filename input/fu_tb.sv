`include "mycpu.svh"

import mycpu_pkg::*;

module fu_tb  #(parameter DUT_VS_REF_SIMULATION = 0);
   logic clk;
   logic rst_n;
   logic [15:0] a_in;
   logic [15:0] b_in; 
   fs_t 	fs_in;
   logic [15:0] f_out;
   logic [1:0] 	nz_out;
   
   fu DUT (.*);
   
`ifdef RTL_SIM
 `include "mycpu_svabind.svh"   
`endif 
   
   fu_test TEST (.*);

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
