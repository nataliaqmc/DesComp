library ieee;
use ieee.std_logic_1164.all;

entity Aula15 is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 32;
        larguraEnderecos : natural := 32;
		  larguraInstrucao : natural := 32;
        simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    PC_OUT: out std_logic_vector(larguraEnderecos-1 downto 0);
	 KEY: in std_logic_vector(3 downto 0);
	 
	 EntradaA_ULA : out std_logic_vector (larguraDados-1 downto 0);
	 EntradaB_ULA : out std_logic_vector (larguraDados-1 downto 0);
	 Saida_ULA_leitura	 : out std_logic_vector (larguraDados-1 downto 0);
	 LeituraFlagEQ : out std_logic;
	 EscritaRAM : out std_logic_vector (larguraDados-1 downto 0);
	 LeituraRAM : out std_logic_vector (larguraDados-1 downto 0)
  );
end entity;


architecture arquitetura of Aula15 is

  signal CLK : std_logic;
  signal EnderecoROM : std_logic_vector (larguraEnderecos-1 downto 0);
  signal saidaIncrementaPC : std_logic_vector (larguraEnderecos-1 downto 0);
  signal proxPC : std_logic_vector (larguraEnderecos-1 downto 0);
  
  signal Saida_ULA : std_logic_vector (larguraDados-1 downto 0);
  signal flagEQ : std_logic;
  signal saidaExtensor : std_logic_vector (larguraDados-1 downto 0);
  signal saidaRAM :  std_logic_vector (larguraDados-1 downto 0);
  signal saidaShifter :  std_logic_vector (larguraDados-1 downto 0);
  signal saidaSomador : std_logic_vector (larguraDados-1 downto 0);
  signal concatenaImediatoJPC : std_logic_vector (larguraDados-1 downto 0);
  
  signal saidaMuxRtRd : std_logic_vector (4 downto 0);
  signal saidaMuxRtImediato : std_logic_vector (larguraDados-1 downto 0);
  signal saidaMuxULARAM : std_logic_vector (larguraDados-1 downto 0);
  signal saidaMuxImediatoPC : std_logic_vector (larguraEnderecos-1 downto 0);
  
  
  signal Rs_OUT : std_logic_vector (larguraDados-1 downto 0);
  signal Rt_OUT : std_logic_vector (larguraDados-1 downto 0);
 
  
  signal formato_Instrucao : std_logic_vector (larguraInstrucao-1 downto 0);
  --Instrucao
  signal opCode : std_logic_vector (5 downto 0);
  signal Rs_IN : std_logic_vector (4 downto 0);
  signal Rt_IN : std_logic_vector (4 downto 0);
  signal Rd_IN : std_logic_vector (4 downto 0);
  signal imediato: std_logic_vector(15 downto 0);
  signal imediatoJ : std_logic_vector(25 downto 0); 
  signal funct : std_logic_vector (5 downto 0);
  
  signal controle: std_logic_vector(11 downto 0);
  --controle
  signal muxPC_BEQ_JMP : std_logic;
  signal muxControleRtRd : std_logic;
  signal habEscritaReg : std_logic;
  signal muxControleRtImediato : std_logic;
  signal Operacao_ULA : std_logic_vector(2 downto 0);
  signal muxControleULARAM : std_logic;	
  signal habilitaBEQ : std_logic;
  signal habilitaRAM : std_logic;
  signal habLeituraRAM: std_logic;
  signal habilitaEscritaRAM: std_logic;
  
  signal PCSelectorMUX : std_logic;
  
begin

-- Instanciando os componentes:

-- Para simular, fica mais simples tirar o edgeDetector
gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK);
end generate;

-- Manipulando a instrucao
opCode    <= formato_Instrucao (31 downto 26);
Rs_IN     <= formato_Instrucao (25 downto 21);
Rt_IN     <= formato_Instrucao (20 downto 16);
Rd_IN     <= formato_Instrucao (15 downto 11);
imediatoJ <= formato_Instrucao (25 downto 0); 
imediato  <= formato_Instrucao (15 downto 0);
funct     <= formato_Instrucao (5 downto 0);
		
-- Pontos de controle
muxPC_BEQ_JMP     <= controle(11);
muxControleRtRd   <= controle(10);
habEscritaReg     <= controle(9);
muxControleRtImediato <= controle(8);
Operacao_ULA  		<= controle(7 downto 5);
muxControleULARAM <= controle(4);
habilitaBEQ       <= controle(3);
habilitaRAM			<= controle(2);
habLeituraRAM		<= controle(1);
habilitaEscritaRAM<= controle(0);

