library ieee;
use ieee.std_logic_1164.all;

entity UnidadeControleULA is
  port ( funct : in std_logic_vector(5 downto 0);
			opcode: in std_logic_vector(5 downto 0);
			tipoR : in std_logic;
         saida : out std_logic_vector(3 downto 0)
  );
end entity;

architecture comportamento of UnidadeControleULA is
  constant ADD   : std_logic_vector(5 downto 0) := 6x"20";
  constant SUB   : std_logic_vector(5 downto 0) := 6x"22";
  constant ANDOP : std_logic_vector(5 downto 0) := 6x"24";
  constant OROP  : std_logic_vector(5 downto 0) := 6x"25";
  constant SLT   : std_logic_vector(5 downto 0) := 6x"2a";
 
  constant LW    : std_logic_vector(5 downto 0) := "100011";
  constant SW    : std_logic_vector(5 downto 0) := "101011";
  constant BEQ   : std_logic_vector(5 downto 0) := "000100";
  
  constant LUI   : std_logic_vector(5 downto 0) := "001111";
  constant ADDI  : std_logic_vector(5 downto 0) := "001000";
  constant ANDI  : std_logic_vector(5 downto 0) := "001100";
  constant ORI   : std_logic_vector(5 downto 0) := "001101";
  constant SLTI  : std_logic_vector(5 downto 0) := "001010";
  constant BNE   : std_logic_vector(5 downto 0) := "000101";
  constant JAL   : std_logic_vector(5 downto 0) := "000011";
  constant JR    : std_logic_vector(5 downto 0) := 6x"08";
    
  begin
saida <= "0000" when (funct = ANDOP and tipoR = '1') else
         "0001" when (funct = OROP  and tipoR = '1') else
			"0010" when (funct = ADD   and tipoR = '1') else
			"0110" when (funct = SUB   and tipoR = '1') else
			"0111" when (funct = SLT   and tipoR = '1') else
			"0010" when (opcode = LW   and tipoR = '0') else
			"0010" when (opcode = SW   and tipoR = '0') else
			"0010" when (opcode = BEQ  and tipoR = '0') else
			"0010" when (opcode = LUI  and tipoR = '0') else
			"0010" when (opcode = ADDI and tipoR = '0') else
			"0000" when (opcode = ANDI and tipoR = '0') else
			"0001" when (opcode = ORI  and tipoR = '0') else
			"0111" when (opcode = SLTI and tipoR = '0') else
			"0110" when (opcode = BNE  and tipoR = '0') else
			"0110" when (opcode = BEQ  and tipoR = '0');  
end architecture;