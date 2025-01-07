library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--TODO: Make generic Mux

entity Mux16 is
    generic (Z: INTEGER:= 8); -- Length of each input signal
    port ( a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p : in std_logic_vector(Z-1 downto 0);
           s : in std_logic_vector(3 downto 0);
           y : out std_logic_vector(7 downto 0));
end Mux16;

architecture Behavioral of Mux16 is

begin

    with s select
        y <= a when x"0",
             b when x"1",
             c when x"2",
             d when x"3",
             e when x"4",
             f when x"5",
             g when x"6",
             h when x"7",
             i when x"8",
             j when x"9",
             k when x"a",
             l when x"b",
             m when x"c",
             n when x"d",
             o when x"e",
             p when others;

end Behavioral;
