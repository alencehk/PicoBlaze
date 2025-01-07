----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2024 01:39:34 PM
-- Design Name: 
-- Module Name: STACK - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity STACK is
    Port ( clock : in STD_LOGIC;
           resetn: in STD_LOGIC;
           --SP : in STD_LOGIC_VECTOR (4 downto 0);
           DI : in STD_LOGIC_VECTOR (9 downto 0);
           we : in STD_LOGIC;
           en : in STD_LOGIC;
           sclr : in STD_LOGIC;
           DO : out STD_LOGIC_VECTOR (9 downto 0);
           full : out STD_LOGIC;
           empty : out STD_LOGIC);
end STACK;

architecture Behavioral of STACK is

    type mem_type is array (0 to 31) of std_logic_vector (9 downto 0);
    signal ST: mem_type:= (others => (others => '0'));
    signal SP: INTEGER:= 31;

begin
    
    process (clock, resetn)
    begin
        if resetn = '0' then
            SP <= 31;
            ST <= (others => (others => '0'));
            DO <= (others => '0');
            full <= '0';
            empty <= '0';
        elsif (clock'event and clock = '1') then
            if sclr = '1' then
                SP <= 31;
                ST <= (others => (others => '0'));
                DO <= (others => '0');
                full <= '0';
                empty <= '0';
            else
                if en = '1' then
                    if we = '1' then
                        SP <= SP-1;
                        ST(SP) <= DI;
                    else
                        DO <= ST(SP);
                        SP <= SP+1;
                    end if;
                else
                    DO <= ST(SP);
                end if;
                if SP = 31 then
                    empty <= '1';
                else
                    empty <= '0';
                end if;
                if SP = 0 then
                    full <= '1';
                else
                    full <= '0';          
                end if;
            end if;    
        end if;    
    end process;        

end Behavioral;
