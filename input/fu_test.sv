`include "mycpu.svh"

import mycpu_pkg::*;

module fu_test
  (
   input logic 	       clk,
   input logic 	       rst_n,
   output logic [15:0] a_in,
   output logic [15:0] b_in, 
   output fs_t  fs_in,   
   input logic [15:0]  f_out,
   input logic [1:0]   nz_out
   );

   localparam int      TEST_COUNT = 30;
   
   initial
     begin : test_program
	a_in = '0;
	b_in = '0;
	fs_in = FMOVA;

	wait(rst_n);

	$info("T1:");
	
	$display("===============================================================================");
	$display("     %5s  %16s %16s => %16s %1s %1s", "fs_in", "a_in", "b_in", "f_out", "N", "Z");
	$display("===============================================================================");
	
	repeat(TEST_COUNT)
	  begin
	     fs_t fs;
	     for (int i=0; i < 16; ++i)
	       begin
		  fs_in = fs_t'(i);
		  a_in = $urandom;
		  b_in = $urandom;
		  fs = fs_t'(fs_in);
		  @(posedge clk);
		  $display("     %5s  %16b %16b => %16b %1b %1b", fs.name(), a_in, b_in, f_out, nz_out[0], nz_out[1]);
		  @(negedge clk);	     
	       end
	  end

	$finish;
	
     end : test_program

endmodule
