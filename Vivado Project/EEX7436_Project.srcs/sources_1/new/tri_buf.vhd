library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_buf is
 Port ( 
 
 data_in: in std_logic_vector(11 downto 0);
 en: in std_logic;
 tri_out: out std_logic_vector(11 downto 0)
 );
end tri_buf;

architecture tri_buf_arch of tri_buf is
--signal dummy: std_logic;
begin
tri_proc: process(en,data_in) is begin
if(en='1') then  tri_out<=data_in;
else tri_out<=(others=>'0');
end if; end process;
--dummy <= en;
--tri_out <= data_in;
--end tri_buf_arch;
end architecture tri_buf_arch;