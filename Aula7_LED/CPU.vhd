library ieee;
use ieee.std_logic_1164.all;

entity CPU is
  -- Total de bits das entradas e saidas
  generic (larguraDados : natural := 8;
			  larguraEnderecos : natural := 9;
			  larguraInstrucao : natural :=13;
			  simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(4 downto 0);
	 
	 Instruction_IN : in std_logic_vector(12 downto 0);
	 Data_IN : in std_logic_vector(7 downto 0);
	 Wr : out std_logic;
	 Rd : out std_logic;
	 Data_OUT : out std_logic_vector(7 downto 0);
	 Data_Address: out std_logic_vector(8 downto 0);
	 ROM_Address : out std_logic_vector(8 downto 0)
	 
  );
end entity;


architecture arquitetura of CPU is
	
  signal romAddress : std_logic_vector(8 downto 0);
  signal Control : std_logic_vector(3 downto 0);
  signal dataOut : std_logic_vector(7 downto 0);
  signal Sinais_Controle : std_logic_vector(11 downto 0);
  signal Mux_Out : std_logic_vector(7 downto 0);
  signal Saida_ULA : std_logic_vector(7 downto 0);
  signal proxPC : std_logic_vector(8 downto 0);
  signal saidaEndRet : std_logic_vector(8 downto 0);
  signal saidaMUXDestino : std_logic_vector(8 downto 0);
  signal seletorMUXDestino : std_logic_vector(1 downto 0);
  signal entradaFlag : std_logic;
  signal saidaFlag : std_logic;
  signal CLK : std_logic;

begin

-- Para simular, fica mais simples tirar o edgeDetector
gravar:  if simulacao generate
Control(3) <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => Control(3));
end generate;
-- O port map completo do MUX.
MUX1 :  entity work.muxGenerico2x1  generic map (larguraDados => larguraDados)
        port map( entradaA_MUX => dataOut,
						entradaB_MUX =>  Instruction_IN (7 downto 0),
						seletor_MUX => Sinais_Controle(6),
						saida_MUX => Mux_Out);
					  
MUX2 :  entity work.muxGenerico4x1  generic map (larguraDados => larguraEnderecos)
        port map( entradaA_MUX => proxPC,
						entradaB_MUX =>  Instruction_IN (8 downto 0),
						entradaC_MUX => saidaEndRet,
						seletor_MUX => seletorMUXDestino,
						saida_MUX => saidaMUXDestino);

-- O port map completo do Acumulador.
REGA : entity work.registradorGenerico   generic map (larguraDados => larguraDados)
          port map (DIN => Saida_ULA,
						  DOUT => dataOut,
						  ENABLE => Sinais_Controle(5),
						  CLK => Control(3),
						  RST => '0'); 
			 --RST sempre desligado;

-- O port map completo do End. Retorno.
ENDRET : entity work.registradorGenerico   generic map (larguraDados => larguraEnderecos)
          port map (DIN => proxPC,
						  DOUT => saidaEndRet,
						  ENABLE => Sinais_Controle(11),
						  CLK => Control(3),
						  RST => '0'); 
			 --RST sempre desligado;	
	
FLAG: entity work.FlipFlop
          port map (DIN => entradaFlag, 
						  DOUT => saidaFlag, 
						  ENABLE => Sinais_Controle(2),
						  CLK => Control(3), 
						  RST => '0');
																										
-- O port map completo do Program Counter.
PC : entity work.registradorGenerico   generic map (larguraDados => larguraEnderecos)
          port map (DIN => saidaMUXDestino,
						  DOUT => romAddress,
						  ENABLE => '1',
						  CLK => Control(3),
						  RST => '0');

incrementaPC :  entity work.somaConstante  generic map (larguraDados => larguraEnderecos, constante => 1)
        port map( entrada => romAddress,
						saida => proxPC);


-- O port map completo da ULA:
ULA1 : entity work.ULASomaSub  generic map(larguraDados => larguraDados)
          port map (entradaA => Data_IN, 
						  entradaB => Mux_Out, 
						  saida => Saida_ULA, 
						  seletor => Sinais_Controle(4 downto 3),
						  entradaFlag => entradaFlag);

-- Falta acertar o conteudo da ROM (no arquivo memoriaROM.vhd)

			 
DECODER : entity work.decoderInstru  
          port map (opcode => Instruction_IN (12 downto 9),
						  saida => Sinais_Controle);


							
logicaDesvio: entity work.logicaDesvio
			port map (Flag => saidaFlag,
						 JMP => Sinais_Controle(10),
						 JEQ => Sinais_Controle(7),
						 JSR => Sinais_Controle(8),
						 RET => Sinais_Controle(9),
						 saida => seletorMUXDestino);

							

Rd <= Sinais_Controle(1); 
Wr <= Sinais_Controle(0);
ROM_Address <= romAddress;
Data_OUT <= dataOut;
Data_Address <= ROM_Address;

end architecture;