library ieee;
use ieee.std_logic_1164.all;

entity UC is
  port ( opCode : in std_logic_vector(5 downto 0);
         saida : out std_logic_vector(9 downto 0)
  );
end entity;

architecture comportamento of UC is
  constant SOMA  : std_logic_vector(5 downto 0) := 6x"20";
  constant SUB   : std_logic_vector(5 downto 0) := 6x"22";
  constant ANDOP : std_logic_vector(5 downto 0) := 6x"24";
  constant OROP  : std_logic_vector(5 downto 0) := 6x"25";
  constant SLT   : std_logic_vector(5 downto 0) := 6x"2a";
  
  constant LW    : std_logic_vector(5 downto 0) := 6x"23";
  constant SW    : std_logic_vector(5 downto 0) := 6x"2b";
  constant BEQ   : std_logic_vector(5 downto 0) := 6x"04";
  
  constant J 	  : std_logic_vector(5 downto 0) := 6x"02";
  
  constant R_TYPE: std_logic_vector(5 downto 0) := 6x"0";

  begin  -- mux mux hab mux ula  mux beq rd wr  
	saida <= '0'&'1'&'1'&'0'&"00"&'0'&'0'&"00" when (opCode = R_TYPE) else
				'0'&'0'&'1'&'1'&"01"&'1'&'0'&"10" when (opCode = LW)  else
				'0'&'0'&'0'&'1'&"10"&'0'&'0'&"01" when (opCode = SW)  else
				'0'&'0'&'0'&'0'&"11"&'0'&'1'&"00" when (opCode = BEQ) else
				'1'&'0'&'0'&'0'&"00"&'0'&'0'&"00" when (opCode = J)   else
				'0'&'0'&'0'&'0'&"10"&'0'&'0'&"00";  
end architecture;