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


library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity morse_code_displayer is
	generic (n : integer);
	port (tick : in std_logic;
	sequence : in std_logic_vector(0 to n-1);
	en : in std_logic; -- enable
	led : out std_logic);
end morse_code_displayer;

architecture behaviour of morse_code_displayer is
	signal enable : std_logic;
begin
	enable <= en;
	process (tick)
		variable previous_tick : std_logic;
		variable count : integer;
	begin
		previous_tick := '0';
		count := 0;
		if enable = '1' then 
			if (tick = '1' and previous_tick = '0') then
				count := count + 1;
				previous_tick := '1';
			end if;
			if (tick = '0' and previous_tick = '1') then
				previous_tick := '0';
			end if;
			
			if count < n then
				led <= sequence(count);
			else
				enable <= '0';
			end if;
		else
			led <= '0';
		end if;
	end process;

end behaviour;