library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Timer is 
generic(
width: integer:=12);
port(
clk,reset,load : in std_logic;
Ltime: in std_logic_vector(width-1 downto 0);
Z : out std_logic);

end  entity Timer;

architecture Timer_arch of Timer is 

signal T: std_logic_vector(width-1 downto 0);

begin

Timer_proc: process(clk,reset,load,T) begin
if(reset='1') then T <= (others=>'0');
elsif (rising_edge(clk)) then
    if(load = '1') then T <= LTime;
    elsif(T /= 0) then T <= T-1;
end if;end if;
end process;

Flag_proc: Process(T) begin
if (T = 0) then Z <= '1';
else Z <= '0';
end if;
end process;

end architecture Timer_arch;