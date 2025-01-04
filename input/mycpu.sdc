########################################################
# Clock Definition
#######################################################

# Clock port name -----------------------------.
# Clock period in ns ----------------------.   |
# Clock definition name -------.           |   |
#                              |           |   |
#                              V           V   V

create_clock            -name clk -period 4.3 clk

########################################################
# External Delays of Input Ports
########################################################

# Port that this setting applies to ---.
# External delay in ns ------------.   |
# In relation to which clock? -.   |   |
#                              |   |   |
#                              V   V   V

set_input_delay        -clock clk 0.0 rst_n
set_input_delay        -clock clk 0.03 d_in
set_input_delay        -clock clk 0.03 io_in

########################################################
# External Delays of output Ports
########################################################

set_output_delay       -clock clk 0.045 wen_out
set_output_delay       -clock clk 0.045 iom_out
set_output_delay       -clock clk 0.045 a_out
set_output_delay       -clock clk 0.045 d_out

