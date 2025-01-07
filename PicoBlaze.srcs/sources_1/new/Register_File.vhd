----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2024 05:09:08 PM
-- Design Name: 
-- Module Name: Register_File - Structural
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

entity Register_File is
    generic (N: INTEGER:= 16);
    Port( clock, resetn, RW: in std_logic;
          DR, SR: in std_logic_vector (3 downto 0);
          D: in std_logic_vector (7 downto 0);
          Q: out std_logic_vector (7 downto 0));
end Register_File;

architecture Structural of Register_File is

    component Mux16 is
    generic (Z: INTEGER:= 8); -- Length of each input signal
    port ( a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p : in std_logic_vector(Z-1 downto 0);
           s : in std_logic_vector(3 downto 0);
           y : out std_logic_vector(7 downto 0));
    end component;
    
    component decode4to16 is
    Port ( E : in std_logic;
           w : in std_logic_vector(3 downto 0);
           y : out std_logic_vector(15 downto 0));
    end component;
    
    component Rege is
    generic (N: INTEGER:= 10);
    port (clock, resetn: in STD_LOGIC;
          E, sclr: in STD_LOGIC;
          D: in STD_LOGIC_VECTOR (N-1 downto 0);
          Q: out STD_LOGIC_VECTOR (N-1 downto 0));
    end component;

    type chunk is array (N-1 downto 0) of std_logic_vector(7 downto 0);
    
    signal E: std_logic_vector(N-1 downto 0);
    signal RO: chunk;

begin

    DECRF: decode4to16 port map(w => DR, E => RW, y => E);
    
    REGI: for i in 0 to N-1 generate
        REG: Rege generic map(N => 8) port map(clock => clock, resetn => resetn, E => E(i), D => D, Q => RO(i), sclr => '0');
    end generate;
    
    RFMux: Mux16 generic map(Z => 8) port map(s => SR, y => Q ,a => RO(0), b => RO(1), c => RO(2), d => RO(3), e => RO(4), f => RO(5), g => RO(6), h => RO(7), i => RO(8), j => RO(9), k => RO(10), l => RO(11), m => RO(12), n => RO(13), o => RO(14), p => RO(15)); 

end Structural;
