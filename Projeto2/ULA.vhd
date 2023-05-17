library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULA is
    generic
    (
        larguraDados : natural := 32
    );
    port
    (
      entradaA, entradaB:  in STD_LOGIC_VECTOR((larguraDados-1) downto 0);
      seletor:  in STD_LOGIC_VECTOR(3 downto 0);
      saida:    out STD_LOGIC_VECTOR((larguraDados-1) downto 0);
		flagEQ:   out STD_LOGIC
    );
end entity;

architecture comportamento of ULA is
  --constant zero : std_logic_vector(larguraDados-1 downto 0) := (others => '0');

   signal ADD  : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal SUB  : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal ANDOP: STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal OROP : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal SLT  : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal LW   : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal SW   : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal BEQ  : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   begin
      ADD   <= STD_LOGIC_VECTOR(signed(entradaA) + signed(entradaB));
      SUB   <= STD_LOGIC_VECTOR(signed(entradaA) - signed(entradaB));
      ANDOP <= entradaA and entradaB;
      OROP  <= entradaA or entradaB;
		SLT   <= 31x"0"&SUB(31);
		LW    <= entradaA;
		SW    <= entradaB;
		BEQ   <= STD_LOGIC_VECTOR(signed(entradaA) - signed(entradaB));
      saida <= ADD   when (seletor = "0000") else
				   SUB   when (seletor = "0001") else
				   ANDOP when (seletor = "0010") else
				   OROP  when (seletor = "0011") else
				   SLT   when (seletor = "0100") else
					LW    when (seletor = "0101") else
				   SW    when (seletor = "0110") else
					BEQ;
		
		flagEQ <= '1' when unsigned(BEQ) = 0 else '0';

end architecture;