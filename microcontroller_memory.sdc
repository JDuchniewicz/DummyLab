set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk_divider:clk_div|out_clk} -period 1.000 -waveform { 0.000 0.500 } [get_registers {clk_divider:clk_div|out_clk}]
create_clock -name {CLOCK_50} -period 1.000 -waveform { 0.000 0.500 } [get_ports {CLOCK_50}]
create_clock -name {altera_reserved_tck} -period 1.000 -waveform { 0.000 0.500 } [get_ports {altera_reserved_tck}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {div_clk} -source [get_ports {CLOCK_50}] -duty_cycle 50/1 -multiply_by 1 -divide_by 500000 -master_clock {CLOCK_50} [get_pins {clk_div|out_clk|clk}] 

