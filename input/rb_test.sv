`include "mycpu.svh"

import mycpu_pkg::*;

program rb_test
  (
   input logic 	       clk,
   input logic 	       rst_n,
   output logic [15:0] d_in,
   output logic        rw_in,
   output logic [11:0] rs_in,
   input logic [15:0]  a_out,
   input logic [15:0]  b_out
   );

logic [7:0][15:0] rb_r1; 		// rb reg replica
logic [7:0][15:0] hb_r1;		// hb reg replica
int   		  incr;			// to keep count of repeat

   initial
     begin
	///////////////////////////////////////////////////////////////////////
	$info("T1: Reset Test");
	///////////////////////////////////////////////////////////////////////	
	d_in  = '0;
	rw_in = '0;
	rs_in = '0;
	wait (rst_n);

	///////////////////////////////////////////////////////////////////////	
	// TEST
	$info("T2: Write-Read Test");
	///////////////////////////////////////////////////////////////////////
        repeat(10) begin : rpt

	// STIMULUS
	for(int i = 0; i < 16; i++)
	begin : iteration_1
        if(incr < 2)
	 d_in = 6+1+i;				// last digit = 6
        else 
	 d_in = $urandom & 16'hFFFF;
	rw_in = '1;
	rs_in[11:8] = i;
	if(rs_in[11:8] < 8) 
	 rb_r1[i] = d_in;
	else
	 hb_r1[i-8] = d_in;
	@(posedge clk);
	rs_in[7:4] = i;
	rs_in[3:0] = i;

 	// RESPONSE
        @(negedge clk);                 	// wait for neg edge of clk
   	assert((rs_in[7:4] < 8  && a_out == rb_r1[i]) || 
	       (rs_in[7:4] >= 8 && a_out == hb_r1[i-8]))          
   	else $error("wrong a_out value");  	
   	assert((rs_in[3:0] < 8  && b_out == rb_r1[i]) || 
	       (rs_in[3:0] >= 8 && b_out == hb_r1[i-8]))          
   	else $error("wrong b_out value"); 
	end : iteration_1  
	for(int j = 0; j < 8; j++) begin
	if(incr < 9)   begin			// reset registers' values for next repeat
	rb_r1[j] = '0;
	hb_r1[j] = '0; end
	end 
	incr++;
	end : rpt

	///////////////////////////////////////////////////////////////////////	
	$info("T3: Read Test");
	///////////////////////////////////////////////////////////////////////
	 // STIMULUS
	 repeat(10) begin : rpt2
	 for(int i = 0; i < 16; i++)
	 begin : iteration_2
	 d_in = i;		
	 rw_in = '0;
	 rs_in[11:8] = i;
	 rs_in[7:4] = i;
	 rs_in[3:0] = i;

	 // RESPONSE
	 @(negedge clk);
	 assert((rs_in[7:4] < 8 && a_out == rb_r1[i]) || 
	       (rs_in[7:4] >= 8 && a_out == hb_r1[i-8]))
	 else $error("a_out value is wrong");
	 assert((rs_in[3:0] < 8 && b_out == rb_r1[i]) || 
	       (rs_in[3:0] >= 8 && b_out == hb_r1[i-8]))
	 else $error("b_out value is wrong");
	 end :iteration_2
	 end : rpt2		     
	$finish;
     end
endprogram
