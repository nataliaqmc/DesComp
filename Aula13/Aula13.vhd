library ieee;
use ieee.std_logic_1164.all;

entity Aula13 is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8;
        larguraEnderecos : natural := 8;
        simulacao : boolean := FALSE-- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
        CLOCK_50 : in std_logic;
        KEY: in std_logic_vector(3 downto 0);
		  FPGA_RESET_N: in std_logic;
        LEDR  : out std_logic_vector(9 downto 0);
		  SW: in std_logic_vector(9 downto 0)
	 
  );
  
end entity;


architecture arquitetura of Aula13 is

	signal CLK: std_logic;
	
	signal opcode: std_logic_vector(31 downto 26);
	signal Rs: std_logic_vector(25 downto 21);
	signal Rt: std_logic_vector(20 downto 16);
	signal Rd: std_logic_vector(15 downto 11);
	signal shamt: std_logic_vector(10 downto 6);
	signal funct: std_logic_vector(5 downto 0);
	
	signal saidaULA: std_logic_vector(31 downto 0);
	signal ULA_A: std_logic_vector(31 downto 0);
	signal ULA_B: std_logic_vector(31 downto 0);

	signal dado: std_logic_vector(31 downto 0);
	signal saidaUC: std_logic_vector(7 downto 0);
	
	signal Endereco: std_logic_vector(31 downto 0);
	signal PC_in: std_logic_vector(31 downto 0);
	
	signal controleR1: std_logic;
	signal controleR2: std_logic;
	signal operacao  : std_logic_vector(2 downto 0);
	signal escritaREG: std_logic;
	signal leituraMem: std_logic;
	signal escritaMem: std_logic;
	signal saida_CLK : std_logic;
	signal flag: std_logic;

	begin


--gravar:  if simulacao generate
--CLK <= KEY(0);
--else generate

divisor : entity work.divisorGenerico
            generic map (divisor => 50000)   -- divide por 10.
            port map (clk => CLOCK_50, saida_clk => saida_CLK);
CLK <= saida_CLK;  
--end generate;

-- ETAPA DE FETCH
-- O port map completo do Program Counter.
PC : entity work.registradorGenerico   generic map (larguraDados => 32)
          port map (DIN => PC_in, DOUT => Endereco, ENABLE => '1', CLK => CLK, RST => '0');


ROM: entity work.memoriaROM   generic map (dataWidth => 32, addrWidth => 32)
          port map (Endereco =>Endereco, Dado => dado); 

-- ETAPA DE DECODE
UC: entity work.UC
		port map (funct => funct,
					 saida => saidaUC);
BancoReg: entity work.bancoReg generic map (larguraDados => 32, larguraEndBancoRegs => 5)
				port map (clk => CLK,
							 enderecoA => Rs,
							 enderecoB => Rt,
							 enderecoC => Rd,
							 dadoEscritaC => saidaULA,
							 escreveC => escritaREG,
							 saidaA => ULA_A,
							 saidaB => ULA_B);
incrementaPC :  entity work.somaConstante  generic map (larguraDados => 32, constante => 1)
        port map( entrada => Endereco, saida => PC_in);

-- ETAPA DE EXECUTE
ULA: entity work.ULA generic map (larguraDados => 32)
			port map (
						 entradaA => ULA_A,
						 entradaB => ULA_B,
						 seletor => operacao,
						 saida => saidaULA,
						 flagZero =>flag);

-- ETAPA DE MEMORY ACCESS : NÃO É REALIZADA EM TIPO R


-- ETAPA DE WRITE BACK: MOSTRA AS TRANSFERENCIAS
-- O port map completo do MUX.

	 


opcode <= dado(31 downto 26);
Rs     <= dado(25 downto 21);
Rt     <= dado(20 downto 16);
Rd     <= dado(15 downto 11);
shamt  <= dado(10 downto 6);
funct  <= dado(5 downto 0);


controleR1 <= saidaUC(7);
controleR2 <= saidaUC(6);
operacao   <= saidaUC(5 downto 3);
escritaREG <= saidaUC(2);
leituraMem <= saidaUC(1);
escritaMem <= saidaUC(0);

end architecture;