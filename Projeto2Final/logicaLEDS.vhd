library ieee;
use ieee.std_logic_1164.all;

entity logicLEDS is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8);
  port (
	 CLK: in std_logic;
	 Data_IN: in std_logic_vector(31 downto 0);
	 LEDR: out std_logic_vector(9 downto 0)
  );
end entity;

architecture comportamento of logicLEDS is
  begin
  
LED_9 : entity work.registradorBooleano generic map (larguraDados => 1)
		 port map (DIN => Data_IN(31), DOUT => LEDR(9), ENABLE => Data_IN(31), CLK => CLK, RST => '0');
LED_8 : entity work.registradorBooleano generic map (larguraDados => 1)
		 port map (DIN => Data_IN(30), DOUT => LEDR(8), ENABLE => Data_IN(30), CLK => CLK, RST => '0');
LED_7 : entity work.registradorBooleano generic map (larguraDados => 1)
		 port map (DIN => Data_IN(29), DOUT => LEDR(7), ENABLE => Data_IN(29), CLK => CLK, RST => '0');
LED_6 : entity work.registradorBooleano generic map (larguraDados => 1)
		 port map (DIN => Data_IN(28), DOUT => LEDR(6), ENABLE => Data_IN(28), CLK => CLK, RST => '0');
LED_5 : entity work.registradorBooleano generic map (larguraDados => 1)
		 port map (DIN => Data_IN(5), DOUT => LEDR(5), ENABLE => Data_IN(5), CLK => CLK, RST => '0');
LED_4 : entity work.registradorBooleano generic map (larguraDados => 1)
		 port map (DIN => Data_IN(4), DOUT => LEDR(4), ENABLE => Data_IN(4), CLK => CLK, RST => '0');		 
LED_3 : entity work.registradorBooleano generic map (larguraDados => 1)
		 port map (DIN => Data_IN(3), DOUT => LEDR(3), ENABLE => Data_IN(3), CLK => CLK, RST => '0');
LED_2 : entity work.registradorBooleano generic map (larguraDados => 1)
		 port map (DIN => Data_IN(2), DOUT => LEDR(2), ENABLE => Data_IN(2), CLK => CLK, RST => '0');
LED_1 : entity work.registradorBooleano generic map (larguraDados => 1)
		 port map (DIN => Data_IN(1), DOUT => LEDR(1), ENABLE => Data_IN(1), CLK => CLK, RST => '0');
LED_0 : entity work.registradorBooleano generic map (larguraDados => 1)
		 port map (DIN => Data_IN(0), DOUT => LEDR(0), ENABLE => Data_IN(0), CLK => CLK, RST => '0');		 
	 
end architecture;