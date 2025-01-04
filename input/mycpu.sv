`include "mycpu.svh"

import mycpu_pkg::*;

module mycpu
  (
   input logic 	       clk,
   input logic 	       rst_n,
   output logic [15:0] a_out, 
   input logic [15:0]  d_in,
   output logic [15:0] d_out,
   input logic [15:0]  io_in,
   output logic        wen_out,
   output logic        iom_out
   );

logic [1:0] ps;
logic il;
logic [3:0] mx;
logic [2:0][15:0] md;
logic rw;
logic [11:0] rs;
fs_t fs;
logic [15:0] pca;
logic [15:0] ins;
logic [15:0] abus;
logic [15:0] bdat;
logic [15:0] bbus;
logic [15:0] dbus;
logic [15:0] fbus;
logic [1:0] nz;

// instantiations
pc   PC(.clk(clk), .rst_n(rst_n), .ps_in(ps), .ins_in(ins), .ra_in(abus), .pc_out(pca));
ir   IR(.clk(clk), .rst_n(rst_n), .il_in(il), .ins_in(d_in), .ins_out(ins));
cu CU(.clk(clk), .rst_n(rst_n), .ins_in(ins), .nz_in(nz), .il_out(il), .ps_out(ps), .rw_out(rw), .rs_out(rs), .mx_out(mx), .fs_out(fs), .wen_out(wen_out), .iom_out(iom_out));
fu   FU(.a_in(abus), .b_in(bbus), .fs_in(fs), .f_out(fbus), .nz_out(nz));
muxb MUXB(.sel_in(mx[3]), .d0_in(bdat), .d1_in(ins), .m_out(bbus));
rb   RB(.clk(clk), .rst_n(rst_n), .d_in(dbus), .rw_in(rw), .rs_in(rs), .a_out(abus), .b_out(bdat));
muxd MUXD(.sel_in(mx[2:1]), .d_in(md), .m_out(dbus));  
muxm MUXM(.sel_in(mx[0]), .d0_in(abus), .d1_in(pca), .m_out(a_out));

assign d_out = bbus;
assign md[0] = io_in;
assign md[1] = d_in;
assign md[2] = fbus;

endmodule 
