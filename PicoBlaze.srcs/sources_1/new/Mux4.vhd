library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4 is
    generic (N: INTEGER:= 8); -- Length of each input signal
    Port ( a,b,c,d : in STD_LOGIC_VECTOR (N-1 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (N-1 downto 0));
end Mux4;

architecture Structural of Mux4 is

begin

    with s select
        y <= a when "00",
             b when "01",
             c when "10",
             d when others;

end Structural;
