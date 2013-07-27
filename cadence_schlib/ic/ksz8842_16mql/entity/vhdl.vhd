-- generated by newgenasym Wed Sep 21 20:41:33 2011

library ieee;
use     ieee.std_logic_1164.all;
use     work.all;
entity ksz8842_16mql is
    port (    
	A1:        INOUT  STD_LOGIC;    
	A10:       INOUT  STD_LOGIC;    
	A11:       INOUT  STD_LOGIC;    
	A12:       INOUT  STD_LOGIC;    
	A13:       INOUT  STD_LOGIC;    
	A14:       INOUT  STD_LOGIC;    
	A15:       INOUT  STD_LOGIC;    
	A2:        INOUT  STD_LOGIC;    
	A3:        INOUT  STD_LOGIC;    
	A4:        INOUT  STD_LOGIC;    
	A5:        INOUT  STD_LOGIC;    
	A6:        INOUT  STD_LOGIC;    
	A7:        INOUT  STD_LOGIC;    
	A8:        INOUT  STD_LOGIC;    
	A9:        INOUT  STD_LOGIC;    
	ADSN:      INOUT  STD_LOGIC;    
	AEN:       INOUT  STD_LOGIC;    
	AGND1:     INOUT  STD_LOGIC;    
	AGND2:     INOUT  STD_LOGIC;    
	AGND3:     INOUT  STD_LOGIC;    
	AGND4:     INOUT  STD_LOGIC;    
	AGND5:     INOUT  STD_LOGIC;    
	AGND6:     INOUT  STD_LOGIC;    
	AGND7:     INOUT  STD_LOGIC;    
	AGND8:     INOUT  STD_LOGIC;    
	ARDY:      INOUT  STD_LOGIC;    
	AVDD1:     INOUT  STD_LOGIC;    
	AVDD2:     INOUT  STD_LOGIC;    
	BCLK:      INOUT  STD_LOGIC;    
	BE0N:      INOUT  STD_LOGIC;    
	BE1N:      INOUT  STD_LOGIC;    
	BE2N:      INOUT  STD_LOGIC;    
	BE3N:      INOUT  STD_LOGIC;    
	CYCLEN:    INOUT  STD_LOGIC;    
	D0:        INOUT  STD_LOGIC;    
	D1:        INOUT  STD_LOGIC;    
	D10:       INOUT  STD_LOGIC;    
	D11:       INOUT  STD_LOGIC;    
	D12:       INOUT  STD_LOGIC;    
	D13:       INOUT  STD_LOGIC;    
	D14:       INOUT  STD_LOGIC;    
	D15:       INOUT  STD_LOGIC;    
	D2:        INOUT  STD_LOGIC;    
	D3:        INOUT  STD_LOGIC;    
	D4:        INOUT  STD_LOGIC;    
	D5:        INOUT  STD_LOGIC;    
	D6:        INOUT  STD_LOGIC;    
	D7:        INOUT  STD_LOGIC;    
	D8:        INOUT  STD_LOGIC;    
	D9:        INOUT  STD_LOGIC;    
	DATACSN:   INOUT  STD_LOGIC;    
	EECS:      INOUT  STD_LOGIC;    
	EEDI:      INOUT  STD_LOGIC;    
	EEDO:      INOUT  STD_LOGIC;    
	EEEN:      INOUT  STD_LOGIC;    
	EESK:      INOUT  STD_LOGIC;    
	INTR:      INOUT  STD_LOGIC;    
	ISET:      INOUT  STD_LOGIC;    
	LDEVN:     INOUT  STD_LOGIC;    
	NC1:       INOUT  STD_LOGIC;    
	NC10:      INOUT  STD_LOGIC;    
	NC11:      INOUT  STD_LOGIC;    
	NC12:      INOUT  STD_LOGIC;    
	NC13:      INOUT  STD_LOGIC;    
	NC14:      INOUT  STD_LOGIC;    
	NC15:      INOUT  STD_LOGIC;    
	NC16:      INOUT  STD_LOGIC;    
	NC17:      INOUT  STD_LOGIC;    
	NC18:      INOUT  STD_LOGIC;    
	NC19:      INOUT  STD_LOGIC;    
	NC2:       INOUT  STD_LOGIC;    
	NC20:      INOUT  STD_LOGIC;    
	NC3:       INOUT  STD_LOGIC;    
	NC4:       INOUT  STD_LOGIC;    
	NC5:       INOUT  STD_LOGIC;    
	NC6:       INOUT  STD_LOGIC;    
	NC7:       INOUT  STD_LOGIC;    
	NC8:       INOUT  STD_LOGIC;    
	NC9:       INOUT  STD_LOGIC;    
	P1LED0:    INOUT  STD_LOGIC;    
	P1LED1:    INOUT  STD_LOGIC;    
	P1LED2:    INOUT  STD_LOGIC;    
	P1LED3:    INOUT  STD_LOGIC;    
	P2LED0:    INOUT  STD_LOGIC;    
	P2LED1:    INOUT  STD_LOGIC;    
	P2LED2:    INOUT  STD_LOGIC;    
	P2LED3:    INOUT  STD_LOGIC;    
	PLLVDD:    INOUT  STD_LOGIC;    
	PWRDN:     INOUT  STD_LOGIC;    
	RDN:       INOUT  STD_LOGIC;    
	RDYRTNN:   INOUT  STD_LOGIC;    
	RSTN:      INOUT  STD_LOGIC;    
	RXM1:      INOUT  STD_LOGIC;    
	RXM2:      INOUT  STD_LOGIC;    
	RXP1:      INOUT  STD_LOGIC;    
	RXP2:      INOUT  STD_LOGIC;    
	SCANEN:    INOUT  STD_LOGIC;    
	SRDYN:     INOUT  STD_LOGIC;    
	SWR:       INOUT  STD_LOGIC;    
	TEST1:     INOUT  STD_LOGIC;    
	TEST2:     INOUT  STD_LOGIC;    
	TESTEN:    INOUT  STD_LOGIC;    
	TXM1:      INOUT  STD_LOGIC;    
	TXM2:      INOUT  STD_LOGIC;    
	TXP1:      INOUT  STD_LOGIC;    
	TXP2:      INOUT  STD_LOGIC;    
	VDD_RX2:   INOUT  STD_LOGIC;    
	VDD_RX33:  INOUT  STD_LOGIC;    
	VDD_TX33:  INOUT  STD_LOGIC;    
	VDDCORE1:  INOUT  STD_LOGIC;    
	VDDCORE2:  INOUT  STD_LOGIC;    
	VDDIO1:    INOUT  STD_LOGIC;    
	VDDIO2:    INOUT  STD_LOGIC;    
	VDDIO3:    INOUT  STD_LOGIC;    
	VDDIO4:    INOUT  STD_LOGIC;    
	VDDIO5:    INOUT  STD_LOGIC;    
	VLBUSN:    INOUT  STD_LOGIC;    
	VSSCORE1:  INOUT  STD_LOGIC;    
	VSSCORE2:  INOUT  STD_LOGIC;    
	VSSCORE3:  INOUT  STD_LOGIC;    
	VSSIO1:    INOUT  STD_LOGIC;    
	VSSIO2:    INOUT  STD_LOGIC;    
	VSSIO3:    INOUT  STD_LOGIC;    
	VSSIO4:    INOUT  STD_LOGIC;    
	VSSIO5:    INOUT  STD_LOGIC;    
	WRN:       INOUT  STD_LOGIC;    
	X1:        INOUT  STD_LOGIC;    
	X2:        INOUT  STD_LOGIC);
end ksz8842_16mql;
