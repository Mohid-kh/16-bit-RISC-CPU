####################################################################################################
# Top module selection
####################################################################################################

set DESIGN_NAME "mycpu"
#set DESIGN_NAME "muxm"
#set DESIGN_NAME "muxb"
#set DESIGN_NAME "muxd"
#set DESIGN_NAME "fu"
#set DESIGN_NAME "ir"
#set DESIGN_NAME "pc"
#set DESIGN_NAME "rb"
#set DESIGN_NAME "cu"

####################################################################################################
# Design Parameters
####################################################################################################

set CLK_PERIOD          4.3                             ; # Clock period in ns. [N = 6]

####################################################################################################
# Settings for all tools
####################################################################################################

set CLOCK_NAMES          { "clk" }
set CLOCK_PERIODS        [list  $CLK_PERIOD]
set RESET_NAMES          { "rst_n" }
set RESET_LEVELS         {   0  }
set RESET_STYLES         { "async" }
set RTL_LANGUAGE         "SystemVerilog"

set SHOW_REPORTS 0                                   ; # 1= EDA tool opens reports after script has ended

if { [file exists "input/tcl_procedures.tcl" ] } {
    source "input/tcl_procedures.tcl"                ; # Misc. user settings just in case
}

####################################################################################################
# RTL Verification
####################################################################################################

set VLOG_RTL_OPTIONS      "-suppress 13314 +define+RTL_SIM +define+design_top_is_${DESIGN_NAME}"
set VSIM_RTL_OPTIONS      "-suppress 13314"
set RTL_POWER_ESTIMATION  1                            ; # Enable SAIF activity file dumping
set RTL_SIMULATION_TIME   "-all"                       ; # "-all" (run to $finish) all time+unit, e.g. 1ms"
set VSIM_SCHEMATIC        1                            ; # 1: QuestaSim generates schematic (can be slow)
set SVA_BIND_FILE         "input/mycpu_svabind.svh"    ; # Assertion module bindings
set JASPER_INIT_FILE      "input/jasper_seq.tcl"       ; # Jasper Gold init file

####################################################################################################
# Logic Synthesis
####################################################################################################

set DC_SUPPRESS_MESSAGES { "UID-401" "TEST-130" "TIM-104" "VER-26" "TIM-179" }
set DC_WRITE_PARASITICS  1                             ; # Enable SDF file dumping in Design Compiler

####################################################################################################
# Gate-Level Simulation
####################################################################################################

set GATELEVEL_SIMULATION_TIME "-all"
set VSIM_GATELEVEL_OPTIONS    "+nowarn3448 +nowarn3438 +nowarn8756 -suppress 3009 -debugdb"
set VSIM_GATELEVEL_WAVES      "input/5_vsim_module_gatelevel_waves.tcl"
set VSIM_GATELEVEL_LOG        0
set GATELEVEL_SDF             MAX
set POSTLAYOUT_SDF            MAX

####################################################################################################
# Top-module-specific settings
####################################################################################################

if { [info exists DESIGN_NAME] == 0 } {
    puts "Error: Variable DESIGN_NAME has not been defined."
    exit
}

switch $DESIGN_NAME {

    "mycpu" {

	set COMMON_FILES { "input/mycpu_pkg.sv" }

	set RTL_FILES { \
			       "input/fu.sv"        \
			       "input/muxm.sv"  \
			       "input/muxd.sv"  \
			       "input/muxb.sv" \
			       "input/ir.sv"        \
			       "input/pc.sv"        \
			       "input/rb.sv"        \
			       "input/cu.sv"        \
			       "input/mycpu.sv"     \
			   }


	set SVA_FILES { \
			       "input/fu_svamod.sv" \
			       "input/muxm_svamod.sv" \
			       "input/muxd_svamod.sv" \
			      "input/muxb_svamod.sv" \
			      "input/ir_svamod.sv" \
			       "input/pc_svamod.sv" \
			       "input/rb_svamod.sv" \
			       "input/cu_svamod.sv" \
			       "input/mycpu_svamod.sv" \
			   }
	
	set TESTBENCH_FILES { \
				  "input/mycpu_tb.sv" \
                                 "input/mycpu_test.sv" \
			      }

	set DC_DONT_UNGROUP     { "MUXM" "MUXD" "MUXB" "RB" "FU" "CU" "IR" "PC" }
	set SDC_FILE            "input/mycpu.sdc"
	set QUESTA_INIT_FILE    "input/questa_seq.tcl"    ; # Initialization file for Questa tools		
    }


    muxm -
    muxd -
    muxb -
    fu {


	set COMMON_FILES { "input/mycpu_pkg.sv" }
	set RTL_FILES [list  "input/${DESIGN_NAME}.sv" ]
	set SVA_FILES [list  "input/${DESIGN_NAME}_svamod.sv" ]
	set TESTBENCH_FILES [list  \
				  "input/${DESIGN_NAME}_test.sv" \
                                  "input/${DESIGN_NAME}_tb.sv" \
			      ]

	set SDC_FILE            "input/tc_comb.sdc"
	set CLOCK_NAMES          {  }
	set RESET_NAMES          {  }
	set QUESTA_INIT_FILE    "input/questa_comb.tcl"		
    }


    ir -
    pc -
    rb {

	set COMMON_FILES { "input/mycpu_pkg.sv" }
	set RTL_FILES [list  "input/${DESIGN_NAME}.sv" ]
	set SVA_FILES [list  "input/${DESIGN_NAME}_svamod.sv" ]
	set TESTBENCH_FILES [list  \
				  "input/${DESIGN_NAME}_test.sv" \
                                  "input/${DESIGN_NAME}_tb.sv" \
			      ]
	set SDC_FILE            "input/tc_seq.sdc"
	set QUESTA_INIT_FILE    "input/questa_seq.tcl"
    } 
    cu {

	set COMMON_FILES { \
			       "input/mycpu_pkg.sv" \
	                 }
	set RTL_FILES [list  "input/${DESIGN_NAME}.sv" ]
	set SVA_FILES [list  "input/${DESIGN_NAME}_svamod.sv" ]
	set TESTBENCH_FILES [list \
				  "input/cu_pkg.sv" \
				  "input/${DESIGN_NAME}_test.sv" \
                                  "input/${DESIGN_NAME}_tb.sv" \
			      ]
	set SDC_FILE            "input/tc_seq.sdc"
	set QUESTA_INIT_FILE    "input/questa_seq.tcl"
    }

}








