----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2024 01:39:34 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
    Port ( clock, resetn : in STD_LOGIC;
           ST : in STD_LOGIC_VECTOR (9 downto 0);
           JACA : in STD_LOGIC_VECTOR (9 downto 0);
           E_PC : in STD_LOGIC;
           sclr_PC : in STD_LOGIC;
           SS : in STD_LOGIC;
           JS : in STD_LOGIC_VECTOR (1 downto 0);
           EPC : in STD_LOGIC;
           PC : out STD_LOGIC_VECTOR (9 downto 0));
end PC;

architecture Behavioral of PC is

component super_addsub is
	generic (N: INTEGER:= 4;
	         DIRECTION: STRING:= "SUB"; -- "UNUSED", "ADD", "SUB"
				cin_used: STRING:= "NO"); -- "YES", "NO"
	port(	addsub   : in std_logic; -- add_sub = 1 -> SUBTRACTION, add_sub = 0 -> ADDITION. This only applies if DIRECTION = "UNUSED"
	        cin      : in std_logic:='0'; -- ADDITION: active-high carry in
			                         -- SUBTRACTION: active-low borrow in: if cin = 1 -> X-Y, if cin = 0 -> X-Y-1
		    x, y     : in std_logic_vector (N-1 downto 0);
            s        : out std_logic_vector (N-1 downto 0);
			overflow : out std_logic; -- This is always cn XOR cn-1, i.e., the overflow when numbers are treated as 2C
		   cout     : out std_logic);
end component;

component Mux2 is
    generic (N: INTEGER:= 8); -- Length of each input signal
    Port ( a,b : in STD_LOGIC_VECTOR (N-1 downto 0);
           s : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;

component Mux4 is
    generic (N: INTEGER:= 8); -- Length of each input signal
    Port ( a,b,c,d : in STD_LOGIC_VECTOR (N-1 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;

component Rege is
    generic (N: INTEGER:= 8);
    Port ( clock, resetn: in STD_LOGIC;
           E, sclr: in STD_LOGIC;
           D: in STD_LOGIC_VECTOR (N-1 downto 0);
           Q: out STD_LOGIC_VECTOR (N-1 downto 0));
end component;

    signal RegeO, MuxAO, MuxBO, AddO: std_logic_vector(9 downto 0);
    signal EEPC: std_logic;

begin

    EEPC <= E_PC AND EPC;
    PC <= RegeO;
    
    MuxA: Mux2 generic map(N => 10) port map(a => RegeO, b => ST, s => SS, y => MuxAO);
    AddPC: super_addsub generic map(N => 10, DIRECTION => "ADD", cin_used => "NO") port map(x => MuxAO, y => x"001", s => AddO, addsub => '0');
    MuxB: Mux4 generic map(N => 10) port map(a => JACA, b => ST, c => x"3FF", d => AddO, s => JS, y => MuxBO);
    RegePC: Rege generic map(N => 10) port map(clock => clock, resetn => resetn, E => EEPC, sclr => sclr_PC, D => MuxBO, Q => RegeO);

end Behavioral;
