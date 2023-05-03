library ieee;
use ieee.std_logic_1164.all;

entity Aula7 is
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
		  SW: in std_logic_vector(9 downto 0);
		  HEX0 : out std_logic_vector(6 downto 0);
	 	  HEX1 : out std_logic_vector(6 downto 0);
	 	  HEX2 : out std_logic_vector(6 downto 0);
		  HEX3 : out std_logic_vector(6 downto 0);
		  HEX4 : out std_logic_vector(6 downto 0);
		  HEX5 : out std_logic_vector(6 downto 0);
		 
		  Reg_retorno: out std_logic_vector(7 downto 0);
		 
			 --CPU
		  ENTRADAX_ULA: out std_logic_vector(7 downto 0);
		  ENTRADAY_ULA: out std_logic_vector(7 downto 0);
		  SAIDA_ULTA: out std_logic_vector(7 downto 0);
		  SELE_ULA: out std_logic_vector(1 downto 0);
		 -- TOP LEVEL
		  HABILITASW: out std_logic;
		  HABLITAHEX: out std_logic;
		  OUT_HEXTESTE: out std_logic_vector(3 downto 0);
		  WRITETESTE : out std_logic;
		 READTESTE : out std_logic
	 
  );
  
end entity;


architecture arquitetura of Aula7 is

signal CPU_EnderecoRam: std_logic_vector(5 downto 0);
signal CPU_EscritoRam: std_logic_vector (7 downto 0);
signal LidoRam_CPU: std_logic_vector(7 downto 0);
signal CPU_wr: std_logic;
signal CPU_rd: std_logic;
signal CPU_EnderecoROM: std_logic_vector(8 downto 0);
signal DadoROM_CPU: std_logic_vector(12 downto 0);
signal Habilita_Ram: std_logic;
signal Data_Address: std_logic_vector(8 downto 0);
signal CLK: std_logic;
signal Decoder_Entrada1 : std_logic_vector (2 downto 0);
signal Decoder_Entrada2 : std_logic_vector (2 downto 0);
signal Decoder_Saida1 : std_logic_vector (7 downto 0);
signal Decoder_Saida2: std_logic_vector(7 downto 0);
signal LED : std_logic_vector (9 downto 0);
signal Habilita_LED : std_logic;
signal Habilita_LED8 : std_logic;
signal Habilita_LED9 : std_logic;

signal Habilita_HEX: std_logic_vector(5 downto 0);
signal Habilita_HEX0: std_logic;
signal Habilita_HEX1: std_logic;  
signal Habilita_HEX2: std_logic;
signal Habilita_HEX3: std_logic;
signal Habilita_HEX4: std_logic;  
signal Habilita_HEX5: std_logic;
signal KEY_SAIDA: std_logic_vector(4 downto 0);

signal Habilita_KEY0: std_logic;
signal Habilita_KEY1: std_logic;
signal Habilita_KEY2: std_logic;
signal Habilita_KEY3: std_logic;
signal Habilita_KEY_RST: std_logic;
  
  
signal Debounce_BuffKEY0: std_logic;
signal DebouNCE_BuffKEY1: std_logic;
signal Debounce_BuffRSTFPGA: std_logic;
 
signal Habilita_SW: std_logic;
signal Habilita_SW8: std_logic;
signal Habilita_SW9: std_logic;
signal SW8_SAIDA : std_logic;
signal SW9_SAIDA: std_logic;

signal CLK1 : std_logic;
signal CLK0 : std_logic;
signal CLK2 : std_logic;
signal limpaKEY0: std_logic;
signal limpaKEY1: std_logic;
signal limpaRST: std_logic;

signal fio_teste: std_logic_vector(7 downto 0);

signal saida_CLK: std_logic;


begin


--gravar:  if simulacao generate
--CLK <= KEY(0);
--else generate

divisor : entity work.divisorGenerico
            generic map (divisor => 50000)   -- divide por 10.
            port map (clk => CLOCK_50, saida_clk => saida_CLK);
CLK <= saida_CLK;  
--end generate;


-- O port map completo do MUX.
CPU:  entity work.CPU  
        port map(CLOCK_50 => CLK,
					  KEY => KEY_SAIDA,
					  Data_Address => Data_Address,
                 Data_OUT =>  CPU_EscritoRam,
                 Data_IN => LidoRam_CPU,
                 ROM_Address => CPU_EnderecoROM,
					  ROM_InstructionIN => DadoROM_CPU,
					  we => CPU_wr,
					  re => CPU_rd,
					  
					  Teste => fio_teste,
					  ENTRADAX_ULA => ENTRADAX_ULA,
					  ENTRADAY_ULA => ENTRADAY_ULA,
					  SAIDA_ULTA => SAIDA_ULTA,
					  SELE_ULA => SELE_ULA
					  );
					  
RAM : entity work.memoriaRAM   generic map (dataWidth => 8, addrWidth => 6)
          port map (addr => CPU_EnderecoRam, we => CPU_wr, re => CPU_rd, habilita  => Habilita_Ram, dado_in => CPU_EscritoRam, dado_out =>  LidoRam_CPU, clk => CLK);

ROM1 : entity work.memoriaROM   generic map (dataWidth => 13, addrWidth => 9)
          port map (Endereco =>CPU_EnderecoROM, Dado => DadoROM_CPU);
			 

			 
DECODER1 :  entity work.decoder3x8
        port map( entrada => Decoder_Entrada1,
                 saida => Decoder_Saida1);

DECODER2 : entity work.decoder3X8
          port map (entrada => Decoder_Entrada2, saida => Decoder_Saida2);
		  
