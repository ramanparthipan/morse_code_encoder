-- not used in main entity anymore

library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is 
	port(clk: in std_logic;
	slow_clk: out std_logic);
end counter;
	
architecture behaviour of counter is
	signal count : std_logic_vector(23 downto 0);
	signal tick : std_logic;
begin
	process(clk)
	begin
		if rising_edge(clk) then
			count <= count + 1;
			if count = 0 then -- overflow, takes about 0.67s with 50 MHz clock
				tick<=not tick; -- change output from 0 to 1 or vice versa
			end if;
		end if;
	end process;
	slow_clk<=tick; -- one tick should be about 0.67s
end behaviour;