library ieee;
use ieee.std_logic_1164.all;

entity alarm_tb is
end alarm_tb;

architecture tb of alarm_tb is
	component alarm is
	port(A,B,C,D,E,F : in std_logic;
		G: out std_logic);
	end component;

signal boggis_in : std_logic := '0'; 
signal buns_in : std_logic := '0'; 
signal bean_in : std_logic := '0'; 
signal boggis_out : std_logic := '0'; 
signal buns_out : std_logic := '0';
signal bean_out : std_logic := '0';

signal buzzer: std_logic;

begin
	uut: alarm port map(boggis_in, buns_in, bean_in, boggis_out, buns_out, bean_out, buzzer);

	process
		variable errCnt : integer := 0;

	begin
		--if boggis_in = 1 and boggis_out = 1
		boggis_in <= '1';
		boggis_out <= '1';
		wait for 15 ns;
		assert(buzzer = '1') report "Error 1" severity error;
		if(buzzer /= '1') then
			errCnt:= errCnt + 1;
		end if;

		--if boggis_in =1 and buns_out = 1
		boggis_in <= '1';
		buns_out <= '1';
		wait for 15 ns;
		assert(buzzer = '1') report "Error 2" severity error;
		if(buzzer /= '1') then
			errCnt:= errCnt + 1;
		end if;

		--if boggis_in = 1 and bean_out = 1
		boggis_in <= '1';
		bean_out <= '1';
		wait for 15 ns;
		assert(buzzer = '1') report "Error 3" severity error;
		if(buzzer /= '1') then
			errCnt:= errCnt + 1;
		end if;

		--if buns_in  = 1 and boggis_out = 1
		buns_in <= '1';
		boggis_out <= '1';
		wait for 15 ns;
		assert(buzzer = '1') report "Error 4" severity error;
		if(buzzer /= '1') then
			errCnt:= errCnt + 1;
		end if;

		--if buns_in = 1 and buns_out = 1
		buns_in <= '1';
		buns_out <= '1';
		wait for 15 ns;
		assert(buzzer = '1') report "Error 5" severity error;
		if(buzzer /= '1') then
			errCnt:= errCnt + 1;
		end if;

		--if buns_in = 1 and bean_out = 1
		buns_in <= '1';
		bean_out <= '1';
		wait for 15 ns;
		assert(buzzer = '1') report "Error 6" severity error;
		if(buzzer /= '1') then
			errCnt:= errCnt + 1;
		end if;

		--if bean_in = 1 and boggis_in = 1
		bean_in <= '1';
		boggis_out <= '1';
		wait for 15 ns;
		assert(buzzer = '1') report "Error 7" severity error;
		if(buzzer /= '1') then
			errCnt:= errCnt + 1;
		end if;

		--if bean_in = 1 and buns_out = 1
		bean_in <= '1';
		buns_out <= '1';
		wait for 15 ns;
		assert(buzzer = '1') report "Error 8" severity error;
		if(buzzer /= '1') then
			errCnt:= errCnt + 1;
		end if;

		--if bean_in = 1 and bean_out = 1
		bean_in <= '1';
		bean_out <= '1';
		wait for 15 ns;
		assert(buzzer = '1') report "Error 9" severity error;
		if(buzzer /= '1') then
			errCnt:= errCnt + 1;
		end if;

		--if boggis_in = 1 and out buzzers = 0
		boggis_in <= '1';
		boggis_out <= '0';
		buns_out <= '0';
		bean_out <= '0';
		wait for 15 ns;
		assert(buzzer = '0') report "Error 9" severity error;
		if(buzzer /= '0') then
			errCnt:= errCnt + 1;
		end if;

		--if buns_in = 1 and out buzzers = 0
		buns_in <= '1';
		boggis_out <= '0';
		buns_out <= '0';
		bean_out <= '0';
		wait for 15 ns;
		assert(buzzer = '0') report "Error 9" severity error;
		if(buzzer /= '0') then
			errCnt:= errCnt + 1;
		end if;

		--if bean_in = 1 and out buzzers  = 0
		bean_in <= '1';
		boggis_out <= '0';
		buns_out <= '0';
		bean_out <= '0';
		wait for 15 ns;
		assert(buzzer = '0') report "Error 9" severity error;
		if(buzzer /= '0') then
			errCnt:= errCnt + 1;
		end if;

		--if boggis_out = 1 and in buzzers = 0
		boggis_out <= '1';
		boggis_in <= '0';
		buns_in <= '0';
		bean_in <= '0';
		wait for 15 ns;
		assert(buzzer = '0') report "Error 9" severity error;
		if(buzzer /= '0') then
			errCnt:= errCnt + 1;
		end if;

		--if buns_out = 1 and in buzzers = 0
		buns_out <= '1';
		boggis_in <= '0';
		buns_in <= '0';
		bean_in <= '0';
		wait for 15 ns;
		assert(buzzer = '0') report "Error 9" severity error;
		if(buzzer /= '0') then
			errCnt:= errCnt + 1;
		end if;

		--if bean_out = 1 and in buzzers = 0
		bean_out <= '1';
		boggis_in <= '0';
		buns_in <= '0';
		bean_in <= '0';
		wait for 15 ns;
		assert(buzzer = '0') report "Error 9" severity error;
		if(buzzer /= '0') then
			errCnt:= errCnt + 1;
		end if;

		--if all buzzers are 0
		bean_out <= '0';
		boggis_out <= '0';
		buns_out <= '0';
		boggis_in <= '0';
		buns_in <= '0';
		bean_in <= '0';
		wait for 15 ns;
		assert(buzzer = '0') report "Error 9" severity error;
		if(buzzer /= '0') then
			errCnt:= errCnt + 1;
		end if;

		-----SUMMARY-------
		if(errCnt = 0) then
			assert false report "Good!" severity note;
		else
			assert true report "Error!" severity error;
		end if;

		wait;

		end process;
	end tb;

	configuration CFG_tb of alarm_tb is
		for tb
		end for;
	end CFG_tb;