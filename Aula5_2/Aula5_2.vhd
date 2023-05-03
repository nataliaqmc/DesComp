library ieee;
use ieee.std_logic_1164.all;

entity Aula5_2 is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 13;
        larguraEnderecos : natural := 9;
		  larguraInstru : natural :=8;
		  larguraSelecao : natural :=2;
		  larguraROM : natural :=4;
        simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
    PC_OUT: out std_logic_vector(larguraEnderecos-1 downto 0);
	 PALAVRA_CONTROLE : out std_logic_vector(11 downto 0)
  );
end entity;


architecture arquitetura of Aula5_2 is

  -- Sinais Memória Instruções:
  signal instrucoes : std_logic_vector (12 downto 0); -- Saída memória(12~0)
  signal Endereco : std_logic_vector (8 downto 0);    -- Endereço: instrucoes(8~0)
  signal Destino: std_logic_vector (8 downto 0);      -- Destino: intrucoes(8~0)
  signal Valor : std_logic_vector (7 downto 0);       -- Entrada 1 MUX: instruções(7~0)
  signal opCode : std_logic_vector (3 downto 0);     -- Entrada decoder: instruçoes(12~9)
  signal CLK : std_logic;                             -- Clock
  signal RET_OUT: std_logic_vector(larguraEnderecos-1 downto 0);
  -- Sinais ULA:
  signal ULA_B_MUX : std_logic_vector (7 downto 0);   -- Entrada B: saída do MUX
  signal ULA_A_REG : std_logic_vector (7 downto 0);   -- Entrada A: saída do Reg
  signal Saida_ULA : std_logic_vector (7 downto 0);   -- Será a entrada do Reg A
  
  -- Sinais MUX:
  signal saidaRAM : std_logic_vector (7 downto 0);    -- Entrada 0: saída da RAM
  
  -- Sinais Decoder
  signal habEscritaRetorno : std_logic;
  signal JMP : std_logic;                                -- Saida decoder(8)
  signal RET : std_logic;
  signal JSR : std_logic;
  signal Jeq : std_logic;                                 -- Saida decoder(7)
  signal SelMUX : std_logic;                              -- Saida decoder(6)
  signal Habilita_A : std_logic;                          -- Saida decoder(5)
  signal Operacao_ULA : std_logic_vector(1 downto 0);     -- Saida decoder(4~3)
  signal Flag : std_logic;                                -- Saida decoder(2)
  signal habLeitura : std_logic;                          -- Saida decoder(1)
  signal habEscrita : std_logic;                          -- Saida decoder(0)
  signal Sinais_Controle : std_logic_vector (11 downto 0); -- Saida decoder(8~0)
  
  -- Memória de dados RAM:
  signal entradaRAM : std_logic_vector (7 downto 0);  -- Entrada da RAM: barramento de dados
  signal enderecoRAM : std_logic_vector (7 downto 0); -- Instrucoes(7~0)
  signal habilitaRAM : std_logic;
   
  -- Sinais PC:
  signal outIncrementa : std_logic_vector (8 downto 0);  -- Entrada 0 do MUX 2
  signal inPC : std_logic_vector (8 downto 0);  -- Entrada PC
  signal DesvioOut : std_logic_vector(1 downto 0);
  signal inFlag : std_logic;
  signal outFlag : std_logic;
  
  

begin

-- Instanciando os componentes:

-- Para simular, fica mais simples tirar o edgeDetector
gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK);
end generate;

-- O port map completo do MUX.
MUX1 :  entity work.muxGenerico2x1  generic map (larguraDados => larguraInstru)
        port map(entradaA_MUX => saidaRAM,      -- Entrada 0
                 entradaB_MUX =>  Valor,         -- Entrada 1
                 seletor_MUX => SelMUX,          -- Saida decoder
                 saida_MUX => ULA_B_MUX);        -- Entrada B da ULA

					  
-- O port map completo do Acumulador.
REGA : entity work.registradorGenerico   generic map (larguraDados => larguraInstru)
          port map (DIN => Saida_ULA, 
						  DOUT => ULA_A_REG,
						  ENABLE => Habilita_A,
						  CLK => CLK,
						  RST => '0');					  
					 

