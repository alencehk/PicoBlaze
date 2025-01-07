----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2024 01:55:31 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( IR : in STD_LOGIC_VECTOR (17 downto 0);
           INT : in STD_LOGIC;
           Z : in STD_LOGIC;
           C : in STD_LOGIC;
           IE : in STD_LOGIC;
           INT_ACK : out STD_LOGIC;
           FS : out STD_LOGIC_VECTOR (4 downto 0);
           
           we : out STD_LOGIC;
           en : out STD_LOGIC;
           sclr : out STD_LOGIC;
           
           SS : out STD_LOGIC;
           JS : out STD_LOGIC;
           EPC : out STD_LOGIC;
           
           RW : out STD_LOGIC;
           DR : out STD_LOGIC_VECTOR (3 downto 0);
           MA : out STD_LOGIC;
           SIE : out STD_LOGIC;
           LIE : out STD_LOGIC;
           INTP : out STD_LOGIC;
           RI : out STD_LOGIC;
           RS : out STD_LOGIC;
           WS : out STD_LOGIC;
           MS : out STD_LOGIC_VECTOR (1 downto 0);
           MB : out STD_LOGIC;
           SR : out STD_LOGIC_VECTOR (3 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin


end Behavioral;
