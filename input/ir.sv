`include "mycpu.svh"

import mycpu_pkg::*;

module ir
  (
   input logic 	       clk,
   input logic 	       rst_n,
   input logic 	       il_in,
   input logic [15:0]  ins_in,
   output logic [15:0] ins_out
   );

logic [15:0] ir_r;  // to store instr fetched

  always_ff @(posedge clk or negedge rst_n)  // rising edge clk or falling edge reset
   begin : ir_regs
   if(rst_n == '0)
    ir_r <= 0;                               // reset
   else if(il_in == '1)
    ir_r <= ins_in;
   end   : ir_regs
         
  assign ins_out = ir_r;                     // IR output   

endmodule


