library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control is

port(
clk, ctr_rst : in std_logic;

--Reset Pins
PC_rst,ins_rst,timer_rst, in_rdr_reset,mtep_rst,Obuf_rst: out std_logic;
Ibuf_rst,mean_rst: out std_logic;
spd_add_load: out std_logic;
profile_ld: out std_logic;

--Other control signal pin
ROM_rd,PC_en,PC_ld,disen_read_block,timer_ld,flg_wr : out std_logic;
flg_wdata,spd_wr,cal_en,Mean_load,Obuf_load: out std_logic;
Ibuf_load,mtep_load,ins_ld: out std_logic;

flg_mem_radd : out std_logic_vector(7 downto 0);
sen_req_itm : out std_logic_vector(1 downto 0);
sen_req_idx : out std_logic_vector(4 downto 0);

--External Flags
Timer_fg, com_fg,flg_rd : in std_logic;

--Instrction
ins : in std_logic_vector(3 downto 0);
sen_req_itm_in: in std_logic_vector(5 downto 0)


);
end entity control;


architecture control_arch of control is 

type state_type is (Initial,Ideal,Fetch_one,Fetch_two,Decode,Add2p,Point,Setval,
control,Findmean ,compare,JIC,waitt,waitt3,
waitt2,findmean7,Findmean6,findmean5,findmean4,findmean3,findmean22,findmean2,control_two,setval_two,Setval_three,point_two,add2p_three,Add2p_two);

signal Current_state,Next_state : state_type;
--signal ins_reg : std_logic_vector(3 downto 0);
signal itm: std_logic_vector(1 downto 0);
signal idx: std_logic_vector(4 downto 0);
begin

--ins_reg <= ins;


clk_proc: process(clk,ctr_rst) begin

if(ctr_rst = '1') then
	Current_state <= Initial;
elsif(rising_edge(clk)) then
	Current_state <= Next_state;
	end if;
end process; 


Control_proc: process(Current_state,ins,Timer_fg, com_fg ) 
begin
--Current_state <= Initial;
--Next_state <= Initial;

case (Current_state) is
--case (Next_state) is
	When Initial =>
		PC_rst <='1';
		ins_rst <='1';
		timer_rst <='1';
		in_rdr_reset <='1';
		mtep_rst <='1';
		Obuf_rst <='1';
		Ibuf_rst <='1';
		mean_rst <='1';
		spd_add_load <='0';
		Next_state <= Ideal;
	   Obuf_load <='0';
	When Ideal => 
		PC_rst <='0';
		ins_rst <='0';
		timer_rst <='0';
		in_rdr_reset <='0';
		mtep_rst <='0';
		Obuf_rst <='0';
		Ibuf_rst <='0';
		mean_rst <='0';
		
		Next_state <= Fetch_one;
		
	When Fetch_one => 
		ROM_rd <= '1';
		ins_ld <= '1';
		Mean_load <= '0';
		mtep_load <= '0';
		PC_ld <= '0';
		PC_en <= '0';
		
		Next_state <= Fetch_two;
		
	When Fetch_two => 
		Next_state <= Decode;
	
	When Decode =>
		ROM_rd <='0';
		ins_ld<='0';
--		ins_reg <= ins;

	--	if(ins_reg(3)='0') then Next_state<=Initial;

		if(ins = "1000") then Next_state <= Add2p;
		elsif(ins = "1001") then Next_state <= Point;
		elsif(ins= "1010") then Next_state <= Setval;
		elsif(ins="1011") then Next_state<= control;
		elsif(ins = "1100") then Next_state<=Findmean;
		elsif(ins = "1101") then Next_state <= compare;
		elsif(ins = "1110") then Next_state <= JIC;
		elsif(ins = "1111") then Next_state <= waitt;
		else Next_state <= Initial;
        end if;
	
	----++++++++++++++Instructions States+++++++++++---------------------
	-------Add2p--------------------->>>>>>>>>>>>>>>>>
	
	When Add2p => 
		disen_read_block <= '1';
		flg_wdata <= '1';
		flg_wr <= '1';
		Next_state <= Add2p_two;
		
	When Add2p_two => 
		PC_en <= '1';
		Next_state <= Add2p_three;
	
	when Add2p_three =>
		PC_en <= '0';
		flg_wdata <= '0';
		flg_wr <= '0';
		disen_read_block <= '0';
		Next_state <= Fetch_one;
		
	--------------Point and setval------------->>>>>>>>>>>>>>>>>>
	
	when point =>
		spd_add_load <= '1';
		Next_state <= point_two;
		PC_en <= '1';
		Next_state <= point_two;
		
	when point_two => 
		spd_add_load <= '0';
		PC_en <= '0';
		Next_state <= Fetch_one;
		
	when Setval =>
		spd_wr <= '1';
		Next_state <= Setval_two;
		PC_en <= '1';
		
	when Setval_two => 
		PC_en <= '0';
		Next_state <= Setval_three;
		
	when Setval_three => 
		spd_wr <= '0';
		Next_state <= Fetch_one;
		
	--------------Control------->>>>>>>>>>>>>>>>
	
	when control => 
		disen_read_block <= '1';
		PC_en <= '1';
		Next_state <= control_two;
		Obuf_load <='1';
		
	when control_two=>
		PC_en <= '0';
		disen_read_block <= '0';
		Next_state <= Fetch_one;
		

	-----------Find Mean ------------>>>>>>>>*
	
	when Findmean => 
		itm <= sen_req_itm_in(1 downto 0);
		disen_read_block <= '1';
		flg_wr <= '0';
		
		idx <= "00000";
		
		PC_en <= '1';
		Next_state <= Findmean2;
		
	when Findmean2 => 
		cal_en<='0';
		PC_en <= '0';
		
		if(idx = "11111") then 
			disen_read_block <= '0';
			Next_state <= Fetch_one;
			Mean_load <= '1';
		else	
			flg_mem_radd <= '1' & itm & idx;
			Next_state <= findmean22;
		end if;
			
	When Findmean22 => 
		Next_state <= Findmean3;
		
	When Findmean3 => 
		
		if(flg_rd = '1') then 
			sen_req_itm <= itm;
			sen_req_idx <= idx;
			Next_state <= Findmean4;
		else	
			idx <= idx +1;
			Next_state <= Findmean2;
		end if;
			
	When Findmean4 => 
		Next_state <= findmean5;
	
	When Findmean5 =>
		Ibuf_load <= '1';
		Next_state <= Findmean6;
		
	When findmean6 =>
		Next_state <= Findmean7;
	
	when findmean7 =>
		Next_state <= Findmean2;
		cal_en <= '1';
		idx <= idx+1;
	
	----------------Compare-------------------
	
	When compare => 
		mtep_load <= '1';
		Next_state <= Fetch_one;
		PC_en <= '1';
		
	when JIC => 
		
		if(com_fg = '1') then 
			PC_ld <= '1';
			Next_state <= Fetch_one;
		else	
			PC_en <= '1';
			Next_state <= Fetch_one;
		end if;
		
	when Waitt =>
		timer_ld <= '1';
		Next_state <= waitt2;
		Obuf_load <='1';
	
	when Waitt2 => 
	   Next_state <= waitt3;
		
	when waitt3 =>
		timer_ld <= '0';
		if(Timer_fg = '1') then	
			--Next_state <= Fetch_one;
			Next_state <= waitt3;
			PC_en <= '1';
		end if;
	
	
	When others=> 
		Next_state <= Initial;
	--	Current_state <= Initial;
	end case;
		
	end process control_proc;
	   
		

end architecture Control_arch;

