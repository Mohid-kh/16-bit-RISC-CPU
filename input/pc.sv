`include "mycpu.svh"

import mycpu_pkg::*;

module pc
  (
   input logic 	       clk,
   input logic 	       rst_n,
   input logic [1:0]   ps_in,
   input logic [15:0]  ins_in,
   input logic [15:0]  ra_in, 
   output logic [15:0] pc_out      
   );
   
logic [15:0] pc_r;	// pc reg 
logic signed [5:0]  ba;        // six bit vector

  always_ff @(posedge clk or negedge rst_n)
   begin : pc_regs
   if(rst_n == '0)
    pc_r <= '0;
   else
    begin : n_reset    // not reset
    if(ps_in == '0)
     pc_r <= pc_r;
    else if(ps_in == 2'b01)
     pc_r <= pc_r + 1;
    else if(ps_in == 2'b10)
     pc_r <= $unsigned($signed(pc_r) + ba);
    else 
     pc_r <= ra_in;
    end   : n_reset 
   end   : pc_regs 

assign ba     = {{ins_in[8:6]}, {ins_in[2:0]}};
assign pc_out = pc_r;

endmodule
   
