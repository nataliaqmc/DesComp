library ieee;
use ieee.std_logic_1164.all;

entity UnidadeControleULA is
  port ( funct : in std_logic_vector(5 downto 0);
			ULAop : in std_logic_vector(1 downto 0);
         saida : out std_logic_vector(3 downto 0)
  );
end entity;

architecture comportamento of UnidadeControleULA is
  constant ADD   : std_logic_vector(5 downto 0) := 6x"20";
  constant SUB   : std_logic_vector(5 downto 0) := 6x"22";
  constant ANDOP : std_logic_vector(5 downto 0) := 6x"24";
  constant OROP  : std_logic_vector(5 downto 0) := 6x"25";
  constant SLT   : std_logic_vector(5 downto 0) := 6x"2a";
  
  constant Rinstr: std_logic_vector(1 downto 0) := "00";
  constant LW    : std_logic_vector(1 downto 0) := "01";
  constant SW    : std_logic_vector(1 downto 0) := "10";
  constant BEQ   : std_logic_vector(1 downto 0) := "11";
    
  begin
saida <= "0000" when (funct = ADD   and ULAop = Rinstr) else
			"0001" when (funct = SUB   and ULAop = Rinstr) else
			"0010" when (funct = ANDOP and ULAop = Rinstr) else
         "0011" when (funct = OROP  and ULAop = Rinstr) else
			"0100" when (funct = SLT   and ULAop = Rinstr) else
			"0101" when (ULAop = LW) else
			"0110" when (ULAop = SW)  else
			"0111" when (ULAop = BEQ);  
end architecture;