`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;
import cu_pkg::*;

program cu_test
  (
   input logic 		 clk,
   output logic 	 rst_n,
   output logic [15:0]   ins_in,
   output logic [1:0] 	 nz_in,
   input logic 		 il_out,
   input logic [1:0] 	 ps_out,
   input logic 		 rw_out,
   input logic [11:0] 	 rs_out,
   input logic [3:0] 	 mx_out,
   input logic [3:0] 	 fs_out,
   input logic 		 wen_out,
   input logic 		 iom_out   
   );

   int 			 state;
   localparam int 	 OPCODE_TEST_COUNT = 70;  

   initial
     begin

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T1: Reset");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	rst_n = '0;
	{ ins_in, nz_in } = '0;

	@(negedge clk);	

	rst_n = '1;

	@(posedge clk);

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T2: Opcodes");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	print_st_header();

	for (int j = 0; j < OPCODE_TEST_COUNT; ++j)
	  begin
	     for (int i=0; i < OPCODE_COUNT-2; ++i) // -2 == Exclude USR and HAL
	       begin
		  automatic int testcode;
		  { ins_in, nz_in } = $urandom;           
		  if (j == 0)
		    begin
		       ins_in[15:9] = opcodetable[i];
		       testcode = i;
		    end
		  else
		    begin
		       testcode = $urandom_range(0, OPCODE_COUNT-3);
		       ins_in[15:9] = opcodetable[testcode];		       
		    end
		     
		  @(posedge clk);             	     	     
		  @(negedge clk);
		  if (!st_match( { EX0, ins_in, nz_in}, { INF, ps_out, il_out, rw_out, rs_out, mx_out, fs_out, wen_out, iom_out}, state))
		    begin
		       $error("%s", opcodetable[testcode].name());
		    end
		  print_ref_values(ins_in, nz_in, state);
		  print_st_row(ins_in, nz_in, ps_out, il_out, rw_out, rs_out, mx_out, fs_out, wen_out, iom_out);	     
		  @(posedge clk);             	     	     
	       end
	  end
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T3: HAL");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	{ ins_in, nz_in } = $urandom;           
	ins_in[15:9] = HAL;
	@(posedge clk);
	@(negedge clk);
	if (!st_match( { EX0, ins_in, nz_in}, { HLT, ps_out, il_out, rw_out, rs_out, mx_out, fs_out, wen_out, iom_out}, state))
	  $error("HAL");
	print_st_row(ins_in, nz_in,  ps_out, il_out, rw_out, rs_out, mx_out, fs_out, wen_out, iom_out);	     
	@(posedge clk);
	@(posedge clk);
        @(posedge clk);             	     	     	

	// Reset needed to get away from HAL
        @(posedge clk);
        @(negedge clk);	
	rst_n = '0;
	{ ins_in, nz_in } = '0;
	@(negedge clk);	
	rst_n = '1;
	@(posedge clk);

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T4: Illegal");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	{ ins_in, nz_in } = $urandom;           
	ins_in[15:9] = 7'b1111100;
	@(posedge clk);             	     	     
	@(negedge clk);
	print_st_row(ins_in, nz_in, ps_out, il_out, rw_out, rs_out, mx_out, fs_out, wen_out, iom_out);	     
	@(posedge clk);             	     	     
	@(posedge clk);
	@(posedge clk);
	// Reset needed to get away from HAL
	rst_n = '0;
	{ ins_in, nz_in } = '0;
	@(negedge clk);	
	rst_n = '1;
	@(posedge clk);

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$info("T5: USR");	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// ------------------------------------------------------------------------------------------------------------
	// Cycle: 0 (state INF)
	// ------------------------------------------------------------------------------------------------------------
	repeat(20) begin : rpt_20

	// To do: Set inputs
	ins_in[15:9] = USR;		// OPCODE
	ins_in[8:0]  = $urandom;  				                // To do: Set appropriately for your test case
	nz_in        = $urandom;        // positive and non-zero value          // To do: Set appropriately for your test case

	// Move from cu state INF to state EXO
	@(posedge clk); 
	@(negedge clk); 

	// ------------------------------------------------------------------------------------------------------------
	// Cycle: 1 (state EX0)
	// ------------------------------------------------------------------------------------------------------------
	
	// To do: Set inputs
	
	// To do: Check output
	assert(ps_out ==  1 && il_out == '0 && rw_out ==  1 && mx_out == 4'b0100 && fs_out == FUSR && wen_out == 1 && iom_out == '0)
        else 
         $error("wrong values!");

	// Move to next state (EX0 -> INF)
	@(posedge clk); 
	@(negedge clk); 

	end : rpt_20

	// ------------------------------------------------------------------------------------------------------------
	// Cycle: 2 (state INF)
	// ------------------------------------------------------------------------------------------------------------
	
	// To do: Set inputs
        
	// To do: Check output


	// Move to next state
	@(posedge clk); 
	@(negedge clk); 

	// To do: Add test of the test

	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	$finish;
	
     end

endprogram

`endif
