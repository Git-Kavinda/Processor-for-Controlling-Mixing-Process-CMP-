library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Concent is
port( 
    Item_in : in std_logic_vector(2 downto 0);
    Index_in : in std_logic_vector(4 downto 0);
    radd: out std_logic_vector(7 downto 0)

    );
end Concent;

architecture Concent_Arch of Concent is

begin

radd <= Item_in & Index_in;

end Concent_Arch;
