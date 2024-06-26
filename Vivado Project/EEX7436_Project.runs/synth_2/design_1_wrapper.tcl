# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.cache/wt [current_project]
set_property parent.project_path B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part em.avnet.com:zed:part0:1.4 [current_project]
set_property ip_output_repo b:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/RAM.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/Sensor_val.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/Control.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/Input_rdr.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/PC.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/reg.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/Timer.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/tri_buf.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/compare.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/Speed_reg.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/Read_addr_gen.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/flg_mem.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/proc_no_ctr.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/new/Processor.vhd
  B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.vhd
}
add_files B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/bd/design_1/design_1.bd
set_property used_in_implementation false [get_files -all B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/sources_1/bd/design_1/design_1_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/constrs_2/new/MAP1.xdc
set_property used_in_implementation false [get_files B:/Vivado_Projects/EEX7436/EEX7436_NEW11/EEX7436_Project/EEX7436_Project.srcs/constrs_2/new/MAP1.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top design_1_wrapper -part xc7z020clg484-1 -flatten_hierarchy none -directive AreaOptimized_medium -control_set_opt_threshold 1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef design_1_wrapper.dcp
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
