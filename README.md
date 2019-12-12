# FPGA_buttonLED

Latest Quartus version to support Cyclone II is 13.0 SP1  
chip is EP2C5T114C8N  

```VHDL
port(
	clk	: in std_logic; --clock on pin 17
	LED0	: out std_logic; --LED 'D5' on pin 3
	LED1	: out std_logic; --LED 'D4' on pin 7
	LED2	: out std_logic; --LED 'D2' on pin 9
	btn0	: in std_logic --button 'key' on pin 114
);
```

compile to make sure there are no errors  
assignments > pin planner: to assign pins as noted in comment code block above  
right click column > 'customize collumns' add 'weak pullup resistor' from available to show  
enable weak pullup on button  

Youtube comment R2D2  
https://www.youtube.com/watch?v=le6Jo5DpLao  

> Additionally you will probably notice that the FPGA and the 1.2V regulator get quite hot as soon as you start running your own design. This is  because pins 26 and 81 are directly connected to 1.2V. The default choice is to drive all unused pins to GND. Short circuit. You should go to Assignments->Device->Device and Pin Options...->Unused Pins and set it to "As input tri-stated  with weak pull-up" (or "... with bus-hold circuitry"). Then everything stays cool.
