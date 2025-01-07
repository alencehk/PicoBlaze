library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- N-bit Register
-- E = '1', sclr = '0' --> Input data 'D' is copied on Q
-- E = '1', sclr = '1' --> Q is cleared (0)

entity Rege is
    generic (N: INTEGER:= 8);
    Port ( clock, resetn: in STD_LOGIC;
           E, sclr: in STD_LOGIC;
           D: in STD_LOGIC_VECTOR (N-1 downto 0);
           Q: out STD_LOGIC_VECTOR (N-1 downto 0));
end Rege;

architecture Behavioral of Rege is

    signal Qt: std_logic_vector (N-1 downto 0);
    
begin

    process(clock, resetn)
    begin
        if resetn = '0' then
            Qt <= (others => '0');
        elsif (clock'event and clock = '1') then
            if E = '1' then
                if sclr = '1' then
                    Qt <= (others => '0');
                else
                    Qt <= D;
                end if;
            end if;
        end if;
    end process;
    
    Q <= Qt;
            
end Behavioral;
