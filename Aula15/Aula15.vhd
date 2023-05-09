library ieee;
use ieee.std_logic_1164.all;

entity Aula15 is
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
	 
	 ULA_A_in : out std_logic_vector (larguraDados-1 downto 0);
	 ULA_B_in : out std_logic_vector (larguraDados-1 downto 0);
	 ULA_out	 : out std_logic_vector (larguraDados-1 downto 0);
	 Flag_ULA : out std_logic;
	 Escrita_RAM : out std_logic_vector (larguraDados-1 downto 0);
	 Leitura_RAM : out std_logic_vector (larguraDados-1 downto 0)
  );
end entity;


architecture arquitetura of Aula15 is
	-- Clock:
	signal CLK : std_logic;
	
	-- Program Counter (PC):
	signal PC_IN: std_logic_vector(31 downto 0);                 -- Entrada do PC
	signal PC_OUT: std_logic_vector(31 downto 0);                -- Saída do PC
	signal saidaIncrementaPC : std_logic_vector (31 downto 0);   -- Saída do contador do PC
	
	-- ROM:
	signal EnderecoROM : std_logic_vector (31 downto 0);         -- Entrada da ROM
	signal dadoROM : std_logic_vector(31 downto 0);              -- Saída da ROM
	
	-- Banco de Registradores:
	signal Rs: std_logic_vector(4 downto 0);							 -- Instrução(25 ~ 21)
	signal Rt: std_logic_vector(4 downto 0);							 -- Instrução(20 ~ 16)
	signal Rd: std_logic_vector(4 downto 0);							 -- Instrução(15 ~ 11)
	signal Rs_out: std_logic_vector(31 downto 0);                -- Saída banco de registradores 1 (Rs)
	signal Rt_out: std_logic_vector(31 downto 0);                -- Saída banco de registradores 2 (Rt)
	
	-- ULA:
	signal ULA_A: std_logic_vector(31 downto 0);                 -- Entrada A da ULA
	signal ULA_B: std_logic_vector(31 downto 0);                 -- Entrada B da ULA
	signal Saida_ULA : std_logic_vector (31 downto 0);           -- Saída da ULA
	signal flagULA : std_logic;											 -- Flag de igual da ULA
	
	-- Estende sinal:
	signal imediato: std_logic_vector(15 downto 0);              -- Entrada do extensor de sinais (instru(15~0))
	signal saidaExtensor : std_logic_vector (31 downto 0);       -- Saida do extensor de sinais
	
	-- Unidade de controle (UC):
	signal opCode : std_logic_vector (5 downto 0);               -- Instru(31 ~ 26)
	signal funct : std_logic_vector (5 downto 0);                -- Instru(5 ~ 0)
	signal destino: std_logic_vector (25 downto 0);              -- Instru(31 ~ 26)
	signal habMUX_RtRd: std_logic;                               -- Habilita Rt ou Rd do Mux
	signal habEscritaReg: std_logic;                             -- Habilita a escrita no registrador
	signal habMUX_RtIm: std_logic;                               -- Habilita Rt ou Imediato do Mux
	signal operacaoULA: std_logic_vector(2 downto 0);            -- Operacao da ULA
	signal habMUX_ULA: std_logic;                                -- Habilita ULA ou Dado RAM do Mux
	signal BEQ: std_logic;                                       -- Habilita Jump if Equal
	signal habLeituraMem: std_logic;                             -- Habilita a leitura na memória RAM
	signal habEscritaMem: std_logic;                             -- Habilita a escrita na memória RAM
	signal controle: std_logic_vector(11 downto 0);              -- Controle de saída da Unidade de Controle
	signal Flag_BEQ: std_logic;                                  -- Operação AND da flag da ULA e do habilita jump
	signal Flag_PC: std_logic;                                   -- Habilita o Program Counter
	signal tipoR: std_logic;                                     -- Informa se a operação é do tipo R ou não
		
	--RAM:
	signal saidaRAM :  std_logic_vector (31 downto 0);           -- Saída da memória RAM
	signal saidaShifter :  std_logic_vector (31 downto 0);       -- Saída do shifter (<<2)
	signal saidaSomador : std_logic_vector (31 downto 0);        -- Saída do somador de PC_OUT + Shifter
	signal enderecoJ : std_logic_vector (31 downto 0);           -- Endereço do Jump

	-- Saida dos MUXs:
	signal mux_RtRd_out : std_logic_vector (4 downto 0);         -- Saída do Mux Rt e Rd
	signal mux_RtIm_out : std_logic_vector (31 downto 0);			 -- Saída do Mux Rt e Imediato
	signal mux_ULA_out  : std_logic_vector (31 downto 0);        -- Saída do Mux Imediato e ULA
	signal mux_ImPC_out : std_logic_vector (31 downto 0);        -- Saída do Mux Imediato e PC
	signal proxPC : std_logic_vector (31 downto 0);              -- Saída do Mux do PC
	

  
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
MUX_JMP : entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => mux_ImPC_out,
						  entradaB_MUX => saidaShifter, 
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
						  flag => flagULA,
						  seletor => operacaoULA);

							
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
Flag_PC       <= controle(11);
habMUX_RtRd   <= controle(10);
habEscritaReg <= controle(9);
habMUX_RtIm   <= controle(8);
operacaoULA   <= controle(7 downto 5);
tipoR         <= controle(4);
habMUX_ULA    <= controle(3);
BEQ           <= controle(2);
habLeituraMem <= controle(1);
habEscritaMem <= controle(0);

-- Definindo o "AND":
Flag_BEQ <= BEQ and flagULA;
enderecoJ <= saidaIncrementaPC(31 downto 28) & destino & "00";
EnderecoROM <= PC_OUT;				
PC <= EnderecoROM;

-- Dados de saída: 
ULA_A_in <= Rs_out;
ULA_B_in <= mux_RtIm_out;
ULA_out	<=Saida_ULA;
Escrita_RAM <= Rt_out;
Leitura_RAM <= saidaRAM;
Flag_ULA <= flagULA;

end architecture;