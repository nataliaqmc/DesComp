library ieee;
use ieee.std_logic_1164.all;

entity muxULA is
  port (
    entradaA_MUX: in std_logic;
	 entradaB_MUX : in std_logic;
    seletor_MUX : in std_logic;
    saida_MUX : out std_logic
  );
end entity;

architecture comportamento of muxULA is
  begin
    saida_MUX <= entradaB_MUX when (seletor_MUX = '1') else entradaA_MUX;
end architecture;