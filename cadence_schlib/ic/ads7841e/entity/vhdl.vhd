-- generated by newgenasym Mon Mar 19 14:00:48 2012

library ieee;
use     ieee.std_logic_1164.all;
use     work.all;
entity ads7841e is
    port (    
	\+vcc\:    INOUT  STD_LOGIC_VECTOR (2 DOWNTO 1);    
	BUSY:      INOUT  STD_LOGIC;    
	CH0:       INOUT  STD_LOGIC;    
	CH1:       INOUT  STD_LOGIC;    
	CH2:       INOUT  STD_LOGIC;    
	CH3:       INOUT  STD_LOGIC;    
	COM:       INOUT  STD_LOGIC;    
	\cs#\:     INOUT  STD_LOGIC;    
	DCLK:      INOUT  STD_LOGIC;    
	DIN:       INOUT  STD_LOGIC;    
	DOUT:      INOUT  STD_LOGIC;    
	GND:       INOUT  STD_LOGIC;    
	MODE:      INOUT  STD_LOGIC;    
	\shdn#\:   INOUT  STD_LOGIC;    
	VREF:      INOUT  STD_LOGIC);
end ads7841e;
