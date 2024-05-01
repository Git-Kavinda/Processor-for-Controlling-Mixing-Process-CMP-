library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity compare is
    port (
    
Expect: in std_logic_vector(7 downto 0);
Sum: in std_logic_vector(12 downto 0);
count: in std_logic_vector(4 downto 0);
com_flag: out std_logic
    );
end entity compare;

architecture compare_arch of compare is
signal T1,T2,T3,T4,T5,res : std_logic_vector(12 downto 0); -- temp value for multiplication

begin

mult_proc: process(Expect,count) is begin
    if(count(0)='1') then T1<= ("00000" & Expect ); else T1<=(others=>'0'); end if;
    if(count(1)='1') then T2<= ("0000" & Expect & "0"); else T2<=(others=>'0'); end if;
    if(count(2)='1') then T3<= ("000" & Expect & "00"); else T3<=(others=>'0'); end if;
    if(count(3)='1') then T4<= ("00" & Expect & "000"); else T4<=(others=>'0'); end if;
    if(count(4)='1') then T5<= ("0" & Expect & "0000"); else T5<=(others=>'0'); end if;
end process;

res <= T1+T2+T3+T4+T5;

Compare_proc: process(res,sum) is begin
    if(res<sum) then com_flag<='0'; 
    else com_flag<='1';
    end if; end process;
    
end architecture compare_arch;