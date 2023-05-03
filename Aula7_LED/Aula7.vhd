library ieee;
use ieee.std_logic_1164.all;

entity Aula7 is
  -- Total de bits das entradas e saidas
  generic (larguraDados : natural := 8;
			  larguraEnderecos : natural := 9;
			  larguraInstrucao : natural := 13;
        simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(4 downto 0);
	 SW : in std_logic_vector(9 downto 0);
	 DataAddress : out std_logic_vector(8 downto 0);
	 endereco : out std_logic_vector(5 downto 0);
	 LED : out std_logic_vector(9 downto 0);
	 HEX0 : out std_logic_vector(6 downto 0);
	 HEX1 : out std_logic_vector(6 downto 0);
	 HEX2 : out std_logic_vector(6 downto 0);
	 HEX3 : out std_logic_vector(6 downto 0);
	 HEX4 : out std_logic_vector(6 downto 0);
	 HEX5 : out std_logic_vector(6 downto 0)
  );
end entity;


architecture arquitetura of Aula7 is

-- Faltam alguns sinais:
  --signal chavesX_ULA_B : std_logic_vector (larguraDados-1 downto 0);
  signal CLK : std_logic;
  signal Habilita_RAM : std_logic;
  signal Wr : std_logic;
  signal Rd : std_logic;
  signal Instruction_IN : std_logic_vector(12 downto 0);
  signal Data_OUT : std_logic_vector(7 downto 0);
  signal Data_IN : std_logic_vector(7 downto 0);
  signal ROM_Address : std_logic_vector(8 downto 0);
  signal Data_Address : std_logic_vector(8 downto 0);
  signal saidaDecoder1 : std_logic_vector(7 downto 0);
  signal saidaDecoder2 : std_logic_vector(7 downto 0);
  signal end0 : std_logic;
  signal end1 : std_logic;
  signal end3 : std_logic;
  signal end4 : std_logic;
  signal end5 : std_logic;
  signal end2 : std_logic;
  signal bloco4 : std_logic;
  signal bloco5 : std_logic;
  signal Habilita_Led_R : std_logic;
  signal Habilita_Led_8 : std_logic;
  signal Habilita_Led_9 : std_logic;
  signal leds : std_logic_vector(7 downto 0);
  signal led8 : std_logic;
  signal led9 : std_logic;
  signal Habilita_Hex_0 : std_logic;
  signal Habilita_Hex_1 : std_logic;
  signal Habilita_Hex_2 : std_logic;
  signal Habilita_Hex_3 : std_logic;
  signal Habilita_Hex_4 : std_logic;
  signal Habilita_Hex_5 : std_logic;
  signal Habilita_Hex_6 : std_logic;
  signal apaga : std_logic;
  signal negativo : std_logic;
  signal overflow : std_logic;
  signal saida7seg_0 : std_logic_vector(6 downto 0);
  signal saida7seg_1 : std_logic_vector(6 downto 0);
  signal saida7seg_2 : std_logic_vector(6 downto 0);
  signal saida7seg_3 : std_logic_vector(6 downto 0);
  signal saida7seg_4 : std_logic_vector(6 downto 0);
  signal saida7seg_5 : std_logic_vector(6 downto 0);
  signal hex_0 : std_logic_vector(3 downto 0);
  signal hex_1 : std_logic_vector(3 downto 0);
  signal hex_2 : std_logic_vector(3 downto 0); 
  signal hex_3 : std_logic_vector(3 downto 0);
  signal hex_4 : std_logic_vector(3 downto 0);
  signal hex_5 : std_logic_vector(3 downto 0); 
  signal Habilita_SW_0_a_7 : std_logic;
  signal Habilita_SW_8 : std_logic;
  signal Habilita_SW_9 : std_logic;
  signal Habilita_KEY_0 : std_logic;
  signal Habilita_KEY_1 : std_logic;
  signal Habilita_KEY_2 : std_logic;
  signal Habilita_KEY_3 : std_logic;
  signal Habilita_FPGA : std_logic;
  signal SW_OUT_0_a_7 : std_logic_vector(7 downto 0);
  signal SW_OUT_8 : std_logic;
  signal SW_OUT_9 : std_logic;
  signal KEY_OUT_0 : std_logic;
  signal KEY_OUT_1 : std_logic;
  signal KEY_OUT_2 : std_logic;
  signal KEY_OUT_3 : std_logic;
  signal FPGA_OUT : std_logic;
  
begin

-- Instanciando os componentes:

-- Para simular, fica mais simples tirar o edgeDetector
gravar:  if simulacao generate
CLK <= CLOCK_50;
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK);
end generate;



