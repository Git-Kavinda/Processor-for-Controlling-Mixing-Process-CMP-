library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.textio.all;
use IEEE.std_logic_textio.all;
use ieee.numeric_std.ALL;

-- Entity 
entity sensor_val is 
  generic (D_Width : integer := 8;
           A_Width : integer := 7 ); -- 2**7 = 128
  port (
   clk, rd      : in  std_logic;  
--   d            : in  std_logic_vector(D_Width-1 downto 0);
--   w_add, r_add : in  std_logic_vector(A_Width-1 downto 0);
    r_add : in  std_logic_vector(A_Width-1 downto 0);
   data_out          : out std_logic_vector(D_Width-1 downto 0) );
end entity sensor_val; 

architecture sensor_val_arch of sensor_val is -- Architecture 
    type ram_type is array (0 to 2**A_Width-1) of 
         std_logic_vector (D_Width-1 downto 0);

    impure function read_file(txt_file : in string) return ram_type is
      file ram_file : text open read_mode is txt_file;
      variable  txt_line  : line;
      variable  txt_bit   : bit_vector(D_Width-1 downto 0);
      variable  txt_ram   : ram_type;
      begin for i in ram_type'range loop
        readline(ram_file, txt_line);  
        read(txt_line, txt_bit);
        txt_ram(i)  :=  to_stdlogicvector(txt_bit);
      end loop;   return txt_ram;
    end function;
    
    -- Architecture 
    signal ram : ram_type :=  read_file("sensor_val.txt");
       -- Read the ram text file from the function
    signal data_reg : std_logic_vector (D_Width-1 downto 0);
  begin ram_proc : process (clk)
    begin
      if    (rising_edge(clk))      then  
        if (rd='1')              then  
--           ram(to_integer(unsigned(w_add)))  <= d;
           data_reg <= ram(to_integer(unsigned(r_add))) ;
           
         else data_reg <= (others => '0');
        end if;
      end if;
      data_out <= data_reg ;
   end process ram_proc;
   
   
   
end architecture sensor_val_arch;
