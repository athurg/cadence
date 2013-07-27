-- generated by newgenasym Thu Feb 12 15:00:51 2009

library ieee;
use     ieee.std_logic_1164.all;
use     work.all;
entity dm9161aep is
    port (    
	AGND_1:    IN     STD_LOGIC;    
	AGND_2:    IN     STD_LOGIC;    
	AGND_3:    IN     STD_LOGIC;    
	AVDDR_1:   INOUT  STD_LOGIC;    
	AVDDR_2:   INOUT  STD_LOGIC;    
	AVDDT:     INOUT  STD_LOGIC;    
	BGRES:     INOUT  STD_LOGIC;    
	BGRESG:    INOUT  STD_LOGIC;    
	\cablests/linksts\: INOUT  STD_LOGIC;    
	\col/rmii\: OUT    STD_LOGIC;    
	\crs/phyad_4\: OUT    STD_LOGIC;    
	\crs_dv/rxdv/testmode\: OUT    STD_LOGIC;    
	DGND_1:    IN     STD_LOGIC;    
	DGND_2:    IN     STD_LOGIC;    
	DGND_3:    IN     STD_LOGIC;    
	DISMDIX:   INOUT  STD_LOGIC;    
	DVDD_1:    IN     STD_LOGIC;    
	DVDD_2:    IN     STD_LOGIC;    
	DVDD_3:    IN     STD_LOGIC;    
	\fdx/colled#/op0\: INOUT  STD_LOGIC;    
	LEDMODE:   INOUT  STD_LOGIC;    
	\link/actled#/op2\: INOUT  STD_LOGIC;    
	MDC:       IN     STD_LOGIC;    
	\mdintr#\: INOUT  STD_LOGIC;    
	MDIO:      INOUT  STD_LOGIC;    
	NC:        INOUT  STD_LOGIC;    
	PWRDWN:    INOUT  STD_LOGIC;    
	\reset#\:  INOUT  STD_LOGIC;    
	\rx+\:     INOUT  STD_LOGIC;    
	\rx-\:     INOUT  STD_LOGIC;    
	\rx_er/rxd_4/prtr\: OUT    STD_LOGIC;    
	\rxclk/10btser\: OUT    STD_LOGIC;    
	\rxd_0/phyad_0\: OUT    STD_LOGIC;    
	\rxd_1/phyad_1\: OUT    STD_LOGIC;    
	\rxd_2/phyad_2\: OUT    STD_LOGIC;    
	\rxd_3/phyad_3\: OUT    STD_LOGIC;    
	\speedled#/op1\: INOUT  STD_LOGIC;    
	\tx+\:     INOUT  STD_LOGIC;    
	\tx-\:     INOUT  STD_LOGIC;    
	TX_EN:     IN     STD_LOGIC;    
	\txclk/isolate\: OUT    STD_LOGIC;    
	TXD_0:     IN     STD_LOGIC;    
	TXD_1:     IN     STD_LOGIC;    
	TXD_2:     IN     STD_LOGIC;    
	TXD_3:     IN     STD_LOGIC;    
	\txer/txd_4\: IN     STD_LOGIC;    
	XT1:       IN     STD_LOGIC;    
	\xt2/ref_clk\: INOUT  STD_LOGIC);
end dm9161aep;
