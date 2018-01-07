

# Constrain clock port clk with 10-ns requirement
create_clock -name clk -period 20 [get_ports clk]

# Set Clock Uncertainty
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}] 0.020
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}] 0.020

set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}] 0.020
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}] 0.020

# Automatically apply a generate clock on the output of phase-locked loops (PLLs)
# This command can be safely left in the SDC even if no PLLs exist in the design
derive_pll_clocks

# Constrain the input I/O path
set_input_delay 1.0 -clock clk -min  [all_inputs]
set_input_delay 2.0 -clock clk -max  [all_inputs]


# Constrain the output I/O path
set_output_delay 1.0 -clock clk  -min [all_outputs]
set_output_delay 2.0 -clock clk  -max [all_outputs]
