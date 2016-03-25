library ieee;
use ieee.std_logic_1164.all;

--entity declaration
	entity alarm is
		port(A,B,C,D,E,F: in std_logic;
			G: out std_logic);
	end alarm;

	architecture func of alarm is
	begin
		G <= ((A and D) or (A and E) or (A and F) or (B and D) or (B and E) or (B and F) or (C and D) or (C and E) or (C and F));
	end func;