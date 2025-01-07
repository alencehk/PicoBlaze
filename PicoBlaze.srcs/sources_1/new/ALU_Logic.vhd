----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/05/2024 06:09:18 PM
-- Design Name: 
-- Module Name: ALU_Logic - Behavioral
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

entity ALU_Logic is
    generic (N: INTEGER:= 8);
    Port ( A, B: in std_logic_vector (N-1 downto 0);
           sel: in std_logic_vector (4 downto 0);
           Y : out std_logic_vector (N-1 downto 0);
           C, Z: out std_logic);
end ALU_Logic;

architecture Behavioral of ALU_Logic is

    signal shlA, shrA, shlA1, shrA1, shlAC, shrAC, shlA0, shrA7: std_logic_vector (N-1 downto 0);
    
begin

    shlA <= A(N-2 downto 0)&'0'; --din = 0
    shlA1 <= A(N-2 downto 0)&'1'; --din = 1
    shlAC <= 
    
    shrA <= '0'&A(N-1 downto 1);
    shrA1 <= '1'&A(N-1 downto 1);
    
    
    with sel select
        Y <= A AND B when "01000",
             A OR B when "01001",
             A XOR B when "01010",
             shlA when "01101",
             
             shrA when "10001",
             
             


end Behavioral;
