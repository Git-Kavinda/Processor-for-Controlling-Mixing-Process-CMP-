library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mean_Calc is
    port (
        clk, cal_en, rst : in std_logic;
        Input : in std_logic_vector(7 downto 0);
        Mean : out std_logic_vector(7 downto 0)
    );
end Mean_Calc;

architecture Behavioral of Mean_Calc is
    signal Sum : unsigned(7 downto 0) := (others => '0'); -- Initialize sum to zero
    signal Count : unsigned(7 downto 0) := (others => '0'); -- Initialize count to zero
    signal Output : std_logic_vector(7 downto 0); -- Intermediate output signal
    
begin
    process(clk, rst)
    begin
        if rst = '1' then
            Sum <= (others => '0'); -- Reset sum to zero
            Count <= (others => '0'); -- Reset count to zero
        elsif rising_edge(clk) then
            if cal_en = '1' then
                Sum <= Sum + unsigned(Input); -- Add input value to sum
                Count <= Count + 1; -- Increment count
            end if;
        end if;
    end process;

    --Output <= std_logic_vector(Sum / Count); -- Calculate mean by dividing sum by count
    Mean <= Output;
end Behavioral;