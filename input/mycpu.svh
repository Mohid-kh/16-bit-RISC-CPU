`ifndef SYNTHESIS

`timescale 1ns / 1ps

// Uncomment this to enable binding of assertion modules in mycpu_svabind.svh
  `define INCLUDE_ASSERTIONS

// Uncomment this to enable reporting functions in mycpu_tb.sv
 `define ENABLE_CPU_REPORTER

// This macro creates an unknowns check assertion
`define xcheck(name) X_``name``: assert property ( @(posedge clk) disable iff (rst_n !== '1) !$isunknown( name) ) else $error(`"name has unknown bits.`")   

// This macro creates an reset check assertion
`define resetcheck(name,value) R_``name``: assert property ( @(posedge rst_n) (name == value) ) else $error(`"name reset state is wrong.`")   
		
`endif