CPU : entity work.CPU generic map (larguraDados => 8, larguraEnderecos => 9, larguraInstrucao =>13)
		port map(CLOCK_50 => CLK,
					KEY => KEY,
					Instruction_IN =>Instruction_IN,
					Wr => Wr,
					Rd => Rd,
					Data_Address => Data_Address,
					ROM_Address => ROM_Address,
					Data_Out => Data_OUT,
					Data_IN =>Data_IN);
					
ROM1 : entity work.memoriaROM   generic map (dataWidth => larguraInstrucao, addrWidth => larguraEnderecos)
          port map (ROM_Address => ROM_Address,
						  Instruction_IN => Instruction_IN);
						  
RAM1 : entity work.memoriaRAM  generic map(dataWidth => larguraDados, addrWidth => 6)
			 port map ( Data_Address => Instruction_IN (5 downto 0),
							wr => Wr,
							rd => Rd, 
							Habilita_RAM => Habilita_RAM,
							clk => CLK, 
							Data_OUT => Data_OUT,
							Data_IN => Data_IN);
							
DECODER1: entity work.decoder3x8
				port map( entrada => Data_Address(8 downto 6),
							 saida => saidaDecoder1);
							 
							 
DECODER2: entity work.decoder3x8
				port map( entrada => Data_Address(2 downto 0),
							 saida => saidaDecoder2);							 
							 
REG_LED: entity work.registradorGenerico generic map(larguraDados => larguraDados)
				port map (DIN => Data_OUT,
							 DOUT => leds,
							 ENABLE => Habilita_Led_R,
							 CLK => CLK,
							 RST => '0');
REG_FF_8: entity work.FlipFlop generic map(larguraDados => 1)
				port map (DIN => Data_OUT(0),
							 DOUT => led8,
							 ENABLE => Habilita_Led_8,
							 CLK => CLK,
							 RST => '0');
REG_FF_9: entity work.FlipFlop generic map(larguraDados => 1)
				port map (DIN => Data_OUT(0),
							 DOUT => led9,
							 ENABLE => Habilita_Led_9,
							 CLK => CLK,
							 RST => '0');
DISPLAYS_7_SEG_0 : entity work.conversorHex7Seg
					  port map(dadoHex => hex_0,
								  apaga =>  apaga,
								  negativo => negativo,
								  overFlow =>  overflow,
								  saida7seg => saida7seg_0);
DISPLAYS_7_SEG_1 : entity work.conversorHex7Seg
					  port map(dadoHex => hex_1,
								  apaga =>  apaga,
								  negativo => negativo,
								  overFlow =>  overflow,
								  saida7seg => saida7seg_1);
DISPLAYS_7_SEG_2 : entity work.conversorHex7Seg
					  port map(dadoHex => hex_2,
								  apaga =>  apaga,
								  negativo => negativo,
								  overFlow =>  overflow,
								  saida7seg => saida7seg_2);
DISPLAYS_7_SEG_3 : entity work.conversorHex7Seg
					  port map(dadoHex => hex_3,
								  apaga =>  apaga,
								  negativo => negativo,
								  overFlow =>  overflow,
								  saida7seg => saida7seg_3);
DISPLAYS_7_SEG_4 : entity work.conversorHex7Seg
					  port map(dadoHex => hex_4,
								  apaga =>  apaga,
								  negativo => negativo,
								  overFlow =>  overflow,
								  saida7seg => saida7seg_4);
DISPLAYS_7_SEG_5 : entity work.conversorHex7Seg
					  port map(dadoHex => hex_5,
								  apaga =>  apaga,
								  negativo => negativo,
								  overFlow =>  overflow,
								  saida7seg => saida7seg_5);
							 

REG_HEX_0: entity work.registradorGenerico generic map(larguraDados => 4)
				port map (DIN => Data_OUT(3 downto 0),
							 DOUT => hex_0,
							 ENABLE => Habilita_Hex_0,
							 CLK => CLK,
							 RST => '0');
REG_HEX_1: entity work.registradorGenerico generic map(larguraDados => 4)
				port map (DIN => Data_OUT(3 downto 0),
							 DOUT => hex_1,
							 ENABLE => Habilita_Hex_1,
							 CLK => CLK,
							 RST => '0');
REG_HEX_2: entity work.registradorGenerico generic map(larguraDados => 4)
				port map (DIN => Data_OUT(3 downto 0),
							 DOUT => hex_2,
							 ENABLE => Habilita_Hex_2,
							 CLK => CLK,
							 RST => '0');			
REG_HEX_3: entity work.registradorGenerico generic map(larguraDados => 4)
				port map (DIN => Data_OUT(3 downto 0),
							 DOUT => hex_3,
							 ENABLE => Habilita_Hex_3,
							 CLK => CLK,
							 RST => '0');			
