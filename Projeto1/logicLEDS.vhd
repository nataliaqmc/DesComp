library ieee;
use ieee.std_logic_1164.all;

entity logicLEDS is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8);
  port (
	 CLK: in std_logic;
	 CPU_EscritoRam: in std_logic_vector(7 downto 0);
	 Habilita_LED: in std_logic;
	 Habilita_LED8: in std_logic;
	 Habilita_LED9: in std_logic;
	 LEDR: out std_logic_vector(9 downto 0)
  );
end entity;

architecture comportamento of logicLEDS is
  begin
  
LED_COMBO : entity work.registradorGenerico   generic map (larguraDados => 8)
		 port map (DIN => CPU_EscritoRam, DOUT => LEDR(7 downto 0), ENABLE => Habilita_LED, CLK => CLK, RST => '0');
			 
LEDR8 : entity work.registradorBooleano  generic map (larguraDados => 1)
		 port map (DIN => CPU_EscritoRam(0), DOUT => LEDR(8), ENABLE => Habilita_LED8, CLK => CLK, RST => '0');
			 
LEDR9 :	entity work.registradorBooleano  generic map (larguraDados => 1)
		 port map (DIN => CPU_EscritoRam(0), DOUT => LEDR(9), ENABLE => Habilita_LED9, CLK => CLK, RST => '0');

	 
end architecture;