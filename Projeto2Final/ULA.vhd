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
		inverteB,inverteA: std_logic;
		seletor:  in STD_LOGIC_VECTOR(1 downto 0);
      saida:    out STD_LOGIC_VECTOR((larguraDados-1) downto 0);
		flagEQ:   out STD_LOGIC
    );
end entity;

architecture comportamento of ULA is
  --constant zero : std_logic_vector(larguraDados-1 downto 0) := (others => '0');
	signal carryOut0: std_logic;
	signal carryOut1: std_logic;
	signal carryOut2: std_logic;
	signal carryOut3: std_logic;
	signal carryOut4: std_logic;
	signal carryOut5: std_logic;
	signal carryOut6: std_logic;
	signal carryOut7: std_logic;
	signal carryOut8: std_logic;
	signal carryOut9: std_logic;
	signal carryOut10: std_logic;
	signal carryOut11: std_logic;
	signal carryOut12: std_logic;
	signal carryOut13: std_logic;
	signal carryOut14: std_logic;
	signal carryOut15: std_logic;
	signal carryOut16: std_logic;
	signal carryOut17: std_logic;
	signal carryOut18: std_logic;
	signal carryOut19: std_logic;
	signal carryOut20: std_logic;
	signal carryOut21: std_logic;
	signal carryOut22: std_logic;
	signal carryOut23: std_logic;
	signal carryOut24: std_logic;
	signal carryOut25: std_logic;
	signal carryOut26: std_logic;
	signal carryOut27: std_logic;
	signal carryOut28: std_logic;
	signal carryOut29: std_logic;
	signal carryOut30: std_logic;
	signal carryOut31: std_logic;
	
	signal SLT_inverte: std_logic;
	signal somadorBit31: std_logic;

   signal ADD  : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal SUB  : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal ANDOP: STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal OROP : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal SLT  : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal LW   : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal SW   : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal BEQ  : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   begin
	

bit0: entity work.ULA1bit
	port map( entradaA => entradaA(0),entradaB => entradaB(0),slt => (carryOut30 xor carryOut31) xor somadorBit31,inverteA =>inverteA, inverteB => inverteB,carryIn => inverteB,seletor => seletor,carryOut=> carryOut0,saida => saida(0));
bit1: entity work.ULA1bit
	port map( entradaA => entradaA(1),entradaB => entradaB(1),slt => '0',inverteA => inverteA, inverteB => inverteB,carryIn => carryOut0,seletor => seletor,carryOut=> carryOut1,saida => saida(1));
bit2: entity work.ULA1bit
	port map( entradaA => entradaA(2),entradaB => entradaB(2),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut1,seletor => seletor,carryOut=> carryOut2,saida => saida(2));
bit3: entity work.ULA1bit
	port map( entradaA => entradaA(3),entradaB => entradaB(3),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut2,seletor => seletor,carryOut=> carryOut3,saida => saida(3));
bit4: entity work.ULA1bit
	port map( entradaA => entradaA(4),entradaB => entradaB(4),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut3,seletor => seletor,carryOut=> carryOut4,saida => saida(4));
bit5: entity work.ULA1bit
	port map( entradaA => entradaA(5),entradaB => entradaB(5),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut4,seletor => seletor,carryOut=> carryOut5,saida => saida(5));
bit6: entity work.ULA1bit
	port map( entradaA => entradaA(6),entradaB => entradaB(6),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut5,seletor => seletor,carryOut=> carryOut6,saida => saida(6));
bit7: entity work.ULA1bit
	port map( entradaA => entradaA(7),entradaB => entradaB(7),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut6,seletor => seletor,carryOut=> carryOut7,saida => saida(7));
bit8: entity work.ULA1bit
	port map( entradaA => entradaA(8),entradaB => entradaB(8),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut7,seletor => seletor,carryOut=> carryOut8,saida => saida(8));
bit9: entity work.ULA1bit
	port map( entradaA => entradaA(9),entradaB => entradaB(9),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut8,seletor => seletor,carryOut=> carryOut9,saida => saida(9));
bit10: entity work.ULA1bit
	port map( entradaA => entradaA(10),entradaB => entradaB(10),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut9,seletor => seletor,carryOut=> carryOut10,saida => saida(10));
