library ieee;
use ieee.std_logic_1164.all;

entity Projeto2 is
  -- Total de bits das entradas e saidas
  generic (larguraDados : natural := 32;
			  larguraEnderecos : natural := 32;
			  larguraInstrucao : natural := 32;
			  simulacao : boolean := FALSE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    PC: out std_logic_vector(larguraEnderecos-1 downto 0);
	 KEY: in std_logic_vector(3 downto 0);
	 SW: in std_logic_vector(9 downto 0);
	 LEDR: out std_logic_vector (9 downto 0);
	 HEX0 : out std_logic_vector(6 downto 0);
	 HEX1 : out std_logic_vector(6 downto 0);
	 HEX2 : out std_logic_vector(6 downto 0);
	 HEX3 : out std_logic_vector(6 downto 0);
	 HEX4 : out std_logic_vector(6 downto 0);
	 HEX5 : out std_logic_vector(6 downto 0);

	 Saida_ULA_leitura	 : out std_logic_vector (larguraDados-1 downto 0)
	 --TESTE
	 --entradaAmm: out std_logic_vector(31 downto 0);
	 --entradaBmm: out std_logic_vector(31 downto 0)
	 
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
	signal habMUX_RtRd: std_logic_vector(1 downto 0);
	signal habMUX_BeqJ: std_logic;
	signal habEscritaReg: std_logic;
	signal habMUX_RtIm: std_logic;
	signal ctrlULA: std_logic_vector(3 downto 0);
	signal ULAop: std_logic_vector(1 downto 0);
	signal habMUX_ULA: std_logic_vector(1 downto 0);
	signal BEQ: std_logic;
	signal habLeituraMem: std_logic;
	signal habEscritaMem: std_logic; 
	signal controle: std_logic_vector(13 downto 0);
	signal Flag_BEQ: std_logic;
		
	--RAM:
	signal saidaRAM :  std_logic_vector (31 downto 0);
	signal saidaShifter :  std_logic_vector (31 downto 0);
	signal saidaSomador : std_logic_vector (31 downto 0);
	signal enderecoJ : std_logic_vector (31 downto 0);

	-- Saida dos MUXs:
	signal mux_RtRd_out : std_logic_vector ( 4 downto 0);
	signal mux_RtIm_out : std_logic_vector (31 downto 0);
	signal mux_ULA_out  : std_logic_vector (31 downto 0);
	signal mux_ImPC_out : std_logic_vector (31 downto 0);
	signal destinoShift : std_logic_vector (25 downto 0);
	signal mux_displays : std_logic_vector (31 downto 0);
	signal mux_FLAG_out : std_logic;
	signal lui_out      : std_logic_vector(31 downto 0);
	signal saidaMuxJump : std_logic_vector(31 downto 0);
	signal habMUX_JRJ   : std_logic;
	signal hab_tipoR    : std_logic;
	signal hab_ORI_ANDI : std_logic;
	signal BNE          : std_logic;
	signal BNE_or_BEQ   : std_logic;
	
	signal LEDS: std_logic_vector(9  downto 0);
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
			 
-- Banco de registradores:
MUX_REG_IN : entity work.muxGenerico4x1		generic map	(larguraDados => 5)
			 port map (entradaA_MUX => Rt,
						  entradaB_MUX => Rd,
						  entradaC_MUX => "11111",
						  entradaD_MUX => "00000",
						  seletor_MUX => habMUX_RtRd,
						  saida_MUX => mux_RtRd_out);

BANCO_REGISTRADORES : entity work.bancoReg generic map (larguraDados => larguraDados, larguraEndBancoRegs => 5)
			port map ( clk   	=> CLK,
						  enderecoA => Rs,
						  enderecoB => Rt,
						  enderecoC => mux_RtRd_out,
						  dadoEscritaC  => mux_ULA_out,
						  escreveC => habEscritaReg,
						  saidaA   => Rs_out,
						  saidaB   => Rt_out);
	
MUX_REG_OUT : entity work.muxGenerico2x1  generic map (larguraDados => 32)
			 port map (entradaA_MUX => Rt_out, 
						  entradaB_MUX => saidaExtensor,
						  seletor_MUX => habMUX_RtIm,
						  saida_MUX => mux_RtIm_out);

-- ULA:	
ULA : entity work.ULA  generic map(larguraDados => larguraDados)
          port map (entradaA => ULA_A,
						  entradaB => ULA_B,
						  saida => Saida_ULA,
						  inverteA =>ctrlULA(3),
						  inverteB => ctrlULA(2),
						  flagEQ => flagULA,
						  seletor => ctrlULA(1 downto 0))
						  ;
						  
MUX_FLAG: entity work.muxULA
			 port map (entradaA_MUX => not flagULA,
						  entradaB_MUX => flagULA, 
						  seletor_MUX  => BEQ,
						  saida_MUX    => mux_FLAG_out); 
						  
MUX_ULA : entity work.muxGenerico4x1  generic map (larguraDados => 32)
			 port map (entradaA_MUX => Saida_ULA,
						  entradaB_MUX => saidaRAM, 
						  entradaC_MUX => saidaIncrementaPC,
						  entradaD_MUX => lui_out,
						  seletor_MUX  => habMUX_ULA,
						  saida_MUX    => mux_ULA_out);

	

-- Memória de dados RAM MIPS:	
RAM : entity work.RAMMIPS generic map(dataWidth => 32, addrWidth => 32, memoryAddrWidth => 6)
			 port map (clk      => CLK,
						  Endereco => Saida_ULA,
						  Dado_in  => Rt_out,
						  Dado_out => saidaRAM,
						  we       => habEscritaMem,
						  re       => habLeituraMem,
						  habilita => '1');

-- Extende o imediato:			 
EXTENSOR_SINAL : entity work.estendeSinalGenerico generic map(larguraDadoEntrada => 16, larguraDadoSaida => 32)
			 port map (estendeSinal_IN => imediato,
						  estendeSinal_OUT => saidaExtensor);
LUI_OP: entity work.LUI
			 port map (entrada => imediato,
						  saida => lui_out); 
-- Desloca o imediato estendido:	
SHIFTER : entity work.deslocadorGenerico generic map(larguraDado => 32)
			 port map (shifter_IN => saidaExtensor,
						  shifter_OUT => saidaShifter);
					
-- Soma o endereço com a saída do shifter:							
SOMADOR: entity work.somadorGenerico generic map (	larguraDados => 32)
			 port map (entradaA => saidaIncrementaPC,
						  entradaB => saidaShifter,
						  saida => saidaSomador); 
-- Muxs:
MUX_BEQ : entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => saidaIncrementaPC,
						  entradaB_MUX => saidaSomador,
						  seletor_MUX => Flag_BEQ,
						  saida_MUX => mux_ImPC_out);
						  
