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

component morse_code_displayer
	generic (n : integer);
	port (tick : in std_logic;
	sequence : in std_logic_vector(0 to n-1);
	en : in std_logic; -- enable
	led : out std_logic);
end component;

type state_type is (W, A, B, C, D, E, F, G, H);
signal state : state_type;
signal tick : std_logic;
signal en : std_logic_vector(0 to 7); -- represents enable signal for each letter
signal sequence_a : std_logic_vector(0 to 4);

begin
	u1: counter
		port map (clk => clk, slow_clk => tick);
	
	sequence_a <= "10111";	
	u_display_a : morse_code_displayer
		generic map (n => 5)
		port map(tick => tick, sequence => sequence_a, en => en(0), led => led);
	
	process (reset, start)
	begin
		if reset = '0' then -- push buttons '0' when pressed
			state <= W;
			en <= "00000000";
		
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
				null;
			when B =>
				null;
			when C =>
				null;
			when others =>
				null;
		end case;
	end process;
end behaviour;