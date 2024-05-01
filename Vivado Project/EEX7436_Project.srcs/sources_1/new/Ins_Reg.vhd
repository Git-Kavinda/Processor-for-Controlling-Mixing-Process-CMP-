library ieee;
use ieee.std_logic_1164.all;


entity Ins_reg is 
generic( width: integer:=12);
port(
	clk,reset,load : in std_logic;
	D : in std_logic_vector(width-1 downto 0);
	Q : out std_logic_vector(width-1 downto 0);
		Q_en: in std_logic);

end entity Ins_reg;

architecture Ins_reg_arch of Ins_reg is
signal Q_temp:std_logic_vector(width-1 downto 0);

begin
reg_proc: process(clk,load,reset) begin
    if(reset='1') then Q_temp <= (others => '0');
    elsif(rising_edge(clk)) then 
        if(load='1') then Q_temp <= D;
       end if; end if;
       end process reg_proc;
Reg_proc_2: process(Q_temp) begin
    if(Q_en = '1') then Q<=Q_temp;
    end if; end process; 

end architecture Ins_reg_arch;
   
    