MUX_PC_BEQ_JMP : entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => mux_ImPC_out,
						  entradaB_MUX => enderecoJ, 
						  seletor_MUX => habMUX_BeqJ, 
						  saida_MUX => saidaMuxJump);

MUX_JR : entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => saidaMuxJump,
						  entradaB_MUX => Rs_out, 
						  seletor_MUX => habMUX_JRJ, 
						  saida_MUX => proxPC);
SHIFTER_PC : entity work.deslocadorGenerico generic map(larguraDado => 26)
			 port map (shifter_IN => destino,
						  shifter_OUT => destinoShift);
			
						  
-- Unidade de Controle do Fluxo de dados:			 
UC : entity work.UC  
          port map (opCode => opCode,
						  funct => funct,
						  saida => controle);
-- Unidade de Controle da ULA:			 
UC_ULA : entity work.UnidadeControleULA  
          port map (funct => funct,
						  opcode => opcode, 
						  tipoR => hab_tipoR,
						  saida => ctrlULA);

-- Verificação do funcionamento:
MUX_COMPONENTES : entity work.muxGenerico4x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => PC_OUT,
						  entradaB_MUX => Saida_ULA,
						  entradaC_MUX =>ULA_A,
						  entradaD_MUX => ULA_B,
						  seletor_MUX => SW(1 downto 0),
						  saida_MUX => mux_displays);

--LED: entity work.logicLEDS generic map (larguraDados => 10)
--			 port map (CLK => CLK,
--						  Data_IN => mux_displays,
--						  LEDR => LEDS);
						  
						  
HEX_0 :  entity work.conversorHex7Seg
        port map(dadoHex => mux_displays(3 downto 0),
                 apaga => '0' ,
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX0);
						 		  
HEX_1 :  entity work.conversorHex7Seg
        port map(dadoHex => mux_displays(7 downto 4),
                 apaga => '0' ,
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX1);
					  
HEX_2 :  entity work.conversorHex7Seg
        port map(dadoHex => mux_displays(11 downto 8),
                 apaga => '0' ,
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX2);
					  
HEX_3 :  entity work.conversorHex7Seg
        port map(dadoHex => mux_displays(15 downto 12),
                 apaga => '0' ,
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX3);

					  
HEX_4 :  entity work.conversorHex7Seg
        port map(dadoHex => mux_displays(19 downto 16),
                 apaga => '0' ,
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX4);

HEX_5 :  entity work.conversorHex7Seg
        port map(dadoHex => mux_displays(23 downto 20),
                 apaga => '0' ,
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX5);
						 		  
LEDR(3 downto 0) <= mux_displays(27 downto 24);
LEDR(7 downto 4) <= mux_displays(31 downto 28);
						 		  
-- Definindo os valores das instruções:
opCode   <= dadoROM (31 downto 26);
Rs       <= dadoROM (25 downto 21);
Rt       <= dadoROM (20 downto 16);
Rd       <= dadoROM (15 downto 11);
imediato <= dadoROM (15 downto 0);
funct    <= dadoROM (5 downto 0);
destino  <= dadoROM (25 downto 0);
 

PC_IN <= proxPC;
ULA_A <= Rs_out;
ULA_B <= mux_RtIm_out;


-- Saída da unidade de controle (14 downto 0):
habMUX_JRJ    <= controle(13);
habMUX_BeqJ   <= controle(12);
habMUX_RtRd   <= controle(11 downto 10);
hab_ORI_ANDI  <= controle(9);
habEscritaReg <= controle(8);
habMUX_RtIm   <= controle(7);
hab_tipoR     <= controle(6);
habMUX_ULA    <= controle(5 downto 4);
BEQ           <= controle(3);
BNE           <= controle(2);
habLeituraMem <= controle(1);
habEscritaMem <= controle(0);


-- Definindo o "OR" do BEQ e BNE:
-- Definindo o "AND" do BEQ:
Flag_BEQ <= mux_FLAG_out and (BEQ or BNE);

-- Definindo o (PC + 4[31~28],Instr[25~0],0,0):
enderecoJ <= saidaIncrementaPC(31 downto 28) & destinoShift & "00";
EnderecoROM <= PC_OUT;				
PC <= EnderecoROM;

Saida_ULA_leitura	<=Saida_ULA;




end architecture;