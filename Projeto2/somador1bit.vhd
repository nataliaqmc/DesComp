library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;          -- Biblioteca IEEE para funções aritméticas

entity somador1bit is
    port
    (
        entradaA, entradaB: in std_logic;
		  carryIn: in std_logic;
		  carryOut: out std_logic;
        saida:  out std_logic
    );
end entity;

architecture comportamento of somador1bit is
    begin
        saida <= (entradaA xor entradaB) xor carryIn;
		  carryOut <= (entradaA and entradaB) or ((entradaA xor entradaB)and carryIn);
end architecture;