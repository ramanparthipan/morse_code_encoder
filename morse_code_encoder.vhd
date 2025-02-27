library IEEE;
use ieee.std_logic_1164.all;

entity morse_code_encoder is
	port (clk : in std_logic;
		sw : in std_logic_vector(0 to 2);
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
		if reset = '1' then
			state <= W;
		
		elsif start = '1' then
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
	begin
		case state is
			when A =>
				led <= '0';
			when B =>
				led <= '1';
			when C =>
				led <= '1';
			when others =>
				led <= '0';
		end case;
	end process;
end behaviour;