-- O port map completo do Program Counter.
PC : entity work.registradorGenerico   generic map (larguraDados => larguraEnderecos)
          port map (DIN => inPC,      -- Entrada PC
						  DOUT => Endereco, -- Saída PC
						  ENABLE => '1',    -- Habilita PC
						  CLK => CLK,       -- CLK
						  RST => '0');      -- Reset

incrementaPC :  entity work.somaConstante  generic map (larguraDados => larguraEnderecos, constante => 1)
        port map( entrada => Endereco,          -- Entrada incrementa PC, endereço da instrução (8~0)
						saida => outIncrementa);      -- Saída incrementa PC
MUX_PC :  entity work.muxGenericoNx1  generic map (larguraEntrada => larguraEnderecos, larguraSelecao => larguraSelecao)
        port map(entradaA_MUX => outIncrementa, -- Entrada 0
                 entradaB_MUX =>  Destino,       -- Entrada 1
                 entradaC_MUX => RET_OUT,
					  entradaD_MUX => outIncrementa,
					  seletor_MUX => DesvioOut,            -- Saida decoder
                 saida_MUX => inPC);             -- Entrada B da ULA
End_Retorno : entity work.registradorGenerico   generic map (larguraDados => larguraEnderecos)
          port map (DIN => outIncrementa, 
						  DOUT => RET_OUT,
						  ENABLE => habEscritaRetorno,
						  CLK => CLK,
						  RST => '0');
-- O port map da Flag:
HabFlag: entity work.FlipFlop
			port map ( DIN => inFlag,
						  DOUT => outFlag,
						  ENABLE =>  Flag,
						  CLK => CLK,
						  RST => '0');
-- O port map completo da ULA:
ULA1 : entity work.ULASomaSub  generic map(larguraDados => larguraInstru)
          port map (entradaA => ULA_A_REG,    -- Entrada A da ULA: saída do registrador
						  entradaB => ULA_B_MUX,    -- Entrada B da ULA: saída do MUX
						  saida => Saida_ULA,       -- Saída da ULA
						  seletor => Operacao_ULA,
						  inFlag => inFlag); 

-- O port map completo da ROM:
ROM1 : entity work.memoriaROM   generic map (dataWidth => larguraDados, addrWidth => larguraEnderecos)
          port map (Endereco => Endereco, Dado => instrucoes);

-- O port map completo do decoder:
DEC : entity work.decoderInstru
			port map (opcode => opCode,
						 saida => Sinais_Controle);

-- O port map completo da RAM:			
RAM1: entity work.memoriaRAM generic map(dataWidth => larguraInstru, addrWidth => larguraInstru)
			port map (addr => instrucoes(7 downto 0), 
						 we => habEscrita,
						 re => habLeitura,
						 habilita => habilitaRAM,
						 clk => CLK,
						 dado_in => ULA_A_REG,
						 dado_out => saidaRAM);
Desvio: entity work.logicaDesvio 
			port map (Flag => outFlag,
						 JEQ => Jeq,
						 JMP => JMP,
						 RET => RET,
						 JSR => JSR,				 
						 saida => DesvioOut);

-- Definindo os valores dos sinais de controle:
habEscritaRetorno <= Sinais_Controle(11);
JMP <= Sinais_Controle(10);
RET <= Sinais_Controle(9);
JSR <= Sinais_Controle(8);
Jeq <= Sinais_Controle(7);						 
SelMUX <= Sinais_Controle(6);
Habilita_A <= Sinais_Controle(5);
Operacao_ULA <= Sinais_Controle(4 downto 3);
Flag <= Sinais_Controle(2);
habLeitura <= Sinais_Controle(1);
habEscrita <= Sinais_Controle(0);

-- Definindo os valores de entrada da memória RAM:
habilitaRAM <= instrucoes(8);
entradaRAM <= ULA_A_REG;

-- Definindo os valores:
Valor <= instrucoes(7 downto 0);
Destino <= instrucoes(8 downto 0);
opCode <= instrucoes(12 downto 9);

PALAVRA_CONTROLE <= Sinais_Controle(11 downto 0);
PC_OUT <= Endereco;

end architecture;