--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
--Date        : Fri Dec 29 13:32:17 2023
--Host        : LAPTOP-N5294HBG running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    Actuator_output_value_0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    actuator_rd_index_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    actuator_rd_item_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk_0 : in STD_LOGIC;
    ctr_rst_0 : in STD_LOGIC;
    rd_0 : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_Processor_0_0 is
  port (
    clk : in STD_LOGIC;
    ROM_read : out STD_LOGIC;
    ROM_r_add : out STD_LOGIC_VECTOR ( 11 downto 0 );
    ROM_d_out : in STD_LOGIC_VECTOR ( 15 downto 0 );
    actuator_rd_item : in STD_LOGIC_VECTOR ( 1 downto 0 );
    actuator_rd_index : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Sensor_input_velue : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Actuator_output_value : out STD_LOGIC_VECTOR ( 11 downto 0 );
    Sensor_Request_Address : out STD_LOGIC_VECTOR ( 6 downto 0 );
    ctr_rst : in STD_LOGIC
  );
  end component design_1_Processor_0_0;
  component design_1_sensor_val_0_0 is
  port (
    clk : in STD_LOGIC;
    rd : in STD_LOGIC;
    r_add : in STD_LOGIC_VECTOR ( 6 downto 0 );
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_1_sensor_val_0_0;
  component design_1_RAM_0_0 is
  port (
    clk : in STD_LOGIC;
    rd : in STD_LOGIC;
    r_add_in : in STD_LOGIC_VECTOR ( 11 downto 0 );
    data_out : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_RAM_0_0;
  signal Processor_0_Actuator_output_value : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal Processor_0_ROM_r_add : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal Processor_0_ROM_read : STD_LOGIC;
  signal Processor_0_Sensor_Request_Address : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal RAM_0_data_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal actuator_rd_index_0_1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal actuator_rd_item_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal clk_0_1 : STD_LOGIC;
  signal ctr_rst_0_1 : STD_LOGIC;
  signal rd_0_1 : STD_LOGIC;
  signal sensor_val_0_data_out : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN design_1_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of ctr_rst_0 : signal is "xilinx.com:signal:reset:1.0 RST.CTR_RST_0 RST";
  attribute X_INTERFACE_PARAMETER of ctr_rst_0 : signal is "XIL_INTERFACENAME RST.CTR_RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  Actuator_output_value_0(11 downto 0) <= Processor_0_Actuator_output_value(11 downto 0);
  actuator_rd_index_0_1(4 downto 0) <= actuator_rd_index_0(4 downto 0);
  actuator_rd_item_0_1(1 downto 0) <= actuator_rd_item_0(1 downto 0);
  clk_0_1 <= clk_0;
  ctr_rst_0_1 <= ctr_rst_0;
  rd_0_1 <= rd_0;
Processor_0: component design_1_Processor_0_0
     port map (
      Actuator_output_value(11 downto 0) => Processor_0_Actuator_output_value(11 downto 0),
      ROM_d_out(15 downto 0) => RAM_0_data_out(15 downto 0),
      ROM_r_add(11 downto 0) => Processor_0_ROM_r_add(11 downto 0),
      ROM_read => Processor_0_ROM_read,
      Sensor_Request_Address(6 downto 0) => Processor_0_Sensor_Request_Address(6 downto 0),
      Sensor_input_velue(7 downto 0) => sensor_val_0_data_out(7 downto 0),
      actuator_rd_index(4 downto 0) => actuator_rd_index_0_1(4 downto 0),
      actuator_rd_item(1 downto 0) => actuator_rd_item_0_1(1 downto 0),
      clk => clk_0_1,
      ctr_rst => ctr_rst_0_1
    );
RAM_0: component design_1_RAM_0_0
     port map (
      clk => clk_0_1,
      data_out(15 downto 0) => RAM_0_data_out(15 downto 0),
      r_add_in(11 downto 0) => Processor_0_ROM_r_add(11 downto 0),
      rd => Processor_0_ROM_read
    );
sensor_val_0: component design_1_sensor_val_0_0
     port map (
      clk => clk_0_1,
      data_out(7 downto 0) => sensor_val_0_data_out(7 downto 0),
      r_add(6 downto 0) => Processor_0_Sensor_Request_Address(6 downto 0),
      rd => rd_0_1
    );
end STRUCTURE;
