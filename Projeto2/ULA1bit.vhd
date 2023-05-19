library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULA1bit is
    port
    ( 
      entradaA, entradaB: in std_logic; 
		inverteA,inverteB: in std_logic;
		carryIn,slt: in std_logic;
		carryOut: out std_logic;
      seletor:  in STD_LOGIC_VECTOR(1 downto 0);
      saida:    out STD_LOGIC
		);
end entity;

architecture comportamento of ULA1bit is
   signal ADD  : STD_LOGIC;
   signal SUB  : STD_LOGIC;
   signal ANDOP: STD_LOGIC;
   signal OROP : STD_LOGIC;
	signal muxAout: STD_LOGIC;
	signal muxBout: STD_LOGIC;
	signal somadorOut: STD_LOGIC;
	
begin
muxA: entity  work.muxULA
	port map (entradaA_MUX => entradaA,
				 entradaB_MUX => not entradaA,
				 seletor_MUX => '0',
				 saida_MUX => muxAout);
muxB: entity  work.muxULA
	port map (entradaA_MUX => entradaB,
				 entradaB_MUX => not entradaB,
				 seletor_MUX => inverteB,
				 saida_MUX => muxBout);
				
somador: entity work.somador1bit
	port map (entradaA => muxAout,
				 entradaB => muxBout,
				 carryIn => carryIn,
				 carryOut => carryOut,
				 saida => somadorOut);
				 
ANDOP <= muxAout and muxBout;
OROP  <= muxAout or muxBout;

saida <= ANDOP when (seletor = "00") else
			OROP  when (seletor = "01") else
			somadorOut;
end architecture;