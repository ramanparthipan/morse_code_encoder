library IEEE;
use ieee.std_logic_1164.all;

entity morse_code_encoder is
	port (clk : in std_logic;
		sw : in std_logic_vector(2 downto 0);
		start: in std_logic;
		reset: in std_logic;
		led: out std_logic);
end morse_code_encoder;

architecture behaviour of morse_code_encoder is
component counter
	port (clk : in std_logic;
	slow_clk: out std_logic);
end component;
type state_type is (W, A, B, C, D, E, F, G, H);
signal state : state_type;
signal tick : std_logic;
begin
	u1: counter
		port map (clk => clk, slow_clk => tick);
	process (reset, start)
	begin
		if reset = '0' then -- push buttons '0' when pressed
			state <= W;
		
		elsif start = '0' then
			if sw = "000" then
				state <= A;
			elsif sw = "001" then
				state <= B;
			elsif sw = "010" then
				state <= C;
			elsif sw = "011" then
				state <= D;
			elsif sw = "100" then
				state <= E;
			elsif sw = "101" then
				state <= F;
			elsif sw = "110" then
				state <= G;
			elsif sw = "111" then
				state <= H;
			end if;
		end if;
	end process;
	
	process (state)
		variable count : integer;
		variable previous_tick : std_logic;
	begin
		case state is
			when A =>
				previous_tick := '0';
				count := 0;
				if (tick = '1' and previous_tick = '0') then
					count := count + 1;
					previous_tick := '1';
				end if;
				if (tick = '0' and previous_tick = '1') then
					previous_tick := '0';
				end if;
				
				if count = 1 then
					led <= '1';
				elsif count = 2 then
					led <= '0';
				elsif count = 3 then
					led <= '1';
				elsif count = 6 then
					led <= '0';
				end if;
			when B =>
				led <= '1';
			when C =>
				led <= '1';
			when others =>
				led <= '0';
		end case;
	end process;
end behaviour;