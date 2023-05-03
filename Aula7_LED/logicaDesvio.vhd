library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity logicaDesvio is
    port (
      Flag:     in STD_LOGIC;
      JEQ:      in STD_LOGIC;
		JMP:      in STD_LOGIC;
		RET:      in STD_LOGIC;
		JSR:      in STD_LOGIC;
      saida:    out STD_LOGIC_vector(1 downto 0)
    );
end entity;

architecture comportamento of logicaDesvio is
    begin
      saida(1) <= RET;
		saida(0) <= JMP or (JEQ and Flag) or JSR;
		
end architecture;