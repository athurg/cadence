-- generated by newgenasym Fri May 28 10:19:35 2010

library ieee;
use     ieee.std_logic_1164.all;
use     work.all;
entity hmc627lp5e is
    port (    
	ACG1:      INOUT  STD_LOGIC;    
	ACG2:      INOUT  STD_LOGIC;    
	ACG3:      INOUT  STD_LOGIC;    
	ACG4:      INOUT  STD_LOGIC;    
	ACG5:      INOUT  STD_LOGIC;    
	ACG6:      INOUT  STD_LOGIC;    
	AMPIN:     IN     STD_LOGIC;    
	AMPOUT:    OUT    STD_LOGIC;    
	CLK:       INOUT  STD_LOGIC;    
	D0:        INOUT  STD_LOGIC;    
	D1:        INOUT  STD_LOGIC;    
	D2:        INOUT  STD_LOGIC;    
	D3:        INOUT  STD_LOGIC;    
	D4:        INOUT  STD_LOGIC;    
	D5:        INOUT  STD_LOGIC;    
	DAT1:      OUT    STD_LOGIC;    
	DAT2:      IN     STD_LOGIC;    
	GND1:      IN     STD_LOGIC;    
	GND2:      IN     STD_LOGIC;    
	GND3:      IN     STD_LOGIC;    
	GND4:      IN     STD_LOGIC;    
	GND5:      IN     STD_LOGIC;    
	GND6:      IN     STD_LOGIC;    
	GND7:      IN     STD_LOGIC;    
	LE:        INOUT  STD_LOGIC;    
	\n/c\:     IN     STD_LOGIC;    
	\p/s\:     INOUT  STD_LOGIC;    
	PAD:       IN     STD_LOGIC;    
	PUP1:      INOUT  STD_LOGIC;    
	PUP2:      INOUT  STD_LOGIC;    
	SERIN:     IN     STD_LOGIC;    
	SEROUT:    OUT    STD_LOGIC;    
	VDD:       IN     STD_LOGIC);
end hmc627lp5e;