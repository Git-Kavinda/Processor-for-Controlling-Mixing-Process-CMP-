vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_RAM_0_0/sim/design_1_RAM_0_0.vhd" \
"../../../bd/design_1/ip/design_1_sensor_val_0_0/sim/design_1_sensor_val_0_0.vhd" \
"../../../bd/design_1/ip/design_1_Processor_0_0/sim/design_1_Processor_0_0.vhd" \
"../../../bd/design_1/sim/design_1.vhd" \

