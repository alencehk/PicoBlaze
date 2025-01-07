library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2 is
    generic (N: INTEGER:= 8); -- Length of each input signal
    Port ( a,b : in STD_LOGIC_VECTOR (N-1 downto 0);
           s : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (N-1 downto 0));
end Mux2;

architecture Structural of Mux2 is

begin

    with s select
        y <= a when '0',
             b when others;

end Structural;
