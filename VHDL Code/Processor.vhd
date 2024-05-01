library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Processor is
	generic(
		w_12 :integer:=12;
		w_13 : integer:=13;
		w_8	 : integer:=8;
		w_11 : integer:=11;
		w_16 : integer:=16
	);

 Port ( 
 
 clk : in std_logic;
 
 --Memory Control pin
 ROM_read : out std_logic; --ok
 ROM_r_add : out std_logic_vector(11 downto 0); --ok
 ROM_d_out : in std_logic_vector(15 downto 0); --ok
 
 --IO pin
 actuator_rd_item : in std_logic_vector(1 downto 0); --ok
 actuator_rd_index : in std_logic_vector(4 downto 0); --ok
 Sensor_input_velue : in std_logic_vector(7 downto 0); --ok
 
 Actuator_output_value : out std_logic_vector(11 downto 0); --ok
 Sensor_Request_Address : out std_logic_vector(6 downto 0);  --ok
 
 --Reset control unit
 ctr_rst : in std_logic
 
 
 
 );
end Processor;

architecture Processor_Arch of Processor is
--Internal control paths

signal PC_rst,PC_ld, ins_rst,ins_ld,timer_rst,timer_ld,flg_wr,flg_wdata,PC_en : std_logic;
signal spd_wr,in_rdr_reset,cal_en,mean_rst,mean_load,mtep_rst,disen_read_block : std_logic;
signal mtep_load,obuf_rst,obuf_load,ibuf_rst,ibuf_load,rom_rd,spd_add_load : std_logic;

signal ins : std_logic_vector(3 downto 0);
signal timer_fg,com_fg,flg_rd : std_logic;
signal sen_req_itm: std_logic_vector(1 downto 0);
signal sen_req_idx: std_logic_vector(4 downto 0);
signal flg_mem_radd: std_logic_vector(7 downto 0);
signal sen_req_itm_in: std_logic_vector(5 downto 0);


begin

No_CTR_sys: entity work.proc_no_ctr(proc_no_ctr_arch)
generic map(w_12=>w_12,w_13=>w_13,w_8=>w_8,w_11=>w_11,w_16=>w_16)
port map(
--Control unit signals
clk=>clk,PC_rst => PC_rst,PC_ld => PC_ld, ins_rst => ins_rst,ins_ld => ins_ld,
timer_rst => timer_rst,timer_ld => timer_ld,flg_wr=>flg_wr,flg_wdata=>flg_wdata,PC_en=>PC_en,
spd_wr=>spd_wr,in_rdr_reset=>in_rdr_reset,cal_en=>cal_en,mean_rst=>mean_rst,
mean_load=>mean_load,mtep_rst=>mtep_rst,disen_read_block=>disen_read_block,
mtep_load=>mtep_load,obuf_rst=>obuf_rst,obuf_load=>obuf_load,ibuf_rst=>ibuf_rst,
ibuf_load=>ibuf_load,rom_rd=>rom_rd,spd_add_load=>spd_add_load,sen_req_itm_in=>sen_req_itm_in,

ins=>ins,
timer_fg=>timer_fg,com_fg=>com_fg,flg_rd=>flg_rd,
sen_req_itm=>sen_req_itm,
sen_req_idx=>sen_req_idx,
flg_mem_radd => flg_mem_radd,

--Main Memory in out
Rom_read => ROM_read,
Rom_r_add => ROM_r_add,
ROM_d_out => ROM_d_out,

--Input Pins
actuator_rd_item => actuator_rd_item,
actuator_rd_index => actuator_rd_index,
Sensor_rqst_address => Sensor_Request_Address,
Actuator_output_value => Actuator_output_value,
Sensor_Input_value => Sensor_input_velue


);

CONTROL_U: entity work.control(control_arch)
port map(


--Reset Pins and clocks
clk=>clk, ctr_rst=>ctr_rst,PC_rst=>PC_rst,ins_rst=>ins_rst,timer_rst=>timer_rst,
in_rdr_reset=>in_rdr_reset,mtep_rst=>mtep_rst,Obuf_rst=>Obuf_rst,
Ibuf_rst=>Ibuf_rst,mean_rst=>mean_rst,spd_add_load=>spd_add_load,sen_req_itm_in=>sen_req_itm_in,


--Other control signal pin
ROM_rd=>ROM_rd,PC_en=>PC_en,PC_ld=>PC_ld,disen_read_block=>disen_read_block,
timer_ld=>timer_ld,flg_wr=>flg_wr,
flg_wdata=>flg_wdata,flg_rd=>flg_rd,spd_wr=>spd_wr,cal_en=>cal_en,
Mean_load=>Mean_load,Obuf_load=>Obuf_load,
Ibuf_load=>Ibuf_load,mtep_load=>mtep_load,ins_ld=>ins_ld,

flg_mem_radd=>flg_mem_radd,
sen_req_itm=>sen_req_itm,
sen_req_idx=>sen_req_idx,

--External Flags
Timer_fg=>Timer_fg, com_fg=>com_fg,

ins=>ins




);





end Processor_Arch;
