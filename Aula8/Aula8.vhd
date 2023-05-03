library ieee;
use ieee.std_logic_1164.all;

entity Aula8 is
  -- Total de bits das entradas e saidas
  generic (larguraDados : natural := 8;
			  larguraEnderecos : natural := 9;
			  larguraInstrucao : natural := 13;
        simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
	 DataAddress : out std_logic_vector(8 downto 0);
	 endereco : out std_logic_vector(5 downto 0);
	 LED : out std_logic_vector(9 downto 0)
  );
end entity;


architecture arquitetura of Aula8 is

-- Faltam alguns sinais:
  --signal chavesX_ULA_B : std_logic_vector (larguraDados-1 downto 0);
  signal CLK : std_logic;
  signal Habilita_RAM : std_logic;
  signal Wr : std_logic;
  signal Rd : std_logic;
  signal Instruction_IN : std_logic_vector(12 downto 0);
  signal Data_OUT : std_logic_vector(7 downto 0);
  signal Data_IN : std_logic_vector(7 downto 0);
  signal ROM_Address : std_logic_vector(8 downto 0);
  signal Data_Address : std_logic_vector(8 downto 0);
  signal saidaDecoder1 : std_logic_vector(7 downto 0);
  signal saidaDecoder2 : std_logic_vector(7 downto 0);
  signal bloco4 : std_logic;
  signal leds : std_logic_vector(9 downto 0);
  
  
  
begin

-- Instanciando os componentes:

-- Para simular, fica mais simples tirar o edgeDetector
gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK);
end generate;
CPU : entity work.CPU generic map (larguraDados => 8, larguraEnderecos => 9, larguraInstrucao =>13)
		port map(CLOCK_50 => CLK,
					KEY => KEY,
					Instruction_IN =>Instruction_IN,
					Wr => Wr,
					Rd => Rd,
					Data_Address => Data_Address,
					ROM_Address => ROM_Address,
					Data_Out => Data_OUT,
					Data_IN =>Data_IN);
					
ROM1 : entity work.memoriaROM   generic map (dataWidth => larguraInstrucao, addrWidth => larguraEnderecos)
          port map (ROM_Address => ROM_Address,
						  Instruction_IN => Instruction_IN);
						  
RAM1 : entity work.memoriaRAM  generic map(dataWidth => larguraDados, addrWidth => 6)
			 port map ( Data_Address => Instruction_IN (5 downto 0),
							wr => Wr,
							rd => Rd, 
							Habilita_RAM => Habilita_RAM,
							clk => CLK, 
							Data_OUT => Data_OUT,
							Data_IN => Data_IN);
							
DECODER1: entity work.decoder3x8
				port map( entrada => Data_Address(8 downto 6),
							 saida => saidaDecoder1);
							 
							 
DECODER2: entity work.decoder3x8
				port map( entrada => Data_Address(2 downto 0),
							 saida => saidaDecoder2);							 
							 
LED_LOG : entity work.logicaLED 
				port map (CLK => CLK,
							 Data_OUT => Data_OUT,
							 Wr => Wr,
							 saidaDecoder2 => saidaDecoder2,
							 bloco4 => bloco4,
							 saida => leds);
							 
Habilita_RAM <= saidaDecoder1(0);
bloco4 <= saidaDecoder1(4);

LED(9 downto 0) <= leds;

DataAddress <= Data_Address;
endereco <= Instruction_IN (5 downto 0);
end architecture;