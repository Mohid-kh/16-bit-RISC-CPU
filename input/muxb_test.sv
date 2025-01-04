`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

program muxb_test
  (
   input logic 		 clk,
   input logic 		 rst_n,
   output logic 	 sel_in,
   output logic [15:0] d0_in,
   output logic [15:0] d1_in,
   input logic [15:0]  m_out);

   initial 
        begin : muxb_testprog
 	// initialization
	d0_in  = '0;
	d1_in  = '0;
	sel_in = '0;

	wait(rst_n);   // wait until reset_n is 1

        // T1 
	$info("T1");

	// Stimulus (d0_in selected initially)
	@(negedge clk);
	d0_in = 4326;
	d1_in = '0;
	sel_in = '0;
	
	// Response
	@(posedge clk);
	assert(m_out == 4326)
	 else $error("m_out incorrect)");
	
	// T2
	$info("T2");
	
	// Stimulus
	@(negedge clk);
	d0_in  = '0;
	d1_in  = 6234; // reverse order std. no.
	sel_in = '1;
	
	// Response
	@(posedge clk);
	assert(m_out == 2)
	 else $error("m_out incorrect");

	// T3
	$info("T3");
        
	repeat(20)
        begin : repeat_20
	  // Stimulus
	  @(negedge clk)
	  d0_in  = $urandom;
	  d1_in  = $urandom;
	  sel_in = $urandom;
	
	  // Response
	  @(posedge clk)
	  assert((sel_in == 0 && m_out == d0_in) || (sel_in == 1 && m_out == d1_in[2:0]))
	  else $error("m_out incorrect"); 

        end: repeat_20
       $finish;
        end   : muxb_testprog
endprogram

`endif
