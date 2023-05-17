library ieee;
use ieee.std_logic_1164.all;

entity logicKeys is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8);
  port (
		CLK: in std_logic;
		KEY: in std_logic_vector(3 downto 0);
		FPGA_RESET_N: in std_logic;
		Data_address: in std_logic_vector(8 downto 0);
		Habilita_KEY0: in std_logic;
		Habilita_KEY1: in std_logic;
		Habilita_KEY2: in std_logic;
		Habilita_KEY3: in std_logic;
		Habilita_KEY_RST: in std_logic;
		CPU_wr: in std_logic;
		KEY_SAIDA: out std_logic_vector(4 downto 0)
  );
end entity;

architecture comportamento of logicKeys is
	signal Debounce_BuffKEY0: std_logic;
	signal DebouNCE_BuffKEY1: std_logic;
	signal Debounce_BuffRSTFPGA: std_logic;
	
	signal CLK1 : std_logic;
	signal CLK0 : std_logic;
	signal CLK2 : std_logic;
	signal limpaKEY0: std_logic;
	signal limpaKEY1: std_logic;
	signal limpaRST: std_logic;
	signal KEY0_SAIDA: std_logic;
	signal KEY1_SAIDA: std_logic;
	signal KEY2_SAIDA: std_logic;
	signal KEY3_SAIDA: std_logic;
	signal KEYRST_SAIDA: std_logic;
  begin
  
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLK0, entrada => (not KEY(0)), saida => CLK0);

detectorSub1: work.edgeDetector(bordaSubida)
        port map (clk => CLK1, entrada => (not KEY(1)), saida => CLK1);
		  
detectorSub2: work.edgeDetector(bordaSubida)
        port map (clk => CLK2, entrada => (not FPGA_RESET_N), saida => CLK2);
		  

BUFF_KEY_RESET:   entity work.buffer_3_state_1porta
        port map(entrada => Debounce_BuffRSTFPGA, habilita =>  Habilita_KEY_RST, saida => KEYRST_SAIDA);	

BUFF_KEY0:   entity work.buffer_3_state_1porta
        port map(entrada => Debounce_BuffKEY0, habilita =>  Habilita_KEY0, saida => KEY0_SAIDA);	

BUFF_KEY1:   entity work.buffer_3_state_1porta
        port map(entrada => Debounce_BuffKEY1, habilita =>  Habilita_KEY1, saida => KEY1_SAIDA);	

BUFF_KEY2:   entity work.buffer_3_state_1porta
        port map(entrada => KEY(2), habilita =>  Habilita_KEY2, saida => KEY2_SAIDA);	

BUFF_KEY3:   entity work.buffer_3_state_1porta
        port map(entrada => KEY(3), habilita =>  Habilita_KEY3, saida => KEY3_SAIDA);
		  
FF_KEY0: entity work.registradorBooleano  generic map (larguraDados => 1)
		 port map (DIN => '1', DOUT => Debounce_BuffKEY0, ENABLE => '1', CLK => CLK0, RST => limpaKEY0);
		 

FF_KEY1: entity work.registradorBooleano  generic map (larguraDados => 1)
		 port map (DIN => '1', DOUT => Debounce_BuffKEY1, ENABLE => '1', CLK => CLK1, RST => limpaKEY1);
		 
FF_RST_FPGA: entity work.registradorBooleano  generic map (larguraDados => 1)
		 port map (DIN => '1', DOUT => Debounce_BuffRSTFPGA, ENABLE => '1', CLK => CLK2, RST => limpaRST);

limpaKEY0 <= Data_Address(0) and Data_Address(1) and Data_address(2) and Data_Address(3) and Data_Address(4) and Data_Address(5) and Data_Address(6) and Data_Address(7) and Data_Address(8) and CPU_wr;

limpaKEY1 <= not(Data_Address(0)) and Data_Address(1) and Data_address(2) and Data_Address(3) and Data_Address(4) and Data_Address(5) and Data_Address(6) and Data_Address(7) and Data_Address(8) and CPU_wr;

limpaRST <= Data_Address(0) and not(Data_Address(1)) and Data_address(2) and Data_Address(3) and Data_Address(4) and Data_Address(5) and Data_Address(6) and Data_Address(7) and Data_Address(8) and CPU_wr;
		  
KEY_SAIDA(0) <= KEY0_SAIDA;
KEY_SAIDA(1) <= KEY1_SAIDA;
KEY_SAIDA(2) <= KEY2_SAIDA;
KEY_SAIDA(3) <= KEY3_SAIDA;
KEY_SAIDA(4) <= KEYRST_SAIDA;
end architecture;