--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
--Date        : Fri Dec 29 13:32:17 2023
--Host        : LAPTOP-N5294HBG running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    Actuator_output_value_0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    actuator_rd_index_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    actuator_rd_item_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk_0 : in STD_LOGIC;
    ctr_rst_0 : in STD_LOGIC;
    rd_0 : in STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    clk_0 : in STD_LOGIC;
    actuator_rd_item_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    actuator_rd_index_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Actuator_output_value_0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    ctr_rst_0 : in STD_LOGIC;
    rd_0 : in STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      Actuator_output_value_0(11 downto 0) => Actuator_output_value_0(11 downto 0),
      actuator_rd_index_0(4 downto 0) => actuator_rd_index_0(4 downto 0),
      actuator_rd_item_0(1 downto 0) => actuator_rd_item_0(1 downto 0),
      clk_0 => clk_0,
      ctr_rst_0 => ctr_rst_0,
      rd_0 => rd_0
    );
end STRUCTURE;
