library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode4to16 is
    Port ( E : in std_logic;
           w : in std_logic_vector(3 downto 0);
           y : out std_logic_vector(15 downto 0));
end decode4to16;

architecture Behavioral of decode4to16 is

    signal EW: std_logic_vector(4 downto 0);

begin

    EW <= E&w;
    
    with EW select
        y <= x"1" when x"10",
             x"2" when x"11",
             x"4" when x"12",
             x"8" when x"13",
             x"10" when x"14",
             x"20" when x"15",
             x"40" when x"16",
             x"80" when x"17",
             x"100" when x"18",
             x"200" when x"19",
             x"400" when x"1a",
             x"800" when x"1b",
             x"1000" when x"1c",
             x"2000" when x"1d",
             x"4000" when x"1e",
             x"8000" when x"1f",
             x"0000" when others;
             
end Behavioral;
