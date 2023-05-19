library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULAbit31 is
    port
    ( 
      entradaA: in std_logic; 
		entradaB:  in STD_LOGIC;
		slt: in std_logic;
		inverteB,inverteA: in std_logic;
		carryIn: in std_logic;
      seletor:  in STD_LOGIC_VECTOR(1 downto 0);
		Overflow: out std_logic;
      saida:    out STD_LOGIC
		);
end entity;

architecture comportamento of ULAbit31 is
	signal carryOut: std_logic;
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
				 seletor_MUX => inverteA,
				 saida_MUX => muxAout);
muxB: entity  work.muxULA
	port map (entradaA_MUX => entradaB,
				 entradaB_MUX => not entradaB,
				 seletor_MUX => inverteB,
				 saida_MUX => muxBout);
				
somador: entity work.somador1bit
	port map (entradaA => entradaA,
				 entradaB => muxBout,
				 carryIn => carryIn,
				 carryOut => carryOut,
				 saida => ADD);
				 
ANDOP <= entradaA and muxBout;
OROP  <= entradaA or muxBout;
somadorOut <= ADD;

saida <= ANDOP when (seletor = "00") else
			OROP  when (seletor = "01") else
			ADD   when (seletor = "10") else	   
			slt   when (seletor = "11") else
			somadorOut;
Overflow <= (carryIn xor carryOut);
end architecture;