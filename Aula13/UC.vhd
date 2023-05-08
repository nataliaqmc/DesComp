library ieee;
use ieee.std_logic_1164.all;

entity UC is
  -- Total de bits das entradas e saidas
  port (
			funct: in std_logic_vector(5 downto 0);
			saida: out std_logic_vector(7 downto 0)
	 
  );
  
end entity;


architecture arquitetura of UC is

	constant add  : std_logic_vector(5 downto 0) := "100000";
	constant andd  : std_logic_vector(5 downto 0) := "100100";
	constant orr   : std_logic_vector(5 downto 0) := "100101";
	constant slt   : std_logic_vector(5 downto 0) := "101010";
	constant sub   : std_logic_vector(5 downto 0) := "100010";
	
begin
	saida <= "10001100" when funct = add else
				"01010100" when funct = sub else
				"01100100" when funct = slt else
				"00000000";

end architecture;