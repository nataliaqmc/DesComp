library ieee;
use ieee.std_logic_1164.all;

entity Projeto2 is
  -- Total de bits das entradas e saidas
  generic (larguraDados : natural := 32;
			  larguraEnderecos : natural := 32;
			  larguraInstrucao : natural := 32;
			  simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    PC: out std_logic_vector(larguraEnderecos-1 downto 0);
	 KEY: in std_logic_vector(3 downto 0);
	 
	 EntradaA_ULA : out std_logic_vector (larguraDados-1 downto 0);
	 EntradaB_ULA : out std_logic_vector (larguraDados-1 downto 0);
	 Saida_ULA_leitura	 : out std_logic_vector (larguraDados-1 downto 0);
	 LeituraFlagEQ : out std_logic;
	 EscritaRAM : out std_logic_vector (larguraDados-1 downto 0);
	 LeituraRAM : out std_logic_vector (larguraDados-1 downto 0)
  );
end entity;


architecture arquitetura of Projeto2 is
	-- Clock:
	signal CLK : std_logic;
	
	-- Program Counter (PC):
	signal PC_IN: std_logic_vector(31 downto 0);
	signal PC_OUT: std_logic_vector(31 downto 0);
	signal saidaIncrementaPC : std_logic_vector (31 downto 0);
	signal proxPC : std_logic_vector (31 downto 0);
	
	-- ROM:
	signal EnderecoROM : std_logic_vector (31 downto 0);
	signal dadoROM : std_logic_vector(31 downto 0);
	
	-- Banco de Registradores:
	signal Rs: std_logic_vector(4 downto 0);
	signal Rt: std_logic_vector(4 downto 0);
	signal Rd: std_logic_vector(4 downto 0);
	signal Rs_out: std_logic_vector(31 downto 0);
	signal Rt_out: std_logic_vector(31 downto 0);
	
	-- ULA:
	signal ULA_A: std_logic_vector(31 downto 0);
	signal ULA_B: std_logic_vector(31 downto 0);
	signal Saida_ULA : std_logic_vector (31 downto 0);
	signal flagULA : std_logic;
	
	-- Estende sinal:
	signal imediato: std_logic_vector(15 downto 0);
	signal saidaExtensor : std_logic_vector (31 downto 0);
	
	-- Unidade de controle (UC):
	signal opCode : std_logic_vector (5 downto 0);
	signal funct : std_logic_vector (5 downto 0);
	signal destino: std_logic_vector (25 downto 0);
	signal habMUX_RtRd: std_logic;
	signal habEscritaReg: std_logic;
	signal habMUX_RtIm: std_logic;
	signal ctrlULA: std_logic_vector(3 downto 0);
	signal habMUX_ULA: std_logic;
	signal BEQ: std_logic;
	signal habLeituraMem: std_logic;
	signal habEscritaMem: std_logic; 
	signal controle: std_logic_vector(11 downto 0);
	signal Flag_BEQ: std_logic;
		
	--RAM:
	signal saidaRAM :  std_logic_vector (31 downto 0);
	signal saidaShifter :  std_logic_vector (31 downto 0);
	signal saidaSomador : std_logic_vector (31 downto 0);
	signal enderecoJ : std_logic_vector (31 downto 0);

	-- Saida dos MUXs:
	signal mux_RtRd_out : std_logic_vector (4 downto 0);
	signal mux_RtIm_out : std_logic_vector (31 downto 0);
	signal mux_ULA_out  : std_logic_vector (31 downto 0);
	signal mux_ImPC_out : std_logic_vector (31 downto 0);

  
begin

-- Instanciando os componentes:

-- Para simular, fica mais simples tirar o edgeDetector
gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50,
						entrada => (not KEY(0)),	
						saida => CLK);
end generate;



-- Program Counter:				
PCounter : entity work.registradorGenerico  generic map (larguraDados => larguraEnderecos)
          port map (DIN => PC_IN,
						  DOUT => PC_OUT, 
						  ENABLE => '1',
						  CLK => CLK, 
						  RST => '0');

			 
incrementaPC :  entity work.somaConstante  generic map (larguraDados => larguraEnderecos, constante => 4)
          port map (entrada => PC_OUT,
						  saida => saidaIncrementaPC);

-- Memória de instruções ROM MIPS:		  
ROM : entity work.ROMMIPS   generic map (dataWidth => larguraInstrucao, addrWidth => larguraEnderecos)
          port map (Endereco => EnderecoROM,
						  Dado => dadoROM);
			 

-- Definindo os Muxs:
MUX_REG_IN : entity work.muxGenerico2x1		generic map	(larguraDados => 5)
			 port map (entradaA_MUX => Rt,
						  entradaB_MUX => Rd,
						  seletor_MUX => habMUX_RtRd,
						  saida_MUX => mux_RtRd_out);

