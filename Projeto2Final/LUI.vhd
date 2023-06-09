library ieee;
use ieee.std_logic_1164.all;

entity LUI is
  port ( entrada : in std_logic_vector(15 downto 0);
         saida : out std_logic_vector(31 downto 0)
  );
end entity;

architecture comportamento of LUI is
  
			
  begin  -- mux mux mux  oa  hab mux  R  mux  beq bne rd  wr  
	saida <= entrada & "0000000000000000";
end architecture;