PCSelectorMUX <= habilitaBEQ and flagEQ;
concatenaImediatoJPC <= saidaIncrementaPC(31 downto 28) & imediatoJ & "00";
																								
PC : entity work.registradorGenerico   generic map (larguraDados => larguraEnderecos)
          port map (DIN => proxPC, DOUT => EnderecoROM, ENABLE => '1', CLK => CLK, RST => '0');

			 
incrementaPC :  entity work.somaConstante  generic map (larguraDados => larguraEnderecos, constante => 4)
        port map( entrada => EnderecoROM, saida => saidaIncrementaPC);


ROM : entity work.ROMMIPS   generic map (dataWidth => larguraInstrucao, addrWidth => larguraEnderecos)
          port map (Endereco => EnderecoROM, Dado => formato_Instrucao);
			 
	
MUX_RT_RD : entity work.muxGenerico2x1		generic map	(larguraDados => 5)
			 port map (entradaA_MUX => Rt_IN, entradaB_MUX => Rd_IN, seletor_MUX => muxControleRtRd,
							saida_MUX => saidaMuxRtRd);
	
BANCO_REGISTRADORES : entity work.bancoReg generic map (larguraDados => larguraDados, larguraEndBancoRegs => 5)
			port map (clk   	=> CLK,
					  enderecoA => Rs_IN,
					  enderecoB => Rt_IN,
					  enderecoC => saidaMuxRtRd,
					  dadoEscritaC  => saidaMuxULARAM,
					  escreveC => habEscritaReg,
					  saidaA   => Rs_OUT,
					  saidaB   => Rt_OUT);
					  
MUX_RT_IMEDIATO : entity work.muxGenerico2x1  generic map (larguraDados => 32)
			 port map (entradaA_MUX => Rt_OUT, entradaB_MUX => saidaExtensor, seletor_MUX => muxControleRtImediato,
							saida_MUX => saidaMuxRtImediato);
	
ULA : entity work.ULA  generic map(larguraDados => larguraDados)
          port map (entradaA => Rs_OUT, entradaB => saidaMuxRtImediato, saida => Saida_ULA, flagEQ => flagEQ,
							seletor => Operacao_ULA);

MUX_ULA_RAM : entity work.muxGenerico2x1  generic map (larguraDados => 32)
			 port map (entradaA_MUX => Saida_ULA, entradaB_MUX => saidaRAM, seletor_MUX => muxControleULARAM,
							saida_MUX => saidaMuxULARAM);
							
			 
UNIDADE_CONTROLE : entity work.unidadeControle  
          port map (opCode => opCode, funct => funct, saida => controle);
			 
			 
EXTENSOR_SINAL : entity work.estendeSinalGenerico generic map(larguraDadoEntrada => 16, larguraDadoSaida => 32)
			 port map (estendeSinal_IN => imediato,
							estendeSinal_OUT => saidaExtensor);
							
SHIFTER : entity work.shifter generic map(larguraDado => 32)
			 port map (shifter_IN => saidaExtensor,
							shifter_OUT => saidaShifter);
					
							
SOMADOR: entity work.somadorGenerico generic map (	larguraDados => 32)
			 port map (entradaA => saidaIncrementaPC, entradaB => saidaShifter, saida => saidaSomador);

MUXPC : entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => saidaIncrementaPC, entradaB_MUX => saidaSomador, seletor_MUX => PCSelectorMUX,
							saida_MUX => saidaMuxImediatoPC);

MUX_PC_BEQ_JMP : entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => saidaMuxImediatoPC, entradaB_MUX => concatenaImediatoJPC, 
			 seletor_MUX => muxPC_BEQ_JMP, saida_MUX => proxPC);
							
RAM : entity work.RAMMIPS generic map(dataWidth => 32, addrWidth => 32, memoryAddrWidth => 6)
			 port map (clk      => CLK,
						  Endereco => Saida_ULA,
						  Dado_in  => Rt_OUT,
						  Dado_out => saidaRAM,
						  we       => habilitaEscritaRAM,
						  re       => habLeituraRAM,
						  habilita => habilitaRAM
					    );


PC_OUT <= EnderecoROM;
Saida_ULA_leitura	<=Saida_ULA;

EntradaA_ULA <= Rs_OUT;
EntradaB_ULA <= saidaMuxRtImediato;
EscritaRAM <= Rt_OUT;
LeituraRAM <= saidaRAM;
LeituraFlagEQ <= flagEQ;

end architecture;