bit11: entity work.ULA1bit
	port map( entradaA => entradaA(11),entradaB => entradaB(11),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut10,seletor => seletor,carryOut=> carryOut11,saida => saida(11));
bit12: entity work.ULA1bit
	port map( entradaA => entradaA(12),entradaB => entradaB(12),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut11,seletor => seletor,carryOut=> carryOut12,saida => saida(12));
bit13: entity work.ULA1bit
	port map( entradaA => entradaA(13),entradaB => entradaB(13),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut12,seletor => seletor,carryOut=> carryOut13,saida => saida(13));
bit14: entity work.ULA1bit
	port map( entradaA => entradaA(14),entradaB => entradaB(14),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut13,seletor => seletor,carryOut=> carryOut14,saida => saida(14));
bit15: entity work.ULA1bit
	port map( entradaA => entradaA(15),entradaB => entradaB(15),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut14,seletor => seletor,carryOut=> carryOut15,saida => saida(15));
bit16: entity work.ULA1bit
	port map( entradaA => entradaA(16),entradaB => entradaB(16),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut15,seletor => seletor,carryOut=> carryOut16,saida => saida(16));
bit17: entity work.ULA1bit
	port map( entradaA => entradaA(17),entradaB => entradaB(17),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut16,seletor => seletor,carryOut=> carryOut17,saida => saida(17));
bit18: entity work.ULA1bit
	port map( entradaA => entradaA(18),entradaB => entradaB(18),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut17,seletor => seletor,carryOut=> carryOut18,saida => saida(18));
bit19: entity work.ULA1bit
	port map( entradaA => entradaA(19),entradaB => entradaB(19),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut18,seletor => seletor,carryOut=> carryOut19,saida => saida(19));
bit20: entity work.ULA1bit
	port map( entradaA => entradaA(20),entradaB => entradaB(20),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut19,seletor => seletor,carryOut=> carryOut20,saida => saida(20));
bit21: entity work.ULA1bit
	port map( entradaA => entradaA(21),entradaB => entradaB(21),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut20,seletor => seletor,carryOut=> carryOut21,saida => saida(21));
bit22: entity work.ULA1bit
	port map( entradaA => entradaA(22),entradaB => entradaB(22),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut21,seletor => seletor,carryOut=> carryOut22,saida => saida(22));
bit23: entity work.ULA1bit
	port map( entradaA => entradaA(23),entradaB => entradaB(23),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut22,seletor => seletor,carryOut=> carryOut23,saida => saida(23));
bit24: entity work.ULA1bit
	port map( entradaA => entradaA(24),entradaB => entradaB(24),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut23,seletor => seletor,carryOut=> carryOut24,saida => saida(24));
bit25: entity work.ULA1bit
	port map( entradaA => entradaA(25),entradaB => entradaB(25),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut24,seletor => seletor,carryOut=> carryOut25,saida => saida(25));
bit26: entity work.ULA1bit
	port map( entradaA => entradaA(26),entradaB => entradaB(26),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut25,seletor => seletor,carryOut=> carryOut26,saida => saida(26));
bit27: entity work.ULA1bit
	port map( entradaA => entradaA(27),entradaB => entradaB(27),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut26,seletor => seletor,carryOut=> carryOut27,saida => saida(27));
bit28: entity work.ULA1bit
	port map( entradaA => entradaA(28),entradaB => entradaB(28),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut27,seletor => seletor,carryOut=> carryOut28,saida => saida(28));
bit29: entity work.ULA1bit
	port map( entradaA => entradaA(29),entradaB => entradaB(29),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut28,seletor => seletor,carryOut=> carryOut29,saida => saida(29));
bit30: entity work.ULA1bit
	port map( entradaA => entradaA(30),entradaB => entradaB(30),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut29,seletor => seletor,carryOut=> carryOut30,saida => saida(30));
bit31: entity work.ULAbit31
	port map( entradaA => entradaA(31),entradaB => entradaB(31),slt => '0',inverteA => inverteA,inverteB => inverteB,carryIn => carryOut30,seletor => seletor,Overflow=> carryOut31,saida => saida(31));

SLT_inverte <= not entradaB(31) when inverteB = '1' else entradaB(31);
somadorBit31 <= carryOut30 xor (entradaA(31) xor SLT_inverte); 
 	
	
flagEQ <= '1' when saida = x"00000000" else '0';		


end architecture;