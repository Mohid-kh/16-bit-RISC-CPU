`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

program ir_test
  (
   input logic 	       clk,
   input logic 	       rst_n,
   output logic        il_in,
   output logic [15:0] ins_in,
   input logic [15:0]  ins_out
   );

   initial
     begin

	///////////////////////////////////////////////////////////////////////
	$info("T1: Reset Test");
	///////////////////////////////////////////////////////////////////////	

	il_in = '0;
	ins_in = 16'b00000000_00000000;
	wait (rst_n);
	@(negedge clk);

	///////////////////////////////////////////////////////////////////////	
	$info("T2: Load test");
	///////////////////////////////////////////////////////////////////////	

	// Set inputs that load an all-ones patterm into the register
	il_in = '1;
	ins_in = 16'b11111111_11111111;
	@(posedge clk);

	// After a clock edge, check that the pattern appears at output
	assert (ins_in == ins_out) else $error("Load test: %16b != %16b", ins_in, ins_out);
	@(negedge clk);

	///////////////////////////////////////////////////////////////////////	
	$info("T3: Hold test");
	///////////////////////////////////////////////////////////////////////		

	// Disable loading and set data input to all-zeroes
	il_in = '0;
	ins_in = 16'b00000000_00000000;
	@(posedge clk);

	// After a clock edge, check that the register retained its current state 
	assert (ins_out == 16'b11111111_11111111) else $error("Hold test: ins_out changed while il_in == '0");
	@(negedge clk);
	
     end

endprogram 
   
`endif
