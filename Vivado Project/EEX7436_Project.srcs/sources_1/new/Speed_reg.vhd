library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.textio.all;
use IEEE.std_logic_textio.all;
use ieee.numeric_std.ALL;

entity Speed_reg is 
generic(
    Dwidth: integer:=12;
    Awidth: integer:=11);
port(
    clk,wr : in std_logic;
    wdata : in std_logic_vector(Dwidth-1 downto 0);
    Wadd_T,RAdd : in std_logic_vector(Awidth-1 downto 0);
    rdata: out std_logic_vector(Dwidth-1 downto 0);
    spd_add_load: in std_logic);
    
end entity;

architecture Speed_reg_arch of Speed_reg is
type array_type is array(0 to 2**Awidth-1) of std_logic_vector(Dwidth-1 downto 0);

signal array_reg: array_type := (others=>(others=>'0'));
signal Wadd : std_logic_vector(Awidth-1 downto 0);
begin 

Addr_buf_proc: process(spd_add_load) begin
    if(spd_add_load = '1') then Wadd <= Wadd_T; end if;
    end process;
    

speed_proc: process(clk,wr,wdata,wadd,radd) begin
if(rising_edge(clk)) then 
    if(wr='1') then 
        array_reg(to_integer(unsigned(wadd))) <= wdata;
       end if;
     rdata <= array_reg(to_integer(unsigned(radd)));
end if; 
end process;
end architecture;     
        
