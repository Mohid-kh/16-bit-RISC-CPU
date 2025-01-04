`include "mycpu.svh"

import mycpu_pkg::*;

module rb
  (
   input logic 	       clk,
   input logic 	       rst_n,
   input logic [15:0]  d_in,
   input logic 	       rw_in,
   input logic [11:0]   rs_in,
   output logic [15:0] a_out,
   output logic [15:0] b_out
   );

logic [7:0][15:0] rb_r; 	// 8x16 user   reg bank
logic [7:0][15:0] hb_r;         // 8x16 hidden reg bank

  always_ff @(posedge clk or negedge rst_n)
   begin : reg_bnk
   if(rst_n == 0)
    begin : rst_state
    rb_r <= '0;
    hb_r <= '0;
    end   : rst_state
   else
    begin : reg_asgn			// assign values to registers
    for(int i = 0; i < 8; i++)
     begin : iteration_rb 		// iterating through rs_in bits for rb_r reg
     if(rs_in[11:8] == i && rw_in == 1)
      rb_r[i] <= d_in;
     end   : iteration_rb
    for(int i = 8; i < 16; i++)
     begin : iteration_hb		// iterating through rs_in bits for hb_r reg
     if(rs_in[11:8] == i && rw_in == 1)
      hb_r[i-8] <= d_in;
     end : iteration_hb   
    end : reg_asgn		
   end : reg_bnk

  always_comb
   begin : op_asgn 			// assign values to output ports 
     a_out = '0;
     b_out = '0;
   for(int i = 0; i < 8; i++)
    begin : a_op			// reg values assigned to a_out
    if(rs_in[7:4] == i)
     a_out = rb_r[i];
    else if(rs_in[7:4] == i+8)
     a_out = hb_r[i];
    end : a_op
   for(int i = 0; i < 8; i++)
    begin : b_op			// reg values assigned to b_out
    if(rs_in[3:0] == i)
     b_out = rb_r[i];
    else if(rs_in[3:0] == i+8)
     b_out = hb_r[i];
    else;				// prevent latch infer
    end : b_op
   end : op_asgn

endmodule
