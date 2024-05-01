library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Read_addr_gen is
 Port (
 Item: in std_logic_vector(1 downto 0);
 Idx: in std_logic_vector(4 downto 0);
 add_out: out std_logic_vector(11 downto 0);
 profile: in std_logic_vector(3 downto 0);
 disable: in std_logic;
 flg_mem_radd: in std_logic_vector(7 downto 0)
 
  );
end Read_addr_gen;

architecture Read_addr_gen_arch of Read_addr_gen is
signal profile_T: std_logic_vector(3 downto 0);
type state_type is (state1,state2);

begin
--Block_proc: process(disable) is begin


--if(disable = '0') then add_out <= profile_T & '0' & Item & Idx; 
--elsif(disable = '1') then add_out <= profile & flg_mem_radd; --Profile_T<=profile;
--end if;
--end process;


--UPDATE_proc: process(disable) is begin
--if(disable = '1') then Profile_T<=profile;
--end if;
--end process;
--end Read_addr_gen_arch;
add_out <=  (profile_T & '0' & Item & Idx) when (disable = '0') else
            (profile & flg_mem_radd) when (disable = '1');

profile_T <= profile when (disable = '1');
end Read_addr_gen_arch;