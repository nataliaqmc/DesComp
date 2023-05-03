library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity logicaLED is
    port (
		CLK : in std_logic;
      Data_OUT: in STD_LOGIC_vector(7 downto 0);
		Wr : in STD_LOGIC;
		saidaDecoder2 : in std_logic_vector(7 downto 0);
		bloco4 : in std_logic;
      saida:    out STD_LOGIC_vector(9 downto 0)
    );
end entity;

architecture comportamento of logicaLED is
	 signal leds : std_logic_vector(7 downto 0);
	 signal led8 : std_logic;
	 signal led9 : std_logic;
	 signal Habilita_Led_R : std_logic;
	 signal Habilita_Led_8 : std_logic;
	 signal Habilita_Led_9 : std_logic;
    begin
      REG_LED: entity work.registradorGenerico generic map(larguraDados => 8)
				port map (DIN => Data_OUT,
							 DOUT => leds,
							 ENABLE => Habilita_Led_R,
							 CLK => CLK,
							 RST => '0');
		REG_FF_8: entity work.FlipFlop generic map(larguraDados => 1)
						port map (DIN => Data_OUT(0),
									 DOUT => led8,
									 ENABLE => Habilita_Led_8,
									 CLK => CLK,
									 RST => '0');
		REG_FF_9: entity work.FlipFlop generic map(larguraDados => 1)
						port map (DIN => Data_OUT(0),
									 DOUT => led9,
									 ENABLE => Habilita_Led_9,
									 CLK => CLK,
									 RST => '0');
Habilita_Led_R <= (Wr and saidaDecoder2(0) and bloco4);
Habilita_Led_8 <= (Wr and saidaDecoder2(1) and bloco4);
Habilita_Led_9 <= (Wr and saidaDecoder2(2) and bloco4);

saida(9) <= led9;
saida(8) <= led8;
saida(7 downto 0) <= leds; 		
end architecture;