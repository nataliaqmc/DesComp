library ieee;
use ieee.std_logic_1164.all;

entity Aula4 is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 13;
        larguraEnderecos : natural := 9;
		  larguraInstru : natural :=8;
		  larguraROM : natural :=4;
        simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
    SW: in std_logic_vector(9 downto 0);
    PC_OUT: out std_logic_vector(larguraEnderecos-1 downto 0);
    LEDR  : out std_logic_vector(9 downto 0);
	 ENTRADA_B_ULA : out std_logic_vector(7 downto 0);
	 PALAVRA_CONTROLE : out std_logic_vector(5 downto 0)
  );
end entity;


architecture arquitetura of Aula4 is

  -- Sinais Memória Instruções:
  signal instrucoes : std_logic_vector (12 downto 0); -- Saída memória
  signal Endereco : std_logic_vector (8 downto 0);    -- instrucoes(8~0)
  signal CLK : std_logic;                             -- Clock
  
  -- Sinais ULA:
  signal ULA_B_MUX : std_logic_vector (7 downto 0);   -- Entrada B: saída do MUX
  signal ULA_A_REG : std_logic_vector (7 downto 0);   -- Entrada A: saída do Reg
  signal Saida_ULA : std_logic_vector (7 downto 0);   -- Será a entrada do Reg A
  
  -- Sinais MUX:
  signal Valor : std_logic_vector (7 downto 0);       -- Entrada 1: instruções(7~0)
  signal saidaRAM : std_logic_vector (7 downto 0);    -- Entrada 0: saída da RAM
  
  -- Sinais Decoder
  signal opCode : std_logic_vector (12 downto 9);         -- Entrada decoder: instruçoes(12~9)
  signal SelMUX : std_logic;                              -- Saida decoder(5)
  signal Habilita_A : std_logic;                          -- Saida decoder(4)
  signal Operacao_ULA : std_logic_vector(1 downto 0);     -- Saida decoder(3~2)
  signal habLeitura : std_logic;                          -- Saida decoder(1)
  signal habEscrita : std_logic;                          -- Saida decoder(0)
  signal Sinais_Controle : std_logic_vector (5 downto 0); -- Saida decoder(5~0)
  
  -- Memória de dados RAM:
  signal entradaRAM : std_logic_vector (7 downto 0);  -- Entrada da RAM: barramento de dados
  signal enderecoRAM : std_logic_vector (7 downto 0); -- Instrucoes(7~0)
  signal habilitaRAM : std_logic;
   
  -- Sinais PC:
  signal inPC : std_logic_vector (8 downto 0);  -- Entrada PC
  
  
  

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
        port map( entradaA_MUX => saidaRAM,      -- Entrada 0
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
        port map( entrada => Endereco, -- Entrada incrementa PC, endereço da instrução (8~0)
						saida => inPC);      -- Saída incrementa PC


-- O port map completo da ULA:
ULA1 : entity work.ULASomaSub  generic map(larguraDados => larguraInstru)
          port map (entradaA => ULA_A_REG,    -- Entrada A da ULA: saída do registrador
						  entradaB => ULA_B_MUX,    -- Entrada B da ULA: saída do MUX
						  saida => Saida_ULA,       -- Saída da ULA
						  seletor => Operacao_ULA); -- Operador: 01,10,11

-- O port map completo da ROM:
ROM1 : entity work.memoriaROM   generic map (dataWidth => larguraDados, addrWidth => larguraEnderecos)
          port map (Endereco => Endereco, Dado => instrucoes);

-- O port map completo do decoder:
DEC : entity work.decoderInstru
			port map (opcode => instrucoes(12 downto 9), saida => Sinais_Controle);

-- O port map completo da RAM:			
RAM1: entity work.memoriaRAM generic map(dataWidth => larguraInstru, addrWidth => larguraInstru)
			port map (addr => instrucoes(7 downto 0), 
						 we => habEscrita,
						 re => habLeitura,
						 habilita => habilitaRAM,
						 clk => CLK,
						 dado_in => ULA_A_REG,
						 dado_out => saidaRAM);
						 
						 
SelMUX <= Sinais_Controle(5);
Habilita_A <= Sinais_Controle(4);
Operacao_ULA <= Sinais_Controle(3 downto 2);
habLeitura <= Sinais_Controle(1);
habEscrita <= Sinais_Controle(0);
habilitaRAM <= instrucoes(8);
entradaRAM <= ULA_A_REG;
Valor <= instrucoes(7 downto 0);

LEDR(7 downto 0) <= ULA_A_REG;
LEDR(9 downto 8) <= Operacao_ULA;

PALAVRA_CONTROLE <= Sinais_Controle;

ENTRADA_B_ULA <= ULA_B_MUX;

PC_OUT <= Endereco;

end architecture;