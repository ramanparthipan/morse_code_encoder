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

type state_type is (W, A1, A2, A3, B, C, D, E, F, G, H);
signal state : state_type;
signal tick : std_logic;

begin
	u1: counter
		port map (clk => clk, slow_clk => tick);
	
	process (reset, start, tick)
		variable timer : integer := 1;
	begin
		if reset = '0' then -- push buttons '0' when pressed
			state <= W;
		
		elsif start = '0' then
			if sw = "000" then
				state <= A1;
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
		
		if rising_edge(tick) then
			case (state) is
			when A1 =>
				led <= '1';
				if timer = 0 then
					state <= A2;
					timer := 1;
				else
					timer := timer - 1;
				end if;
			when A2 =>
				led <= '0';
				if timer = 0 then
					state <= A3;
					timer := 3;
				else
					timer := timer - 1;
				end if;
			when A3 =>
				led <= '1';
				if timer = 0 then
					state <= W;
					timer := 1;
				else
					timer := timer - 1;
				end if;
			when others =>
				null;
			end case;
		end if;
	end process;
	

end behaviour;