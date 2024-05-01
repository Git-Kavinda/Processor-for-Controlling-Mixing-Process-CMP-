-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:Processor:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_Processor_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    ROM_read : OUT STD_LOGIC;
    ROM_r_add : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    ROM_d_out : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    actuator_rd_item : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    actuator_rd_index : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    Sensor_input_velue : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    Actuator_output_value : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    Sensor_Request_Address : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    ctr_rst : IN STD_LOGIC
  );
END design_1_Processor_0_0;

ARCHITECTURE design_1_Processor_0_0_arch OF design_1_Processor_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_Processor_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT Processor IS
    GENERIC (
      w_12 : INTEGER;
      w_13 : INTEGER;
      w_8 : INTEGER;
      w_11 : INTEGER;
      w_16 : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      ROM_read : OUT STD_LOGIC;
      ROM_r_add : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      ROM_d_out : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      actuator_rd_item : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      actuator_rd_index : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      Sensor_input_velue : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      Actuator_output_value : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      Sensor_Request_Address : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
      ctr_rst : IN STD_LOGIC
    );
  END COMPONENT Processor;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_Processor_0_0_arch: ARCHITECTURE IS "Processor,Vivado 2019.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_Processor_0_0_arch : ARCHITECTURE IS "design_1_Processor_0_0,Processor,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_Processor_0_0_arch: ARCHITECTURE IS "design_1_Processor_0_0,Processor,{x_ipProduct=Vivado 2019.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=Processor,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,w_12=12,w_13=13,w_8=8,w_11=11,w_16=16}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_1_Processor_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF ctr_rst: SIGNAL IS "XIL_INTERFACENAME ctr_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ctr_rst: SIGNAL IS "xilinx.com:signal:reset:1.0 ctr_rst RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_clk_0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : Processor
    GENERIC MAP (
      w_12 => 12,
      w_13 => 13,
      w_8 => 8,
      w_11 => 11,
      w_16 => 16
    )
    PORT MAP (
      clk => clk,
      ROM_read => ROM_read,
      ROM_r_add => ROM_r_add,
      ROM_d_out => ROM_d_out,
      actuator_rd_item => actuator_rd_item,
      actuator_rd_index => actuator_rd_index,
      Sensor_input_velue => Sensor_input_velue,
      Actuator_output_value => Actuator_output_value,
      Sensor_Request_Address => Sensor_Request_Address,
      ctr_rst => ctr_rst
    );
END design_1_Processor_0_0_arch;
