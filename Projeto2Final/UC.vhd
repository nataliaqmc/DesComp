library ieee;
use ieee.std_logic_1164.all;

entity UC is
  port ( opCode : in std_logic_vector(5 downto 0);
			funct : in std_logic_vector(5 downto 0);
         saida : out std_logic_vector(11 downto 0)
  );
end entity;

architecture comportamento of UC is
  constant SOMA  : std_logic_vector(5 downto 0) := 6x"20";
  constant SUB   : std_logic_vector(5 downto 0) := 6x"22";
  constant ANDOP : std_logic_vector(5 downto 0) := 6x"24";
  constant OROP  : std_logic_vector(5 downto 0) := 6x"25";
  constant NOROP : std_logic_vector(5 downto 0) := 6x"27";
  constant SLT   : std_logic_vector(5 downto 0) := 6x"2a";
  
  constant LW    : std_logic_vector(5 downto 0) := 6x"23";
  constant SW    : std_logic_vector(5 downto 0) := 6x"2b";
  constant BEQ   : std_logic_vector(5 downto 0) := 6x"04";
  
  constant J 	  : std_logic_vector(5 downto 0) := 6x"02";
  
  constant R_TYPE: std_logic_vector(5 downto 0) := 6x"0";

  begin
saida <= '0'&'1'&'1'&'0'&"000"&'0'&'0'&"000" when (funct = SUB   and opCode = R_TYPE) else
			'0'&'1'&'1'&'0'&"001"&'0'&'0'&"000" when (funct = SOMA  and opCode = R_TYPE) else
			'0'&'1'&'1'&'0'&"010"&'0'&'0'&"000" when (funct = NOROP and opCode = R_TYPE) else
         '0'&'1'&'1'&'0'&"011"&'0'&'0'&"000" when (funct = ANDOP and opCode = R_TYPE) else
			'0'&'1'&'1'&'0'&"100"&'0'&'0'&"000" when (funct = OROP  and opCode = R_TYPE) else
			'0'&'1'&'1'&'0'&"101"&'0'&'0'&"000" when (funct = SLT   and opCode = R_TYPE) else
			'0'&'0'&'1'&'1'&"001"&'1'&'0'&"110" when (opCode = LW)  else
			'0'&'0'&'0'&'1'&"001"&'0'&'0'&"101" when (opCode = SW)  else
			'0'&'0'&'0'&'0'&"000"&'0'&'1'&"000" when (opCode = BEQ) else
			'1'&'0'&'0'&'0'&"110"&'0'&'0'&"000" when (opCode = J)   else
         '0'&'0'&'0'&'0'&"110"&'0'&'0'&"000";  
end architecture;