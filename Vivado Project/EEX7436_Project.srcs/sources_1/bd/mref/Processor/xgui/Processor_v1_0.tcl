# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "w_11" -parent ${Page_0}
  ipgui::add_param $IPINST -name "w_12" -parent ${Page_0}
  ipgui::add_param $IPINST -name "w_13" -parent ${Page_0}
  ipgui::add_param $IPINST -name "w_16" -parent ${Page_0}
  ipgui::add_param $IPINST -name "w_8" -parent ${Page_0}


}

proc update_PARAM_VALUE.w_11 { PARAM_VALUE.w_11 } {
	# Procedure called to update w_11 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.w_11 { PARAM_VALUE.w_11 } {
	# Procedure called to validate w_11
	return true
}

proc update_PARAM_VALUE.w_12 { PARAM_VALUE.w_12 } {
	# Procedure called to update w_12 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.w_12 { PARAM_VALUE.w_12 } {
	# Procedure called to validate w_12
	return true
}

proc update_PARAM_VALUE.w_13 { PARAM_VALUE.w_13 } {
	# Procedure called to update w_13 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.w_13 { PARAM_VALUE.w_13 } {
	# Procedure called to validate w_13
	return true
}

proc update_PARAM_VALUE.w_16 { PARAM_VALUE.w_16 } {
	# Procedure called to update w_16 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.w_16 { PARAM_VALUE.w_16 } {
	# Procedure called to validate w_16
	return true
}

proc update_PARAM_VALUE.w_8 { PARAM_VALUE.w_8 } {
	# Procedure called to update w_8 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.w_8 { PARAM_VALUE.w_8 } {
	# Procedure called to validate w_8
	return true
}


proc update_MODELPARAM_VALUE.w_12 { MODELPARAM_VALUE.w_12 PARAM_VALUE.w_12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.w_12}] ${MODELPARAM_VALUE.w_12}
}

proc update_MODELPARAM_VALUE.w_13 { MODELPARAM_VALUE.w_13 PARAM_VALUE.w_13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.w_13}] ${MODELPARAM_VALUE.w_13}
}

proc update_MODELPARAM_VALUE.w_8 { MODELPARAM_VALUE.w_8 PARAM_VALUE.w_8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.w_8}] ${MODELPARAM_VALUE.w_8}
}

proc update_MODELPARAM_VALUE.w_11 { MODELPARAM_VALUE.w_11 PARAM_VALUE.w_11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.w_11}] ${MODELPARAM_VALUE.w_11}
}

proc update_MODELPARAM_VALUE.w_16 { MODELPARAM_VALUE.w_16 PARAM_VALUE.w_16 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.w_16}] ${MODELPARAM_VALUE.w_16}
}