LEDS: entity work.logicLEDS generic map (larguraDados => 8)
			port map( CLK => CLK,
						 CPU_EscritoRam => CPU_EscritoRam,
						 Habilita_LED => Habilita_LED,
						 Habilita_LED8 => Habilita_LED8,
						 Habilita_LED9 => Habilita_LED9,
						 LEDR => LEDR);
SWS: entity work.logicSW generic map (larguraDados => 8)
			port map( CLK => CLK,
						 SW => SW,
						 Habilita_SW => Habilita_SW,
						 Habilita_SW8 => Habilita_SW8,
						 Habilita_SW9 => Habilita_SW9,
						 LidoRam_CPU => LidoRam_CPU,
						 SW9_SAIDA => SW9_SAIDA,
						 SW8_SAIDA => SW8_SAIDA);
DISPLAYS: entity work.logicDisplays generic map (larguraDados => 8)
			port map( CLK => CLK,
						 CPU_EscritoRam => CPU_EscritoRam,
						 HEX0 => HEX0,
						 HEX1 => HEX1,
						 HEX2 => HEX2,
						 HEX3 => HEX3,
						 HEX4 => HEX4,
						 HEX5 => HEX5,
						 HabilitaHEX => Habilita_HEX,
						 Habilita_HEX0 => Habilita_HEX0,
						 Habilita_HEX1 => Habilita_HEX1,
						 Habilita_HEX2 => Habilita_HEX2,
						 Habilita_HEX3 => Habilita_HEX3,
						 Habilita_HEX4 => Habilita_HEX4, 
						 Habilita_HEX5 => Habilita_HEX5);
						 
KEYS: entity work.logicKeys generic map (larguraDados => 8)
			port map(CLK => CLK,
						KEY => KEY,
						FPGA_RESET_N => FPGA_RESET_N,
						Data_address => Data_address,
						Habilita_KEY0 => Habilita_KEY0,
						Habilita_KEY1 => Habilita_KEY1,
						Habilita_KEY2 => Habilita_KEY2,
						Habilita_KEY3 => Habilita_KEY3,
						Habilita_KEY_RST => Habilita_KEY_RST,
						CPU_wr => CPU_wr,
						KEY_SAIDA => KEY_SAIDA);

--DEBOUNCE_KEY0_TESTE : entity work.DebounceMem
--		  port map(entrada =>  '1',saida => Debounce_BuffKEY0, clk => CLK0, rst => limpaKEY0);
--
--DEBOUNCE_KEY1_TESTE : entity work.DebounceMem
--		  port map(entrada =>  '1',saida => Debounce_BuffKEY1, clk => CLK1, rst => limpaKEY1);



Habilita_LED <= '1' when (Decoder_Saida2(0) and Decoder_Saida1(4) and CPU_wr and not(Data_Address(5))) else '0';
Habilita_LED8 <= '1' when (Decoder_Saida2(1) and Decoder_Saida1(4) and CPU_wr and not(Data_Address(5))) else '0';
Habilita_LED9 <= '1' when (Decoder_Saida2(2) and Decoder_Saida1(4) and CPU_wr and not(Data_Address(5))) else '0';


Habilita_HEX0 <= Decoder_Saida1(4) and Decoder_Saida2(0) and CPU_wr and Data_Address(5);
Habilita_HEX1 <= Decoder_Saida1(4) and Decoder_Saida2(1) and CPU_wr and Data_Address(5);
Habilita_HEX2 <= Decoder_Saida1(4) and Decoder_Saida2(2) and CPU_wr and Data_Address(5);
Habilita_HEX3 <= Decoder_Saida1(4) and Decoder_Saida2(3) and CPU_wr and Data_Address(5);
Habilita_HEX4 <= Decoder_Saida1(4) and Decoder_Saida2(4) and CPU_wr and Data_Address(5);
Habilita_HEX5 <= Decoder_Saida1(4) and Decoder_Saida2(5) and CPU_wr and Data_Address(5);

Habilita_KEY0 <= Decoder_Saida1(5) and Decoder_Saida2(0) and CPU_rd and Data_Address(5);
Habilita_KEY1 <= Decoder_Saida1(5) and Decoder_Saida2(1) and CPU_rd and Data_Address(5);
Habilita_KEY2 <= Decoder_Saida1(5) and Decoder_Saida2(2) and CPU_rd and Data_Address(5);
Habilita_KEY3 <= Decoder_Saida1(5) and Decoder_Saida2(3) and CPU_rd and Data_Address(5);
Habilita_KEY_RST <= Decoder_Saida1(5) and Decoder_Saida2(4) and CPU_rd and Data_Address(5);

Habilita_SW <= Decoder_Saida1(5) and Decoder_Saida2(0) and CPU_rd and not(Data_Address(5));
Habilita_SW8 <= Decoder_Saida1(5) and Decoder_Saida2(1) and CPU_rd and not(Data_Address(5));
Habilita_SW9 <= Decoder_Saida1(5) and Decoder_Saida2(2) and CPU_rd and not(Data_Address(5));

        
CPU_EnderecoRam <= Data_Address(5 downto 0);
Decoder_Entrada1 <= Data_Address(8 downto 6);
Decoder_Entrada2 <= Data_Address(2 downto 0);
Habilita_Ram <= Decoder_Saida1(0);

HABILITASW <= Habilita_KEY0;
HABLITAHEX <= Habilita_HEX0;
Reg_retorno <= fio_teste;

WRITETESTE <= CPU_wr;
READTESTE <= CPU_rd;




end architecture;