REG_HEX_4: entity work.registradorGenerico generic map(larguraDados => 4)
				port map (DIN => Data_OUT(3 downto 0),
							 DOUT => hex_4,
							 ENABLE => Habilita_Hex_4,
							 CLK => CLK,
							 RST => '0');			
REG_HEX_5: entity work.registradorGenerico generic map(larguraDados => 4)
				port map (DIN => Data_OUT(3 downto 0),
							 DOUT => hex_5,
							 ENABLE => Habilita_Hex_5,
							 CLK => CLK,
							 RST => '0');			
						 
BUFFER_0_a_7: entity work.buffer_3_state_8portas
				  port map(entrada => SW(7 downto 0),
							  habilita =>  Habilita_SW_0_a_7,
							  saida => SW_OUT_0_a_7);
BUFFER_8: entity work.buffer_3_state_1porta
				  port map(entrada => SW(8),
							  habilita =>  Habilita_SW_8,
							  saida => SW_OUT_8);
BUFFER_9: entity work.buffer_3_state_1porta
				  port map(entrada => SW(9),
							  habilita =>  Habilita_SW_9,
							  saida => SW_OUT_9);	
BUFFER_KEY_0: entity work.buffer_3_state_1porta
				  port map(entrada => KEY(0),
							  habilita =>  Habilita_KEY_0,
							  saida => KEY_OUT_0);
BUFFER_KEY_1: entity work.buffer_3_state_1porta
				  port map(entrada => KEY(1),
							  habilita =>  Habilita_KEY_1,
							  saida => KEY_OUT_1);	
BUFFER_KEY_2: entity work.buffer_3_state_1porta
				  port map(entrada => KEY(2),
							  habilita =>  Habilita_KEY_2,
							  saida => KEY_OUT_2);	
BUFFER_KEY_3: entity work.buffer_3_state_1porta
				  port map(entrada => KEY(3),
							  habilita =>  Habilita_KEY_3,
							  saida => KEY_OUT_3);	
BUFFER_FPGA: entity work.buffer_3_state_1porta
				  port map(entrada => KEY(4),
							  habilita =>  Habilita_FPGA,
							  saida => FPGA_OUT);					  
						 
Habilita_RAM <= saidaDecoder1(0);
end0 <= saidaDecoder2(0);
end1 <= saidaDecoder2(1);
end2 <= saidaDecoder2(2);
end3 <= saidaDecoder2(2);
end4 <= saidaDecoder2(2);
end5 <= saidaDecoder2(2);
bloco4 <= saidaDecoder1(4);
bloco5 <= saidaDecoder1(5);

apaga <= '0';
negativo <= '0';
overflow <= '0';

Habilita_Led_R <= (Wr and end0 and bloco4 and not Data_Address(5));
Habilita_Led_8 <= (Wr and end1 and bloco4 and not Data_Address(5));
Habilita_Led_9 <= (Wr and end2 and bloco4 and not Data_Address(5));

Habilita_Hex_0 <= (Wr and end0 and bloco4 and DataAddress(5));
Habilita_Hex_1 <= (Wr and end1 and bloco4 and DataAddress(5));
Habilita_Hex_2 <= (Wr and end2 and bloco4 and DataAddress(5));
Habilita_Hex_3 <= (Wr and end3 and bloco4 and DataAddress(5));
Habilita_Hex_4 <= (Wr and end4 and bloco4 and DataAddress(5));
Habilita_Hex_5 <= (Wr and end5 and bloco4 and DataAddress(5));

Habilita_SW_0_a_7 <= (Rd and end0 and bloco5 and not DataAddress(5));
Habilita_SW_8 <= (Rd and end1 and bloco5 and not DataAddress(5));
Habilita_SW_9 <= (Rd and end2 and bloco5 and not DataAddress(5));

Habilita_KEY_0 <= (Rd and end0 and bloco5 and DataAddress(5));
Habilita_KEY_1 <= (Rd and end1 and bloco5 and DataAddress(5));
Habilita_KEY_2 <= (Rd and end2 and bloco5 and DataAddress(5));
Habilita_KEY_3 <= (Rd and end3 and bloco5 and DataAddress(5));
Habilita_FPGA <= ( Rd and end4 and bloco5 and DataAddress(5));
  
LED(9) <= led9;
LED(8) <= led8;
LED(7 downto 0) <= leds;
HEX0 <= saida7seg_0;
HEX1 <= saida7seg_1;
HEX2 <= saida7seg_2;
HEX3 <= saida7seg_3;
HEX4 <= saida7seg_4;
HEX5 <= saida7seg_5;

DataAddress <= Data_Address;
endereco <= Instruction_IN (5 downto 0);
end architecture;