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
		flagEQ:   out STD_LOGIC
    );
end entity;

architecture comportamento of ULA is
  --constant zero : std_logic_vector(larguraDados-1 downto 0) := (others => '0');

   signal soma :      STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal subtracao : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal op_and :    STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal op_or :     STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal op_nor :    STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   --signal op_not :    STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	
	--signal sub_result: STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal slt    :    STD_LOGIC_VECTOR((larguraDados-1) downto 0);

    begin
      soma      <= STD_LOGIC_VECTOR(signed(entradaA) + signed(entradaB));
      subtracao <= STD_LOGIC_VECTOR(signed(entradaA) - signed(entradaB));
      op_and    <= entradaA and entradaB;
      op_or     <= entradaA or entradaB;
      op_nor    <= entradaA nor entradaB;
      --op_not    <= not entradaA;
		
		--sub_result<= STD_LOGIC_VECTOR(signed(entradaA) - signed(entradaB));
		slt       <= 31x"0"&subtracao(31);

      saida <= subtracao when (seletor = "000") else
				   soma when      (seletor = "001") else
				   op_nor when    (seletor = "010") else
				   op_and when    (seletor = "011") else
				   op_or when     (seletor = "100") else
					slt   when     (seletor = "101") else
				   entradaA when  (seletor = "110") else
					entradaB;
		
		flagEQ <= '1' when unsigned(subtracao) = 0 else '0';

end architecture;