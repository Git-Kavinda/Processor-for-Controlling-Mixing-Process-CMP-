library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity proc_no_ctr is

generic(
w_12 :integer:=12;
w_13 : integer:=13;
w_8	 : integer:=8;
w_11 : integer:=11;
w_16 : integer:=16
);

 Port (
 clk: in std_logic;
 
 --Contrl unit signals------------------------------/////*****
 PC_rst,PC_ld, ins_rst,ins_ld,timer_rst,timer_ld,flg_wr,flg_wdata,PC_en : in std_logic;
 spd_wr,in_rdr_reset,cal_en,mean_rst,mean_load,mtep_rst,disen_read_block : in std_logic;
 mtep_load,obuf_rst,obuf_load,ibuf_rst,ibuf_load,rom_rd : in std_logic;
 spd_add_load: in std_logic;
 sen_req_itm_in:out std_logic_vector(5 downto 0);
 
 ins : out std_logic_vector(3 downto 0);
 timer_fg,com_fg,flg_rd : out std_logic;
 sen_req_itm: in std_logic_vector(1 downto 0);
 sen_req_idx: in std_logic_vector(4 downto 0);
 flg_mem_radd: in std_logic_vector(7 downto 0);

--Main memory in out ---------------------------////******
Rom_read: out std_logic;
Rom_r_add: out std_logic_vector(11 downto 0);
ROM_d_out: in std_logic_vector(15 downto 0);

--Inout pins --------------------------------//////******
actuator_rd_item: in std_logic_vector(1 downto 0);
actuator_rd_index: in std_logic_vector(4 downto 0);
Sensor_rqst_address: out std_logic_vector(6 downto 0);
Actuator_output_value: out std_logic_vector(11 downto 0);
Sensor_Input_value: in std_logic_vector(7 downto 0)
 );
end proc_no_ctr;

architecture proc_no_ctr_arch of proc_no_ctr is


signal ins_reg_Q,radd_s,output_D,spd_read_data: std_logic_vector(11 downto 0);
signal sum_D,Sum_Q: std_logic_vector(12 downto 0);
signal expect_s,count_input:std_logic_vector(7 downto 0);
signal Flg_RData: std_logic;
signal count: std_logic_vector(4 downto 0);
signal Wadd_signal,Radd_signal : std_logic_vector(10 downto 0);

begin

PC: entity work.PC(PC_arch) --checked
generic map(width => w_12)
port map(clk=>clk,PC_en=>PC_en,reset => PC_rst,load=>PC_ld,Oaddr=>ROM_r_add,Laddr=>INS_REG_Q);

Ins_reg: entity work.Reg(Reg_arch) --checked
generic map(width => w_12)
port map(clk=>clk,reset=>ins_rst,load=>ins_ld,D=>ROM_d_out(11 downto 0),Q=>ins_reg_Q);

Timer: entity work.Timer(Timer_arch) --checked
generic map(width=>w_12)
port map(clk=>clk,reset=>timer_rst,load=>Timer_ld,Ltime=>ins_reg_Q,Z=>timer_fg);

Mean_reg: entity work.Reg(Reg_arch)  --checked
generic map(width => w_13)
port map(clk=>clk,reset=>mean_rst,load=>mean_load,D=>sum_D,Q=>Sum_Q);

Mean_Temp_Reg: entity work.Reg(Reg_arch) --checked
generic map(width => w_8)
port map(clk=>clk,reset=>mtep_rst,load=>mtep_load,Q=>expect_s,D=>ins_reg_Q(11 downto 4));

Output_Buffer: entity work.Reg(Reg_arch) --checked
generic map(width => w_12)
port map(clk=>clk,reset=>obuf_rst,load=>obuf_load,D=>output_D,Q=>Actuator_output_value);

Input_Buffer: entity work.Reg(Reg_arch)--checked
generic map(width => w_8)
port map(clk=>clk,reset=>ibuf_rst,load=>ibuf_load,D=>Sensor_Input_value,Q=>count_input);

tri_buf: entity work.tri_buf(tri_buf_arch) --checked
port map(data_in=>spd_read_data, en=>Flg_RData, tri_out=>output_D);

compare: entity work.compare(compare_arch) --checked
port map(Expect=>expect_s, Sum=>Sum_Q, count=>count ,com_flag=>com_fg);

Input_Reader: entity work.Input_rdr(Input_rdr_arch) --checked
port map(Input=>count_input, Cal_en=>cal_en,reset=>in_rdr_reset,count=>Count,sum=>Sum_D);

Speed_mem: entity work.Speed_reg(speed_reg_arch)--checked
Generic map (Dwidth=>W_12, Awidth=>w_11)

port map(clk=>clk,wr=>spd_wr,Wdata=>ins_reg_Q ,Wadd_T=>Wadd_signal,Radd=>Radd_signal,rdata=>spd_read_data,spd_add_load=>spd_add_load);

Read_addr_gen: entity work.Read_addr_gen  --checked
port map(Item=>actuator_rd_item,flg_mem_radd=>flg_mem_radd,Idx=>actuator_rd_index,add_out=>radd_s,profile=>ins_reg_Q(11 downto 8),disable=>disen_read_block);


Flag_mem: entity work.flg_mem 
generic map(Dwidth=>w_16,Awidth=>w_12)
port map(clk=>clk,wr=>flg_wr,wdata=>flg_wdata,wadd=>ins_reg_Q,radd=>radd_s,rdata=>Flg_RData);

Wadd_signal <= (ins_reg_Q(11 downto 8) & ins_reg_Q(6 downto 0));
Radd_signal <= (radd_s(11 downto 8) & radd_s(6 downto 0));
Rom_read <= rom_rd;
flg_rd <= Flg_RData;
Sensor_rqst_address <= sen_req_itm & sen_req_idx;
ins <= ROM_d_out(15 downto 12);
--radd_s <= ins_reg_Q(11 downto 8) & flg_mem_radd;
sen_req_itm_in <= ins_reg_Q(5 downto 0);

end proc_no_ctr_arch;
