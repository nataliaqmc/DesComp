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
      seletor:  in STD_LOGIC_VECTOR(2 downto 0);
      saida:    out STD_LOGIC_VECTOR((larguraDados-1) downto 0);
		flag:   out STD_LOGIC
    );
end entity;

architecture comportamento of ULA is
  --constant zero : std_logic_vector(larguraDados-1 downto 0) := (others => '0');

   signal SOMA: STD_LOGIC_VECTOR((larguraDados-1) downto 0); -- A + B
   signal SUB : STD_LOGIC_VECTOR((larguraDados-1) downto 0); -- A - B
   signal ANDOP: STD_LOGIC_VECTOR((larguraDados-1) downto 0); -- A and B
   signal OROP : STD_LOGIC_VECTOR((larguraDados-1) downto 0); -- A or B
	signal NOROP : STD_LOGIC_VECTOR((larguraDados-1) downto 0); -- A or B
	signal SLT : STD_LOGIC_VECTOR((larguraDados-1) downto 0); -- set if less than
	signal LW  : STD_LOGIC_VECTOR((larguraDados-1) downto 0); -- load word (soma)
	signal SW  : STD_LOGIC_VECTOR((larguraDados-1) downto 0); -- store word (soma)
	signal BEQ : STD_LOGIC_VECTOR((larguraDados-1) downto 0); -- branch if equal (sub)

    begin
      SOMA  <= STD_LOGIC_VECTOR(signed(entradaA) + signed(entradaB));
      SUB   <= STD_LOGIC_VECTOR(signed(entradaA) - signed(entradaB));
      ANDOP  <= entradaA and entradaB;
      OROP   <= entradaA or entradaB;
		NOROP   <= entradaA nor entradaB;
		SLT   <= 31x"0"&SUB(31);

      saida <= SUB   when (seletor = "000") else
					SOMA  when (seletor = "001") else
					NOROP when (seletor = "101") else
				   ANDOP when (seletor = "011") else
				   OROP  when (seletor = "100") else
					SLT   when (seletor = "101") else
					entradaA;
		
		flag <= '1' when unsigned(SUB) = 0 else '0';

end architecture;