library ieee;
use ieee.std_logic_1164.all;

entity Aula14 is
  -- Total de bits das entradas e saidas
  generic (larguraDados : natural := 32;
			  larguraEnderecos : natural := 32;
			  larguraInstrucao : natural := 32;
			  simulacao : boolean := FALSE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
	 DataAddress : out std_logic_vector(31 downto 0)
  );
end entity;


architecture arquitetura of Aula14 is

-- Faltam alguns sinais:
  --signal chavesX_ULA_B : std_logic_vector (larguraDados-1 downto 0);
	signal CLK : std_logic;
	signal PC_IN: std_logic_vector(31 downto 0);
	signal Endereco: std_logic_vector(31 downto 0);
	signal dado: std_logic_vector(31 downto 0);
	signal Rs: std_logic_vector(4 downto 0);
	signal Rt: std_logic_vector(4 downto 0);
	signal Rd: std_logic_vector(4 downto 0);
	signal saidaUC : std_logic_vector(5 downto 0);
	signal saidaRAM: std_logic_vector(31 downto 0);
	signal saidaULA: std_logic_vector(31 downto 0);
	signal ULA_A: std_logic_vector(31 downto 0);
	signal ULA_B: std_logic_vector(31 downto 0);
	signal dadoRAM: std_logic_vector(31 downto 0);
	signal escritaREG: std_logic;
	signal escritaRAM: std_logic;
	signal leituraRAM: std_logic;	
  
  
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
PC: entity work.registradorGenerico   generic map (larguraDados => 32)
	port map (DIN => PC_IN, 
				 DOUT => Endereco, 
				 ENABLE => '1',
				 CLK => CLK, 
				 RST => '1');

-- Incrementa Program Counter:
incrementaPC: entity work.somaconstante generic map (larguraDados => 32, constante => 4)
	port map ( entrada => Endereco,
				  saida => PC_IN);


-- Memória ROM:
ROM: entity work.memoriaROM   generic map (dataWidth => 32, addrWidth => 32)
	port map ( Endereco => Endereco, 
				  dado => dado);

-- Banco de registradores:	 
bancoReg: entity work.bancoReg generic map (larguraDados => 32, larguraEndBancoRegs => 5)
	port map ( clk => CLK,
				  enderecoA => Rs,
				  enderecoB => Rt,
				  enderecoC => Rt,
				  dadoEscritaC => saidaRAM,
				  escreveC => escritaREG,
				  saidaA => ULA_A,
				  saidaB => dadoRAM);

-- Estensor de sinal:
estendeSinal: entity work.estendeSinalGenerico generic map (larguraDadoEntrada => 16, larguraDadoSaida => 32)
	port map ( estendeSinal_IN  => dado(15 downto 0),
				  estendeSinal_OUT => ULA_B);

-- Unidade de controle:
UC: entity work.UC
	port map ( opcode => dado(31 downto 26),
				  saida => saidaUC);

-- ULA:
ULA: entity work.ULA  generic map(larguraDados => 32)
	port map (entradaA => ULA_A, 
				 entradaB =>  ULA_B,
				 saida => saidaULA, 
				 seletor => saidaUC(4 downto 2));

-- Memória RAM:
RAM: entity work.memoriaRAM   generic map (dataWidth => 32, addrWidth => 32)
	port map ( 
				  Data_Address => saidaULA,
				  wr => escritaRAM,
				  rd => leituraRAM,
				  Habilita_RAM  => '1', 
				  Data_IN => dadoRAM,
				  Data_OUT => saidaRAM,
				  clk => CLK);
escritaRAM <= saidaUC(0);
leituraRAM <= saidaUC(1);
escritaREG <= saidaUC(5);

Rs <= dado(25 downto 21);
Rt <= dado(20 downto 16);
Rd <= dado(15 downto 11); 
end architecture;