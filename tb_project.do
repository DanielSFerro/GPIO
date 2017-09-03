##
vlib work
vcom -explicit  -93 "../GPIO.vhd"
vcom -explicit  -93 "GPIO_tb.vhd"
vsim -t 1ps   -lib work GPIO_tb
add wave sim:/GPIO_tb/*
#do {wave1.do}
view wave
view structure
view signals
run 3us