`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

program pc_test
  (
   input logic 	       clk,
   input logic 	       rst_n,
   output logic [1:0]  ps_in,
   output logic [15:0] ins_in,
   output logic [15:0] ra_in, 
   input logic [15:0]  pc_out      
   );

logic [15:0] result;          // dummy pc_r value
logic signed [5:0] ba_temp;  

  initial 
   begin : test
   ps_in  = '0;
   ins_in = '0;
   ra_in  = '0;
   
   #5                       // 5 ns delay to see reset test

   $info("T1 - Reset Test");

   wait(rst_n);             // wait until reset = 1

   repeat(20) 
   begin : rpt

   $info("T2 - ps_in = 11");
   
   // Stimulus
   @(negedge clk);         // wait for neg edge of clk
   ps_in = 2'b11;
   ins_in = $urandom;
   ra_in  = $urandom;
  
   // Response
   @(posedge clk);                 // wait for pos edge of clk
   assert(pc_out == ra_in)         // pc_r = ra_in
   else $error("wrong pc_out value");   

   result = ra_in;    

   $info("T3 - ps_in = 00");
   
   // Stimulus
   @(negedge clk);  
   ps_in  = 2'b00;
   ins_in = $urandom;
   ra_in  = $urandom;

   // Response
   @(posedge clk);
   assert(pc_out == result)
   else $error("wrong pc_out value");  

   $info("T4 - ps_in = 01");
   
   // Stimulus
   @(negedge clk);  
   ps_in  = 2'b01;
   ins_in = $urandom;
   ra_in  = $urandom;

   // Response
   @(posedge clk);
   assert(pc_out == (result + 1))
   else $error("wrong pc_out value");

   result = result + 1; 

   $info("T5 - ps_in = 10");
   
   // Stimulus
   @(negedge clk);  
   ps_in  = 2'b10;
   ins_in = $urandom;
   ra_in  = $urandom;

   ba_temp = {{ins_in[8:6]}, {ins_in[2:0]}};
   result = $signed(result) + ba_temp;

   // Response
   @(posedge clk);
   assert(pc_out == result)
   else $error("wrong pc_out value");

   @(negedge clk);

   end : rpt
   end   : test
endprogram


`endif
