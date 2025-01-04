`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

program muxm_test
  (
   input logic 		 clk,
   input logic 		 rst_n,
   output logic 	 sel_in,
   output logic [15:0] d0_in,
   output logic [15:0] d1_in,
   input logic [15:0]  m_out);
   
   initial
     begin : test_program

	////////////////////////////////////////////////////////////////
	// Initialization
	////////////////////////////////////////////////////////////////
	sel_in = '0;
	d0_in = '0;
	d1_in = '0;

	wait(rst_n);

	////////////////////////////////////////////////////////////////
	// T1
	////////////////////////////////////////////////////////////////	

	$info("T1");

	// Set inputs so that d0_in is selected
	@(negedge clk);
	sel_in = 1'b0;
	d0_in = 123;
	d1_in = 0;

	// After some time, check that outputs are ok.
	@(posedge clk);
	assert (m_out == 123)
	  else $error("T1: muxm output value is wrong!");

	////////////////////////////////////////////////////////////////
	// T2
	////////////////////////////////////////////////////////////////	

	$info("T2");

	// Set inputs so that d1_in is selected	
	@(negedge clk);
	sel_in = 1'b1;
	d0_in = 0;
	d1_in = 456;

	// After some time, check that outputs are ok.
	@(posedge clk);
	assert (m_out == 456)
	  else $error("T2: muxm output value is wrong!");
	
	////////////////////////////////////////////////////////////////
	// T3
	////////////////////////////////////////////////////////////////	

	$info("T3");
	
	repeat (20) begin

	   // Generate random input data
	   @(negedge clk);
	   sel_in = $urandom;
	   d0_in = $urandom;
	   d1_in = $urandom;

	   // Check output value based on input values
	   @(posedge clk);
	   assert ((sel_in && (d1_in == m_out) || (!sel_in && (d0_in == m_out))))
	     else $error("muxm output value is wrong!");
	end // repeat (20)
	
	$finish;

     end : test_program
   
endprogram

`endif
