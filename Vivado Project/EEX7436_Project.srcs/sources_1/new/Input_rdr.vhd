library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Input_rdr is
port(
    
    Input: in std_logic_vector(7 downto 0);
    cal_en,reset: in std_logic;
    count: inout std_logic_vector(4 downto 0);
    sum: inout std_logic_vector(12 downto 0)
);
end entity;

architecture Input_rdr_arch of Input_rdr is

begin

read_proc: process(cal_en,reset) begin

if(reset = '1') then 
    sum<=(others=>'0');
    count<=(others=>'0');

elsif(cal_en='1') then 
    sum <= sum+input;
    count <= count +1;

end if;
end process;


end architecture Input_rdr_arch;
