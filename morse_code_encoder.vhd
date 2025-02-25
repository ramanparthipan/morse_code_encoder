library IEEE;
use ieee.std_logic_1164.all;

entity morse_code_encoder is
	port (clk : in std_logic;
		sw : in std_logic_vector(0 to 3);
		start: in std_logic;
		reset: in std_logic;
		led: out std_logic);
end morse_code_encoder;

architecture behaviour of morse_code_encoder is
component counter
	port (clk : in std_logic;
	slow_clk: out std_logic);
begin
end behaviour;