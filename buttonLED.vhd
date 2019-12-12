-- hello world for Altera Cyclone II EP2C5T144C8N mini board

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity buttonLED is
port(
	clk	: in std_logic; --clock on pin 17
	LED2	: out std_logic; --LED 'D5' on pin 3
	LED1	: out std_logic; --LED 'D4' on pin 7
	LED0	: out std_logic; --LED 'D2' on pin 9
	btn0	: in std_logic --button 'key' on pin 114
);
end buttonLED;

architecture Behavioral of buttonLED is
	constant max_count : natural := 50000000; --50Mhz clock 
	signal oneHz : STD_logic;
	
begin
	process(clk) --process based on clk variable
	variable count : natural range 0 to max_count;
	begin
		if(clk'Event and clk='1' and count<(max_count/2)-1) then
			oneHz<='1';
			count := count+1;
		elsif(clk'Event and clk='1' and count<(max_count-1)) then
			oneHz<='0';
			count := count+1;
		elsif(clk'Event and clk='1' and count<max_count) then
			oneHz<='1';
			count:=0;
		end if;
	end process;
	
	process(btn0)
	begin
		LED2 <= btn0;
		LED1 <= not btn0;
		LED0 <= oneHz;
	end process;
end Behavioral;