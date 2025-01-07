----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2024 01:39:34 PM
-- Design Name: 
-- Module Name: DATAPATH - Structural
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DATAPATH is
    Port ( IN_PORT : in STD_LOGIC_VECTOR (7 downto 0);
           CI : in STD_LOGIC_VECTOR (7 downto 0);
           DI : in STD_LOGIC_VECTOR (7 downto 0);
           DR : in STD_LOGIC_VECTOR (3 downto 0);
           SR : in STD_LOGIC_VECTOR (3 downto 0);
           MD : in STD_LOGIC_VECTOR (1 downto 0);
           RW : in STD_LOGIC;
           MA : in STD_LOGIC;
           SIE : in STD_LOGIC;
           LIE : in STD_LOGIC;
           INTP : in STD_LOGIC;
           RI : in STD_LOGIC;
           RS : in STD_LOGIC;
           WS : in STD_LOGIC;
           FS : in STD_LOGIC;
           MB : in STD_LOGIC;
           PORT_ID : out STD_LOGIC_VECTOR (7 downto 0);
           OUT_PORT : out STD_LOGIC_VECTOR (7 downto 0);
           DO : out STD_LOGIC_VECTOR (7 downto 0);
           AO : out STD_LOGIC_VECTOR (5 downto 0);
           Z : out STD_LOGIC;
           C : out STD_LOGIC;
           IE : out STD_LOGIC;
           READ_STORAGE : out STD_LOGIC;
           WRITE_STORAGE : out STD_LOGIC);
end DATAPATH;

architecture Structural of DATAPATH is

begin


end Structural;
