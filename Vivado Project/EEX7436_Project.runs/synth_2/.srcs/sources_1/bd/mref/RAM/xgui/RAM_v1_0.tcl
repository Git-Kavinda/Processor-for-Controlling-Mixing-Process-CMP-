# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "A_Width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "D_Width" -parent ${Page_0}


}

proc update_PARAM_VALUE.A_Width { PARAM_VALUE.A_Width } {
	# Procedure called to update A_Width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.A_Width { PARAM_VALUE.A_Width } {
	# Procedure called to validate A_Width
	return true
}

proc update_PARAM_VALUE.D_Width { PARAM_VALUE.D_Width } {
	# Procedure called to update D_Width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.D_Width { PARAM_VALUE.D_Width } {
	# Procedure called to validate D_Width
	return true
}


proc update_MODELPARAM_VALUE.D_Width { MODELPARAM_VALUE.D_Width PARAM_VALUE.D_Width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.D_Width}] ${MODELPARAM_VALUE.D_Width}
}

proc update_MODELPARAM_VALUE.A_Width { MODELPARAM_VALUE.A_Width PARAM_VALUE.A_Width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.A_Width}] ${MODELPARAM_VALUE.A_Width}
}

