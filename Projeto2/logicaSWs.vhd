library ieee;
use ieee.std_logic_1164.all;

entity logicSW is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8);
  port (
	 CLK : in std_logic;
    SW: in std_logic_vector(9 downto 0);
	 Habilita_SW: in std_logic;
	 Habilita_SW8: in std_logic;
	 Habilita_SW9: in std_logic;
	 LidoRam_CPU: out std_logic_vector(7 downto 0);
	 SW9_SAIDA: out std_logic;
	 SW8_SAIDA: out std_logic
  );
end entity;

architecture comportamento of logicSW is
  begin
  
BUFF_SW :  entity work.buffer_3_state_8_portas
        port map(entrada => SW(7 downto 0), habilita =>  Habilita_SW, saida => LidoRam_CPU);
		  
BUFF_SW8 :  entity work.buffer_3_state_1porta
        port map(entrada => SW(8), habilita =>  Habilita_SW8, saida => SW8_SAIDA);
		  
BUFF_SW9 :  entity work.buffer_3_state_1porta
        port map(entrada => SW(9), habilita =>  Habilita_SW9, saida => SW9_SAIDA);

	 
end architecture;