MUX_REG_OUT : entity work.muxGenerico2x1  generic map (larguraDados => 32)
			 port map (entradaA_MUX => Rt_out, 
						  entradaB_MUX => saidaExtensor,
						  seletor_MUX => habMUX_RtIm,
						  saida_MUX => mux_RtIm_out);

MUX_ULA : entity work.muxGenerico2x1  generic map (larguraDados => 32)
			 port map (entradaA_MUX => Saida_ULA,
						  entradaB_MUX => saidaRAM, 
						  seletor_MUX  => habMUX_ULA,
						  saida_MUX    => mux_ULA_out);
							
MUX_PC : entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => saidaIncrementaPC,
						  entradaB_MUX => saidaSomador,
						  seletor_MUX => Flag_BEQ,
						  saida_MUX => mux_ImPC_out);
MUX_PC_BEQ_JMP : entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => mux_ImPC_out,
						  entradaB_MUX => enderecoJ, 
						  seletor_MUX => Flag_BEQ, 
						  saida_MUX => proxPC);
	
-- Banco com 32 registradores:
BANCO_REGISTRADORES : entity work.bancoReg generic map (larguraDados => larguraDados, larguraEndBancoRegs => 5)
			port map ( clk   	=> CLK,
						  enderecoA => Rs,
						  enderecoB => Rt,
						  enderecoC => mux_RtRd_out,
						  dadoEscritaC  => mux_ULA_out,
						  escreveC => habEscritaReg,
						  saidaA   => Rs_out,
						  saidaB   => Rt_out);
					  
-- ULA:	
ULA : entity work.ULA  generic map(larguraDados => larguraDados)
          port map (entradaA => Rs_out,
						  entradaB => mux_RtIm_out,
						  saida => Saida_ULA, 
						  flagEQ => flagULA,
						  seletor => ctrlULA);

							
-- Unidade de Controle do Fluxo de dados:			 
UC : entity work.UC  
          port map (opCode => opCode,
						  funct => funct,
						  saida => controle);
			 
-- Estende o imediato:			 
EXTENSOR_SINAL : entity work.estendeSinalGenerico generic map(larguraDadoEntrada => 16, larguraDadoSaida => 32)
			 port map (estendeSinal_IN => imediato,
						  estendeSinal_OUT => saidaExtensor);
	
-- Desloca o imediato estendido:	
SHIFTER : entity work.deslocadorGenerico generic map(larguraDado => 32)
			 port map (shifter_IN => saidaExtensor,
						  shifter_OUT => saidaShifter);
					
-- Soma o endereço com a saída do shifter:							
SOMADOR: entity work.somadorGenerico generic map (	larguraDados => 32)
			 port map (entradaA => saidaIncrementaPC,
						  entradaB => saidaShifter,
						  saida => saidaSomador);



-- Memória de dados RAM MIPS:	
RAM : entity work.RAMMIPS generic map(dataWidth => 32, addrWidth => 32, memoryAddrWidth => 6)
			 port map (clk      => CLK,
						  Endereco => Saida_ULA,
						  Dado_in  => Rt_out,
						  Dado_out => saidaRAM,
						  we       => habEscritaMem,
						  re       => habLeituraMem,
						  habilita => '1');

-- Definindo os valores das instruções:
opCode   <= dadoROM (31 downto 26);
Rs       <= dadoROM (25 downto 21);
Rt       <= dadoROM (20 downto 16);
Rd       <= dadoROM (15 downto 11);
imediato <= dadoROM (15 downto 0);
funct    <= dadoROM (5 downto 0);
destino  <= dadoROM (25 downto 0);
 
-- Saída da unidade de controle:
habMUX_RtRd   <= controle(10);
habEscritaReg     <= controle(9);
habMUX_RtIm <= controle(8);
ctrlULA  		<= controle(7 downto 4);
habMUX_ULA <= controle(3);
BEQ       <= controle(2);
habLeituraMem		<= controle(1);
habEscritaMem<= controle(0);

-- Definindo o "AND":
Flag_BEQ <= BEQ and flagULA;
enderecoJ <= saidaIncrementaPC(31 downto 28) & destino & "00";
EnderecoROM <= PC_OUT;				
PC <= EnderecoROM;

Saida_ULA_leitura	<=Saida_ULA;

EntradaA_ULA <= Rs_out;
EntradaB_ULA <= mux_RtIm_out;
EscritaRAM <= Rt_out;
LeituraRAM <= saidaRAM;
LeituraFlagEQ <= flagULA;

end architecture;