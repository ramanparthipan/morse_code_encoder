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

type state_type is (W, 
A0, A1, A2, A3, 
B0, B1, B2, B3, B4, B5, B6, B7, 
C0, C1, C2, C3, C4, C5, C6, C7,
D0, D1, D2, D3, D4, D5,
E0, E1,
F0, F1, F2, F3, F4, F5, F6, F7, 
G0, G1, G2, G3, G4, G5,
H0, H1, H2, H3, H4, H5, H6, H7
);

signal state : state_type;

begin
	process (reset, clk)
		variable timer : integer := 1;
		variable count : integer := 0;
	begin
		if reset = '0' then -- push buttons '0' when pressed
			state <= W;
		end if;
		
		if rising_edge(clk) then
			count := count + 1;
			if start = '0' then
				if sw = "000" then
					state <= A0;
				elsif sw = "001" then
					state <= B0;
				elsif sw = "010" then
					state <= C0;
				elsif sw = "011" then
					state <= D0;
				elsif sw = "100" then
					state <= E0;
				elsif sw = "101" then
					state <= F0;
				elsif sw = "110" then
					state <= G0;
				elsif sw = "111" then
					state <= H0;
				end if;
			end if;
		
			if count = 25000000 then -- 0.5s with 50 MHz clock
				count := 0;
				case (state) is
					when A0 => -- 0 state sets timer for first pulse
						if timer = 0 then
							state <= A1;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when A1 =>
						if timer = 0 then
							state <= A2;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when A2 =>
						if timer = 0 then
							state <= A3;
							timer := 3;
						else
							timer := timer - 1;
						end if;
					when A3 =>
						if timer = 0 then
							state <= W;
						else
							timer := timer - 1;
						end if;
					
					when B0 =>
						if timer = 0 then
							state <= B1;
							timer := 3;
						else
							timer := timer - 1;
						end if;
					when B1 =>
						if timer = 0 then
							state <= B2;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when B2 =>
						if timer = 0 then
							state <= B3;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when B3 =>
						if timer = 0 then
							state <= B4;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when B4 =>
						if timer = 0 then
							state <= B5;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when B5 =>
						if timer = 0 then
							state <= B6;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when B6 =>
						if timer = 0 then
							state <= B7;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when B7 =>
						if timer = 0 then
							state <= W;
						else
							timer := timer - 1;
						end if;
						
					when C0 =>
						if timer = 0 then
							state <= C1;
							timer := 3;
						else
							timer := timer - 1;
						end if;
					when C1 =>
						if timer = 0 then
							state <= C2;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when C2 =>
						if timer = 0 then
							state <= C3;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when C3 =>
						if timer = 0 then
							state <= C4;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when C4 =>
						if timer = 0 then
							state <= C5;
							timer := 3;
						else
							timer := timer - 1;
						end if;
					when C5 =>
						if timer = 0 then
							state <= C6;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when C6 =>
						if timer = 0 then
							state <= C7;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when C7 =>
						if timer = 0 then
							state <= W;
						else
							timer := timer - 1;
						end if;
						
					when D0 =>
						if timer = 0 then
							state <= D1;
							timer := 3;
						else
							timer := timer - 1;
						end if;
					when D1 =>
						if timer = 0 then
							state <= D2;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when D2 =>
						if timer = 0 then
							state <= D3;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when D3 =>
						if timer = 0 then
							state <= D4;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when D4 =>
						if timer = 0 then
							state <= D5;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when D5 =>
						if timer = 0 then
							state <= W;
						else
							timer := timer - 1;
						end if;
					
					when E0 =>
						if timer = 0 then
							state <= E1;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when E1 =>
						if timer = 0 then
							state <= W;
						else
							timer := timer - 1;
						end if;
						
					when F0 =>
						if timer = 0 then
							state <= F1;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when F1 =>
						if timer = 0 then
							state <= F2;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when F2 =>
						if timer = 0 then
							state <= F3;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when F3 =>
						if timer = 0 then
							state <= F4;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when F4 =>
						if timer = 0 then
							state <= F5;
							timer := 3;
						else
							timer := timer - 1;
						end if;
					when F5 =>
						if timer = 0 then
							state <= F6;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when F6 =>
						if timer = 0 then
							state <= F7;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when F7 =>
						if timer = 0 then
							state <= W;
						else
							timer := timer - 1;
						end if;
						
					when G0 =>
						if timer = 0 then
							state <= G1;
							timer := 3;
						else
							timer := timer - 1;
						end if;
					when G1 =>
						if timer = 0 then
							state <= G2;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when G2 =>
						if timer = 0 then
							state <= G3;
							timer := 3;
						else
							timer := timer - 1;
						end if;
					when G3 =>
						if timer = 0 then
							state <= G4;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when G4 =>
						if timer = 0 then
							state <= G5;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when G5 =>
						if timer = 0 then
							state <= W;
						else
							timer := timer - 1;
						end if;
						
					when H0 =>
						if timer = 0 then
							state <= H1;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when H1 =>
						if timer = 0 then
							state <= H2;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when H2 =>
						if timer = 0 then
							state <= H3;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when H3 =>
						if timer = 0 then
							state <= H4;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when H4 =>
						if timer = 0 then
							state <= H5;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when H5 =>
						if timer = 0 then
							state <= H6;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when H6 =>
						if timer = 0 then
							state <= H7;
							timer := 1;
						else
							timer := timer - 1;
						end if;
					when H7 =>
						if timer = 0 then
							state <= W;
						else
							timer := timer - 1;
						end if;
					
					when W =>
						timer := 1;
					when others =>
						null;
				end case;
			end if;
		else
			state <= state;
		end if;
	end process;
	
	process (state)
	begin
		case (state) is
			when W =>
				led <= '0';
				
			when A1 =>
				led <= '1';
			when A2 =>
				led <= '0';
			when A3 =>
				led <= '1';
			
			when B1 =>
				led <= '1';
			when B2 =>
				led <= '0';
			when B3 =>
				led <= '1';
			when B4 =>
				led <= '0';
			when B5 =>
				led <= '1';
			when B6 =>
				led <= '0';
			when B7 =>
				led <= '1';
				
			when C1 =>
				led <= '1';
			when C2 =>
				led <= '0';
			when C3 =>
				led <= '1';
			when C4 =>
				led <= '0';
			when C5 =>
				led <= '1';
			when C6 =>
				led <= '0';
			when C7 =>
				led <= '1';
				
			when D1 =>
				led <= '1';
			when D2 =>
				led <= '0';
			when D3 =>
				led <= '1';
			when D4 =>
				led <= '0';
			when D5 =>
				led <= '1';
				
			when E1 =>
				led <= '1';
				
			when F1 =>
				led <= '1';
			when F2 =>
				led <= '0';
			when F3 =>
				led <= '1';
			when F4 =>
				led <= '0';
			when F5 =>
				led <= '1';
			when F6 =>
				led <= '0';
			when F7 =>
				led <= '1';
				
			when G1 =>
				led <= '1';
			when G2 =>
				led <= '0';
			when G3 =>
				led <= '1';
			when G4 =>
				led <= '0';
			when G5 =>
				led <= '1';
				
			when H1 =>
				led <= '1';
			when H2 =>
				led <= '0';
			when H3 =>
				led <= '1';
			when H4 =>
				led <= '0';
			when H5 =>
				led <= '1';
			when H6 =>
				led <= '0';
			when H7 =>
				led <= '1';
				
			when others =>
				led <= '0'; --A0, B0, etc.
		end case;
	end process;
	

end behaviour;