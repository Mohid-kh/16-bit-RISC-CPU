// This macro is defined in mycpu.svh:
`ifdef INCLUDE_ASSERTIONS

`ifdef design_top_is_mycpu

bind mycpu mycpu_svamod SVA_mycpu (.*);
bind ir ir_svamod SVA_ir (.*);
bind pc pc_svamod SVA_pc (.*);
bind rb rb_svamod SVA_rb (.*);
bind cu cu_svamod SVA_cu (.*);
bind mycpu fu_svamod SVA_FU (.a_in(abus), .b_in(bbus), .fs_in(fs), .f_out(fbus), .nz_out(nz), .*);
bind mycpu muxm_svamod SVA_MUXM (.sel_in(mx[0]), .d0_in(abus), .d1_in(pca), .m_out(a_out), .*);
bind mycpu muxb_svamod SVA_MUXB (.sel_in(mx[3]), .d0_in(bdat), .d1_in(ins), .m_out(bbus), .*);
bind mycpu muxd_svamod #(.N(3)) SVA_MUXD (.sel_in(mx[2:1]), .d_in({ fbus, d_in, io_in }), .m_out(dbus), .*);

`endif


`ifdef design_top_is_muxm
bind muxm_tb muxm_svamod SVA_muxm (.*);
`endif

`ifdef design_top_is_muxd
bind muxd_tb muxd_svamod #(.N(3)) SVA_muxd (.*);
`endif

`ifdef design_top_is_muxb
bind muxb_tb muxb_svamod SVA_muxb (.*);
`endif

`ifdef design_top_is_fu
bind fu_tb fu_svamod SVA_fu (.*);
`endif


`ifdef design_top_is_ir
bind ir ir_svamod SVA_ir (.*);
`endif


`ifdef design_top_is_pc
bind pc pc_svamod SVA_pc (.*);
`endif


`ifdef design_top_is_rb
bind rb rb_svamod SVA_rb (.*);
`endif


`ifdef design_top_is_cu
bind cu cu_svamod SVA_cu (.*);
`endif


`endif
