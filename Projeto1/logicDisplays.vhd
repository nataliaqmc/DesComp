library ieee;
use ieee.std_logic_1164.all;

entity logicDisplays is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8);
  port (
	 CLK: in std_logic;
	 CPU_EscritoRam: in std_logic_vector(7 downto 0);
	 HEX0 : out std_logic_vector(6 downto 0);
	 HEX1 : out std_logic_vector(6 downto 0);
	 HEX2 : out std_logic_vector(6 downto 0);
	 HEX3 : out std_logic_vector(6 downto 0);
	 HEX4 : out std_logic_vector(6 downto 0);
	 HEX5 : out std_logic_vector(6 downto 0);
	 HabilitaHEX: out std_logic_vector(5 downto 0);
	 Habilita_HEX0: in std_logic;
	 Habilita_HEX1: in std_logic;  
	 Habilita_HEX2: in std_logic;
	 Habilita_HEX3: in std_logic;
	 Habilita_HEX4: in std_logic;  
	 Habilita_HEX5: in std_logic
  );
end entity;

architecture comportamento of logicDisplays is
	signal OUT_HEX0: std_logic_vector(3 downto 0);
	signal OUT_HEX1: std_logic_vector(3 downto 0);
	signal OUT_HEX2: std_logic_vector(3 downto 0);
	signal OUT_HEX3: std_logic_vector(3 downto 0);
	signal OUT_HEX4: std_logic_vector(3 downto 0);
	signal OUT_HEX5: std_logic_vector(3 downto 0);

  begin
  
REG_HEX0: entity work.registradorGenerico  generic map (larguraDados => 4)
		port map(DIN =>CPU_EscritoRam(3 downto 0), DOUT => OUT_HEX0, ENABLE => Habilita_HEX0, CLK => CLK, RST=>'0');
		
REG_HEX1: entity work.registradorGenerico  generic map (larguraDados => 4)
		port map(DIN =>CPU_EscritoRam(3 downto 0), DOUT => OUT_HEX1, ENABLE => Habilita_HEX1, CLK => CLK, RST=>'0');
		
REG_HEX2: entity work.registradorGenerico  generic map (larguraDados => 4)
		port map(DIN =>CPU_EscritoRam(3 downto 0), DOUT => OUT_HEX2, ENABLE => Habilita_HEX2, CLK => CLK, RST=>'0');
		
REG_HEX3: entity work.registradorGenerico  generic map (larguraDados => 4)
		port map(DIN =>CPU_EscritoRam(3 downto 0), DOUT => OUT_HEX3, ENABLE => Habilita_HEX3, CLK => CLK, RST=>'0');
		
REG_HEX4: entity work.registradorGenerico  generic map (larguraDados => 4)
		port map(DIN =>CPU_EscritoRam(3 downto 0), DOUT => OUT_HEX4, ENABLE => Habilita_HEX4, CLK => CLK, RST=>'0');
		
REG_HEX5: entity work.registradorGenerico  generic map (larguraDados => 4)
		port map(DIN =>CPU_EscritoRam(3 downto 0), DOUT => OUT_HEX5, ENABLE => Habilita_HEX5, CLK => CLK, RST=>'0');
	

CONV_HEX0 :  entity work.conversorHex7Seg
        port map(dadoHex => OUT_HEX0,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX0);

CONV_HEX1 :  entity work.conversorHex7Seg
        port map(dadoHex => OUT_HEX1,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX1);

CONV_HEX2 :  entity work.conversorHex7Seg
        port map(dadoHex => OUT_HEX2,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX2);
					  

CONV_HEX3 :  entity work.conversorHex7Seg
        port map(dadoHex => OUT_HEX3,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX3);
					  
CONV_HEX4 :  entity work.conversorHex7Seg
        port map(dadoHex => OUT_HEX4,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX4);

CONV_HEX5 :  entity work.conversorHex7Seg
        port map(dadoHex => OUT_HEX5,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX5);

HabilitaHEX(0) <= Habilita_HEX0;
HabilitaHEX(1) <= Habilita_HEX1;
HabilitaHEX(2) <= Habilita_HEX2;
HabilitaHEX(3) <= Habilita_HEX3;
HabilitaHEX(4) <= Habilita_HEX4;
HabilitaHEX(5) <= Habilita_HEX5;
 
end architecture;