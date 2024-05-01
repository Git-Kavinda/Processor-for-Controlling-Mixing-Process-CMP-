library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.textio.all;
use IEEE.std_logic_textio.all;
use ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity flg_mem is 
generic(
    Dwidth: integer:=16;
    Awidth: integer:=12);
port(
    clk,wr : in std_logic;
    wdata : in std_logic;
    Wadd, radd : in std_logic_vector(Awidth-1 downto 0);
    rdata: out std_logic);
--    profile: in std_logic_vector(3 downto 0));
    
end entity;

architecture flg_mem_arch of flg_mem is
type array_type is array(0 to 2**Awidth-1) of std_logic_vector(Dwidth-1 downto 0);

signal array_reg: array_type := (others => (others => '0'));
signal profile_w,profile_r:std_logic_vector(3 downto 0);


begin 


write_proc: process(clk,wr,wdata,wadd,radd) begin
if(rising_edge(clk)) then 
    if(wr='1') then 
        array_reg(to_integer(unsigned(wadd(7 downto 0))))(to_integer(unsigned(profile_w))) <= wdata; --bit wise acc
    else
         if(radd(7 downto 0)< 32) then
         rdata <= array_reg(to_integer(unsigned(radd(7 downto 0))))(to_integer(unsigned(profile_r))) or array_reg(0)(to_integer(unsigned(profile_r)));
        
         elsif(radd(7 downto 0) < 64) then
         rdata <= array_reg(to_integer(unsigned(radd(7 downto 0))))(to_integer(unsigned(profile_r))) or array_reg(32)(to_integer(unsigned(profile_r)));
     
         elsif(radd(7 downto 0) < 96) then
         rdata <= array_reg(to_integer(unsigned(radd(7 downto 0))))(to_integer(unsigned(profile_r))) or array_reg(64)(to_integer(unsigned(profile_r)));
         
         elsif(radd(7 downto 0) < 128) then
         rdata <= array_reg(to_integer(unsigned(radd(7 downto 0))))(to_integer(unsigned(profile_r))) or array_reg(96)(to_integer(unsigned(profile_r)));
         
         elsif(radd(7 downto 0) < 160) then
         rdata <= array_reg(to_integer(unsigned(radd(7 downto 0))))(to_integer(unsigned(profile_r))) or array_reg(128)(to_integer(unsigned(profile_r)));
         
         elsif(radd(7 downto 0) < 192) then
         rdata <= array_reg(to_integer(unsigned(radd(7 downto 0))))(to_integer(unsigned(profile_r))) or array_reg(160)(to_integer(unsigned(profile_r)));
         
         elsif(radd(7 downto 0) < 224) then
         rdata <= array_reg(to_integer(unsigned(radd(7 downto 0))))(to_integer(unsigned(profile_r))) or array_reg(192)(to_integer(unsigned(profile_r)));
         
         elsif(radd(7 downto 0) < 256) then
         rdata <= array_reg(to_integer(unsigned(radd(7 downto 0))))(to_integer(unsigned(profile_r))) or array_reg(224)(to_integer(unsigned(profile_r)));
        
         
         else rdata <='0'; end if;
        end if;
end if;         
end process;


profile_w <= Wadd(11 downto 8);
profile_r <= radd(11 downto 8);

end architecture;     
        
