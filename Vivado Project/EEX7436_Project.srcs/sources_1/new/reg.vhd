library ieee;
use ieee.std_logic_1164.all;


entity reg is 
generic( width: integer:=12);
port(
	clk,reset,load : in std_logic;
	D : in std_logic_vector(width-1 downto 0);
	Q : out std_logic_vector(width-1 downto 0));
end entity reg;

architecture reg_arch of reg is begin
reg_proc: process(clk,load,reset) begin
    if(reset='1') then Q <= (others => '0');
    elsif(rising_edge(clk)) then 
        if(load='1') then Q <= D;
       end if; end if;
       end process reg_proc;
end architecture reg_arch;
   
    