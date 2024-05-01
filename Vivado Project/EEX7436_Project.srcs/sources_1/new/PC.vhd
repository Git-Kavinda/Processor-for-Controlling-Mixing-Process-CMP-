library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC is 
generic( 
width: integer:=12);
port( 
clk,reset,load : in std_logic;
Laddr: in std_logic_vector(width-1 downto 0);
Oaddr: out std_logic_vector(width-1 downto 0);
PC_en: in std_logic);
end  entity PC;

architecture PC_arch of PC is 

signal Oaddr_TEMP: std_logic_vector(width-1 downto 0);

begin
count_proc: process(clk,reset,load) begin
if(reset = '1') then Oaddr_TEMP<=(others=>'0');
elsif(rising_edge(clk)) then 
    if(load='1') then Oaddr_TEMP <= Laddr;
    elsif(PC_en='1') then Oaddr_TEMP <= Oaddr_TEMP +1;
end if;
end if;
end process;

Oaddr <= Oaddr_TEMP;
end architecture;
