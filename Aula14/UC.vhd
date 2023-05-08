library ieee;
use ieee.std_logic_1164.all;

entity UC is
  port ( opcode : in std_logic_vector(5 downto 0);
         saida : out std_logic_vector(5 downto 0)
  );
end entity;

architecture comportamento of UC is

  constant NOP  : std_logic_vector(2 downto 0) := "000";
  
  begin
saida <= 
         "000000";  -- NOP para os opcodes Indefinidos
end architecture;