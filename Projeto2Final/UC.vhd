library ieee;
use ieee.std_logic_1164.all;

entity UC is 
  port ( opCode : in std_logic_vector(5 downto 0);
			funct  : in std_logic_vector(5 downto 0);
         saida : out std_logic_vector(13 downto 0)
  );
end entity;

architecture comportamento of UC is
  constant SOMA  : std_logic_vector(5 downto 0) := 6x"20";
  constant SUB   : std_logic_vector(5 downto 0) := 6x"22";
  constant ANDOP : std_logic_vector(5 downto 0) := 6x"24";
  constant OROP  : std_logic_vector(5 downto 0) := 6x"25";
  constant SLT   : std_logic_vector(5 downto 0) := 6x"2a";
  
  constant LW    : std_logic_vector(5 downto 0) := 6x"23";
  constant SW    : std_logic_vector(5 downto 0) := "101011";
  constant BEQ   : std_logic_vector(5 downto 0) := 6x"04";
  
  constant J 	  : std_logic_vector(5 downto 0) := 6x"02";
  
  constant R_TYPE: std_logic_vector(5 downto 0) := 6x"0";
	
  constant LUI: std_logic_vector(5 downto 0) := "001111";
  constant ADDI: std_logic_vector(5 downto 0) := "001000";
  constant ANDI: std_logic_vector(5 downto 0) := "001100";
  constant ORI: std_logic_vector(5 downto 0) := "001101";
  constant SLTI: std_logic_vector(5 downto 0) := "001010";
  constant BNE: std_logic_vector(5 downto 0) := "000101";
  constant JAL: std_logic_vector(5 downto 0) := 6x"3";
  constant JR: std_logic_vector(5 downto 0) := 6x"08";
			--  X   X        X           X        X   X
  begin   -- mux mux mux  oa  hab mux  R  mux  beq bne rd  wr  
	saida <= 
				'0'&'0'&"00"&'0'&'1'&'1'&'0'&"01"&'0'&'0'&'1'&'0' when (opCode = LW)  else
				'0'&'0'&"00"&'0'&'0'&'1'&'0'&"00"&'0'&'0'&'0'&'1' when (opCode = SW)  else
				'0'&'0'&"00"&'0'&'0'&'0'&'0'&"00"&'1'&'0'&'0'&'0' when (opCode = BEQ) else
				'0'&'1'&"00"&'0'&'0'&'0'&'0'&"00"&'0'&'0'&'0'&'0' when (opCode = J)   else
				
	
				'0'&'0'&"00"&'0'&'1'&'0'&'0'&"11"&'0'&'0'&'0'&'0' when (opCode = LUI) else
				'0'&'0'&"00"&'0'&'1'&'1'&'0'&"00"&'0'&'0'&'0'&'0' when (opCode = ADDI) else
				'0'&'0'&"00"&'1'&'1'&'1'&'0'&"00"&'0'&'0'&'0'&'0' when (opCode = ANDI) else
				'0'&'0'&"00"&'1'&'1'&'1'&'0'&"00"&'0'&'0'&'0'&'0' when (opCode = ORI) else
				'0'&'0'&"00"&'0'&'1'&'1'&'0'&"00"&'0'&'0'&'0'&'0' when (opCode = SLTI) else
				'0'&'0'&"00"&'0'&'0'&'0'&'0'&"00"&'0'&'1'&'0'&'0' when (opCode = BNE) else
				'0'&'1'&"10"&'0'&'1'&'0'&'0'&"10"&'0'&'0'&'0'&'0' when (opCode = JAL) else
				'1'&'0'&"00"&'0'&'0'&'0'&'1'&"00"&'0'&'0'&'0'&'0' when (opCode = "000000" and funct = JR   ) else
				
				'0'&'0'&"01"&'0'&'1'&'0'&'1'&"00"&'0'&'0'&'0'&'0' when (opCode = R_TYPE   and funct = SOMA ) else
				'0'&'0'&"01"&'0'&'1'&'0'&'1'&"00"&'0'&'0'&'0'&'0' when (opCode = R_TYPE   and funct = SUB  ) else
				'0'&'0'&"01"&'0'&'1'&'0'&'1'&"00"&'0'&'0'&'0'&'0' when (opCode = R_TYPE   and funct = ANDOP) else
				'0'&'0'&"01"&'0'&'1'&'0'&'1'&"00"&'0'&'0'&'0'&'0' when (opCode = R_TYPE   and funct = OROP ) else
				'0'&'0'&"01"&'0'&'1'&'0'&'1'&"00"&'0'&'0'&'0'&'0' when (opCode = R_TYPE   and funct = SLT  ) else
				
				'0'&'0'&"00"&'0'&'0'&'0'&'0'&"00"&'0'&'0'&'0'&'0';  
end architecture;