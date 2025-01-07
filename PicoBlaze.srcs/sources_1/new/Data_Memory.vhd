---------------------------------------------------------------------------
-- This VHDL file was developed by Daniel Llamocca (2018).  It may be
-- freely copied and/or distributed at no cost.  Any persons using this
-- file for any purpose do so at their own risk, and are responsible for
-- the results of such use.  Daniel Llamocca does not guarantee that
-- this file is complete, correct, or fit for any particular purpose.
-- NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.  This notice must
-- accompany any copy of this file.
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.math_real.log2;
use ieee.math_real.ceil;

entity RAM_emul is
    generic (N: integer:= 8; -- word size
             NW: integer:= 16); -- number of words
	port ( resetn, clock: in std_logic;
		   wr_rd: in std_logic; -- wr_rd = '1' -> Write, wr_rd = '0' -> Read
		   DI: in std_logic_vector (N-1 downto 0);
		   address: in std_logic_vector ( integer ( ceil(log2(real(NW)))) -1 downto 0 );		   
		   DO: out std_logic_vector (N-1 downto 0));
end RAM_emul;

architecture structure of RAM_emul is

    component Rege is
        generic (N: INTEGER:= 8);
        Port ( clock, resetn: in STD_LOGIC;
               E, sclr: in STD_LOGIC;
               D: in STD_LOGIC_VECTOR (N-1 downto 0);
               Q: out STD_LOGIC_VECTOR (N-1 downto 0));
    end component;
	
	signal ER: std_logic_vector (NW-1 downto 0);
    signal F: std_logic_vector (N-1 downto 0);
	type chunk is array (NW -1 downto 0) of std_logic_vector (N-1 downto 0);
	signal Q: chunk;
		
begin

ga: for i in 0 to NW-1 generate
         ri: Rege generic map (N => N)
             port map (clock => clock, resetn => resetn, E => ER(i), sclr => '0', D => DI, Q => Q(i));
    end generate;
    
-- Decoder with enable:
   ad: process (wr_rd, address)
       begin
            ER <= (others => '0');
            ER (conv_integer(unsigned(address))) <= wr_rd;
       end process;
   
-- MUX:
   F <= Q(conv_integer(unsigned(address)));  
   
   -- Enable to MUX. This is to avoid having DO change when writing. When writing we make sure output data is 0.
   with wr_rd select
        DO <= F when '0',
              (others => '0') when others;
 
end structure;