----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alen Cehajic
-- 
-- Create Date: 01/31/2024 01:22:07 PM
-- Design Name: 
-- Module Name: PicoBlaze - Structural
-- Project Name: PicoBlaze Embedded Microprocessor
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PicoBlaze is
    Port ( IN_PORT : in STD_LOGIC_VECTOR (7 downto 0);
           OUT_PORT : out STD_LOGIC_VECTOR (7 downto 0);
           PORT_ID : out STD_LOGIC_VECTOR (7 downto 0);
           READ_STROBE : out STD_LOGIC;
           WRITE_STROBE : out STD_LOGIC;
           clock : in STD_LOGIC;
           resetn : in STD_LOGIC);
end PicoBlaze;

architecture Structural of PicoBlaze is

begin


end Structural;
