# Create clock with new period
create_clock [get_pins pll/CLK] -name clk -period 11.5 -waveform {0 5.75} 

# Set loads
set_load -pin_load 0.5 [get_ports OUT] 
set_load -min -pin_load 0.5 [get_ports OUT] 

# Set clock latency
set_clock_latency 1 [get_clocks clk] 
set_clock_latency -source 2 [get_clocks clk] 

# Set clock uncertainty
set_clock_uncertainty 0.575 [get_clocks clk]  ; # 5% of clock period for setup
set_clock_uncertainty -hold 0.92 [get_clocks clk] ; # 8% of clock period for hold

# Set maximum delay
set_max_delay 11.5 -from [get_pins dac/OUT] -to [get_ports OUT] 

# Set input delay for VCO_IN
set_input_delay -clock clk -max 4 [get_ports VCO_IN] 
set_input_delay -clock clk -min 1 [get_ports VCO_IN] 

# Set input delay for ENb_VCO
set_input_delay -clock clk -max 4 [get_ports ENb_VCO] 
set_input_delay -clock clk -min 1 [get_ports ENb_VCO] 

# Set input delay for ENb_CP
set_input_delay -clock clk -max 4 [get_ports ENb_CP] 
set_input_delay -clock clk -min 1 [get_ports ENb_CP] 

# Set input transition for VCO_IN
set_input_transition -max 0.575 [get_ports VCO_IN] ; # 5% of clock
set_input_transition -min 0.92 [get_ports VCO_IN] ; # adjust if needed

# Set input transition for ENb_VCO
set_input_transition -max 0.575 [get_ports ENb_VCO] ; # 5% of clock
set_input_transition -min 0.92 [get_ports ENb_VCO] ; # adjust if needed

# Set input transition for ENb_CP
set_input_transition -max 0.575 [get_ports ENb_CP] ; # 5% of clock
set_input_transition -min 0.92 [get_ports ENb_CP] ; # adjust if needed
