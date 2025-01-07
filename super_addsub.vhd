---------------------------------------------------------------------------
-- This VHDL file was developed by Daniel Llamocca (2013).  It may be
-- freely copied and/or distributed at no cost.  Any persons using this
-- file for any purpose do so at their own risk, and are responsible for
-- the results of such use.  Daniel Llamocca does not guarantee that
-- this file is complete, correct, or fit for any particular purpose.
-- NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.  This notice must
-- accompany any copy of this file.
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- Data representation: 2's complement OR unsigned
-- The user must make sure to interpret the results properly.

-- SIGNED representation (2C)
-- **************************
--  cout is active-high carry in, cin is active-high carry in
--  cout=1 means carry out to the next bit
--
-- UNSIGNED representation
-- ***********************
--  cout can be interpreted as an active-low borrow out, cin as an active-low borrow in
--  Usually, we need to add a 0 to the number, and do the operation as in 2C, and then grab the 'n' LSBs of the answer.
--  This can be done by just treating the inputs as unsigned.
--  cout=1 means X >= Y. Then: no borrow out to the next bit (but '1' is propagated to the higher operation)
--  cout=0 means X < Y. Then: borrow out to the next bit ('0' is propagated to the higher operation)
--  The overflow output does not make sense for UNSIGNED subtraction.
--    For UNSIGNED addition, the overflow is equal to cout.

--  In this hardware, the overflow bit is ONLY meaningful when the operation is SIGNED.

-- Tested for all cases with 4 bits
entity super_addsub is
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
end super_addsub;

architecture structure of super_addsub is

	component fulladd
		port( cin, x, y : in std_logic;
				s, cout   : out std_logic);
	end component;

	signal c: std_logic_vector (N downto 0);
	signal yt: std_logic_vector (N-1 downto 0);
	
begin

a0: assert (cin_used = "NO" or cin_used = "YES")
    report "You have to set cin_used to either YES or NO!!!"
	 severity error;

a1: assert (DIRECTION = "ADD" or DIRECTION = "SUB" or DIRECTION = "UNUSED")
    report "You have to set DIRECTION to ADD, SUB, or UNUSED!!"
	 severity error; 
	 
	cout <= c(N);
	overflow <= c(N) xor c(N-1);	

	ga: if cin_used = "YES" generate
				c(0) <= cin;
		 end generate;
		 
	gi: for i in 0 to N-1 generate
				fi: fulladd port map (cin => c(i), x => x(i), y => yt(i), s => s(i), cout => c(i+1));
		 end generate;
					 
	g1: if DIRECTION = "UNUSED" generate				
				gb: if cin_used = "NO" generate
							c(0) <= addsub; -- add_sub = 0 -> cin = 0 (no carry in), add_sub = 1 -> cin = 1 (no borrow in)
					 end generate;				

				gi: for i in 0 to N-1 generate
							yt(i) <= y(i) xor addsub;
					 end generate;
		 end generate;
		 
	g2: if DIRECTION = "ADD" generate				
				gb: if cin_used = "NO" generate
							c(0) <= '0';
					 end generate;		
				
				yt <= y;
		 end generate;		 
		 
	g3: if DIRECTION = "SUB" generate				
				gb: if cin_used = "NO" generate
							c(0) <= '1';
					 end generate;		
				
				yt <= not (y);
		 end generate;
		 
end structure;
