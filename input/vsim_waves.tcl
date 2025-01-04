onerror {resume}
quietly WaveActivateNextPane {} 0

set user $::env(USER)
add wave -noupdate -divider "${DESIGN_NAME} (${user})"

if { $DESIGN_NAME == "fu" } {

    add wave -noupdate /fu_tb/DUT/fs_in
    add wave -noupdate -expand -group SIGNED -radix decimal /fu_tb/DUT/a_in
    add wave -noupdate -expand -group SIGNED -radix decimal /fu_tb/DUT/b_in
    add wave -noupdate -expand -group SIGNED -radix decimal /fu_tb/DUT/f_out

    add wave -noupdate -expand -group UNSIGNED -radix unsigned /fu_tb/DUT/a_in
    add wave -noupdate -expand -group UNSIGNED -radix unsigned /fu_tb/DUT/b_in
    add wave -noupdate -expand -group UNSIGNED -radix unsigned /fu_tb/DUT/f_out

    add wave -noupdate -expand -group BINARY -radix binary /fu_tb/DUT/a_in
    add wave -noupdate -expand -group BINARY -radix binary /fu_tb/DUT/b_in
    add wave -noupdate -expand -group BINARY -radix binary /fu_tb/DUT/f_out

    add wave -noupdate /${DESIGN_NAME}_tb/DUT/*
    
} elseif { $DESIGN_NAME != "mycpu" } {

    add wave -noupdate /${DESIGN_NAME}_tb/DUT/*

} else {

    add wave -noupdate -radix unsigned /mycpu_tb/cycle_counter

    if { [info exists VSIM_GATELEVEL] == 0} {

	add wave -noupdate /mycpu_tb/DUT/clk
	add wave -noupdate /mycpu_tb/DUT/rst_n
	add wave -noupdate -radix unsigned /mycpu_tb/DUT/a_out
	add wave -noupdate -radix decimal /mycpu_tb/DUT/d_in
	add wave -noupdate -radix decimal /mycpu_tb/DUT/d_out
	add wave -noupdate -radix decimal /mycpu_tb/DUT/io_in
	add wave -noupdate /mycpu_tb/DUT/wen_out
	add wave -noupdate /mycpu_tb/DUT/iom_out

	add wave -noupdate -divider "CONTROL LOGIC"

	add wave -noupdate -expand -group CU /mycpu_tb/DUT/CU/st_r	
	add wave -noupdate -expand -group CU /mycpu_tb/DUT/CU/opcode

	add wave -noupdate -expand -group CU -expand -group "Inputs" /mycpu_tb/DUT/CU/*_in
	add wave -noupdate -expand -group CU -expand -group "Outputs" /mycpu_tb/DUT/CU/*_out		

	add wave -noupdate -expand -group PC -expand -group "Inputs" /mycpu_tb/DUT/PC/*_in
	add wave -noupdate -expand -group PC -expand -group "Outputs" /mycpu_tb/DUT/PC/*_out		

	add wave -noupdate -expand -group IR -expand -group "Inputs" /mycpu_tb/DUT/IR/*_in
	add wave -noupdate -expand -group IR -expand -group "Outputs" /mycpu_tb/DUT/IR/*_out

	add wave -noupdate -group "Control Signals" /mycpu_tb/DUT/il
	add wave -noupdate -group "Control Signals" /mycpu_tb/DUT/ps
	add wave -noupdate -group "Control Signals" /mycpu_tb/DUT/rw
	add wave -noupdate -group "Control Signals" /mycpu_tb/DUT/rs
	add wave -noupdate -group "Control Signals" /mycpu_tb/DUT/fs
	add wave -noupdate -group "Control Signals" /mycpu_tb/DUT/mx
	add wave -noupdate -group "Control Signals" /mycpu_tb/DUT/nz						

	
	add wave -noupdate -divider "DATAPATH LOGIC"

	add wave -noupdate -expand -group RB -expand -group "Inputs" /mycpu_tb/DUT/RB/*_in
	add wave -noupdate -expand -group RB -expand -group "Outputs" /mycpu_tb/DUT/RB/*_out		
	add wave -noupdate -expand -group RB -radix decimal -childformat {{{/mycpu_tb/DUT/RB/rb_r[7]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[6]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[5]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[4]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[3]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[2]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[1]} -radix decimal} {{/mycpu_tb/DUT/RB/rb_r[0]} -radix decimal}} -subitemconfig {{/mycpu_tb/DUT/RB/rb_r[7]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[6]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[5]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[4]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[3]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[2]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[1]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/rb_r[0]} {-height 16 -radix decimal}} /mycpu_tb/DUT/RB/rb_r
	add wave -noupdate -expand -group RB -radix decimal -childformat {{{/mycpu_tb/DUT/RB/hb_r[7]} -radix decimal} {{/mycpu_tb/DUT/RB/hb_r[6]} -radix decimal} {{/mycpu_tb/DUT/RB/hb_r[5]} -radix decimal} {{/mycpu_tb/DUT/RB/hb_r[4]} -radix decimal} {{/mycpu_tb/DUT/RB/hb_r[3]} -radix decimal} {{/mycpu_tb/DUT/RB/hb_r[2]} -radix decimal} {{/mycpu_tb/DUT/RB/hb_r[1]} -radix decimal} {{/mycpu_tb/DUT/RB/hb_r[0]} -radix decimal}} -subitemconfig {{/mycpu_tb/DUT/RB/hb_r[7]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/hb_r[6]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/hb_r[5]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/hb_r[4]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/hb_r[3]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/hb_r[2]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/hb_r[1]} {-height 16 -radix decimal} {/mycpu_tb/DUT/RB/hb_r[0]} {-height 16 -radix decimal}} /mycpu_tb/DUT/RB/hb_r

	add wave -noupdate -expand -group FU -expand -group "Inputs" /mycpu_tb/DUT/FU/*_in
	add wave -noupdate -expand -group FU -expand -group "Outputs" /mycpu_tb/DUT/FU/*_out		

	add wave -noupdate -expand -group MUXM -expand -group "Inputs" /mycpu_tb/DUT/MUXM/*_in
	add wave -noupdate -expand -group MUXM -expand -group "Outputs" /mycpu_tb/DUT/MUXM/*_out		

	add wave -noupdate -expand -group MUXB -expand -group "Inputs" /mycpu_tb/DUT/MUXB/*_in
	add wave -noupdate -expand -group MUXB -expand -group "Outputs" /mycpu_tb/DUT/MUXB/*_out		

	add wave -noupdate -expand -group MUXD -expand -group "Inputs" /mycpu_tb/DUT/MUXD/*_in
	add wave -noupdate -expand -group MUXD -expand -group "Outputs" /mycpu_tb/DUT/MUXD/*_out

	add wave -noupdate -group Buses -radix decimal /mycpu_tb/DUT/abus
	add wave -noupdate -group Buses -radix decimal /mycpu_tb/DUT/bbus
	add wave -noupdate -group Buses -radix decimal /mycpu_tb/DUT/dbus
	add wave -noupdate -group Buses -radix decimal /mycpu_tb/DUT/fbus		
	
    } else {
	
	add wave -noupdate -divider {GATE LEVEL:}
	add wave -noupdate /mycpu_tb/DUT/clk
	add wave -noupdate /mycpu_tb/DUT/rst_n
	add wave -noupdate /mycpu_tb/DUT/a_out
	add wave -noupdate /mycpu_tb/DUT/iom_out
	add wave -noupdate /mycpu_tb/DUT/wen_out
	add wave -noupdate /mycpu_tb/DUT/d_out
	add wave -noupdate /mycpu_tb/DUT/d_in
	add wave -noupdate /mycpu_tb/DUT/io_in
	add wave -noupdate -divider RTL:
	add wave -noupdate /mycpu_tb/clk
	add wave -noupdate /mycpu_tb/rst_n
	add wave -noupdate /mycpu_tb/a_out
	add wave -noupdate /mycpu_tb/iom_out
	add wave -noupdate /mycpu_tb/wen_out
	add wave -noupdate /mycpu_tb/d_out
	add wave -noupdate /mycpu_tb/d_in
	add wave -noupdate /mycpu_tb/iom_out
    }

    TreeUpdate [SetDefaultTree]
    WaveRestoreCursors {{Cursor 1} {577500 ps} 0}

}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
wave zoom full
