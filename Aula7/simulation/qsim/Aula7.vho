-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "03/23/2023 17:15:47"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Aula7 IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	DataAddress : OUT std_logic_vector(8 DOWNTO 0);
	endereco : OUT std_logic_vector(5 DOWNTO 0)
	);
END Aula7;

-- Design Ports Information
-- CLOCK_50	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_H11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataAddress[0]	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataAddress[1]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataAddress[2]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataAddress[3]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataAddress[4]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataAddress[5]	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataAddress[6]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataAddress[7]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DataAddress[8]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endereco[0]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endereco[1]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endereco[2]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endereco[3]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endereco[4]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- endereco[5]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Aula7 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_DataAddress : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_endereco : std_logic_vector(5 DOWNTO 0);
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \KEY[0]~inputCLKENA0_outclk\ : std_logic;
SIGNAL \CPU|PC|DOUT[1]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~2\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~5_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~6\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~9_sumout\ : std_logic;
SIGNAL \CPU|PC|DOUT[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ROM1|memROM~5_combout\ : std_logic;
SIGNAL \ROM1|memROM~14_combout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~26\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~29_sumout\ : std_logic;
SIGNAL \ROM1|memROM~11_combout\ : std_logic;
SIGNAL \ROM1|memROM~9_combout\ : std_logic;
SIGNAL \CPU|DECODER|saida~0_combout\ : std_logic;
SIGNAL \CPU|MUX2|saida_MUX[7]~8_combout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~30\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~33_sumout\ : std_logic;
SIGNAL \CPU|MUX2|saida_MUX[8]~9_combout\ : std_logic;
SIGNAL \CPU|PC|DOUT[5]~DUPLICATE_q\ : std_logic;
SIGNAL \ROM1|memROM~1_combout\ : std_logic;
SIGNAL \ROM1|memROM~6_combout\ : std_logic;
SIGNAL \CPU|MUX2|saida_MUX[2]~3_combout\ : std_logic;
SIGNAL \CPU|PC|DOUT[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ROM1|memROM~12_combout\ : std_logic;
SIGNAL \CPU|DECODER|saida~1_combout\ : std_logic;
SIGNAL \ROM1|memROM~3_combout\ : std_logic;
SIGNAL \ROM1|memROM~4_combout\ : std_logic;
SIGNAL \CPU|MUX2|saida_MUX[1]~2_combout\ : std_logic;
SIGNAL \ROM1|memROM~13_combout\ : std_logic;
SIGNAL \CPU|MUX2|Equal1~0_combout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~10\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~13_sumout\ : std_logic;
SIGNAL \ROM1|memROM~7_combout\ : std_logic;
SIGNAL \ROM1|memROM~8_combout\ : std_logic;
SIGNAL \CPU|MUX2|saida_MUX[3]~4_combout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~14\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~17_sumout\ : std_logic;
SIGNAL \CPU|MUX2|saida_MUX[4]~5_combout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~18\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~21_sumout\ : std_logic;
SIGNAL \CPU|MUX2|saida_MUX[5]~6_combout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~22\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~25_sumout\ : std_logic;
SIGNAL \CPU|MUX2|saida_MUX[6]~7_combout\ : std_logic;
SIGNAL \CPU|PC|DOUT[6]~DUPLICATE_q\ : std_logic;
SIGNAL \ROM1|memROM~10_combout\ : std_logic;
SIGNAL \CPU|DECODER|Equal10~0_combout\ : std_logic;
SIGNAL \CPU|DECODER|saida~3_combout\ : std_logic;
SIGNAL \CPU|ULA1|saida[5]~1_combout\ : std_logic;
SIGNAL \CPU|DECODER|saida[5]~4_combout\ : std_logic;
SIGNAL \CPU|REGA|DOUT[5]~DUPLICATE_q\ : std_logic;
SIGNAL \ROM1|memROM~0_combout\ : std_logic;
SIGNAL \ROM1|memROM~2_combout\ : std_logic;
SIGNAL \RAM1|process_0~0_combout\ : std_logic;
SIGNAL \RAM1|process_0~1_combout\ : std_logic;
SIGNAL \RAM1|ram~186_combout\ : std_logic;
SIGNAL \RAM1|ram~92_q\ : std_logic;
SIGNAL \RAM1|ram~150_combout\ : std_logic;
SIGNAL \RAM1|ram~190_combout\ : std_logic;
SIGNAL \RAM1|ram~44_q\ : std_logic;
SIGNAL \RAM1|ram~183_combout\ : std_logic;
SIGNAL \RAM1|ram~20_q\ : std_logic;
SIGNAL \RAM1|ram~188_combout\ : std_logic;
SIGNAL \RAM1|ram~36_q\ : std_logic;
SIGNAL \RAM1|ram~148_combout\ : std_logic;
SIGNAL \RAM1|ram~189_combout\ : std_logic;
SIGNAL \RAM1|ram~132_q\ : std_logic;
SIGNAL \RAM1|ram~124feeder_combout\ : std_logic;
SIGNAL \RAM1|ram~187_combout\ : std_logic;
SIGNAL \RAM1|ram~124_q\ : std_logic;
SIGNAL \RAM1|ram~151_combout\ : std_logic;
SIGNAL \RAM1|ram~60feeder_combout\ : std_logic;
SIGNAL \RAM1|ram~185_combout\ : std_logic;
SIGNAL \RAM1|ram~60_q\ : std_logic;
SIGNAL \RAM1|ram~184_combout\ : std_logic;
SIGNAL \RAM1|ram~52_q\ : std_logic;
SIGNAL \RAM1|ram~149_combout\ : std_logic;
SIGNAL \RAM1|ram~152_combout\ : std_logic;
SIGNAL \CPU|DECODER|saida[3]~2_combout\ : std_logic;
SIGNAL \CPU|REGA|DOUT[4]~DUPLICATE_q\ : std_logic;
SIGNAL \RAM1|ram~43_q\ : std_logic;
SIGNAL \RAM1|ram~146_combout\ : std_logic;
SIGNAL \RAM1|ram~35_q\ : std_logic;
SIGNAL \RAM1|ram~131_q\ : std_logic;
SIGNAL \RAM1|ram~145_combout\ : std_logic;
SIGNAL \RAM1|ram~19_q\ : std_logic;
SIGNAL \RAM1|ram~51_q\ : std_logic;
SIGNAL \RAM1|ram~143_combout\ : std_logic;
SIGNAL \RAM1|ram~91_q\ : std_logic;
SIGNAL \RAM1|ram~123_q\ : std_logic;
SIGNAL \RAM1|ram~59_q\ : std_logic;
SIGNAL \RAM1|ram~144_combout\ : std_logic;
SIGNAL \RAM1|ram~147_combout\ : std_logic;
SIGNAL \RAM1|ram~90_q\ : std_logic;
SIGNAL \RAM1|ram~180_combout\ : std_logic;
SIGNAL \RAM1|ram~42_q\ : std_logic;
SIGNAL \RAM1|ram~34_q\ : std_logic;
SIGNAL \RAM1|ram~18_q\ : std_logic;
SIGNAL \RAM1|ram~178_combout\ : std_logic;
SIGNAL \RAM1|ram~122_q\ : std_logic;
SIGNAL \RAM1|ram~130_q\ : std_logic;
SIGNAL \RAM1|ram~181_combout\ : std_logic;
SIGNAL \RAM1|ram~50_q\ : std_logic;
SIGNAL \RAM1|ram~58_q\ : std_logic;
SIGNAL \RAM1|ram~179_combout\ : std_logic;
SIGNAL \RAM1|ram~182_combout\ : std_logic;
SIGNAL \RAM1|ram~49_q\ : std_logic;
SIGNAL \RAM1|ram~17_q\ : std_logic;
SIGNAL \RAM1|ram~173_combout\ : std_logic;
SIGNAL \RAM1|ram~89feeder_combout\ : std_logic;
SIGNAL \RAM1|ram~89_q\ : std_logic;
SIGNAL \RAM1|ram~57_q\ : std_logic;
SIGNAL \RAM1|ram~121_q\ : std_logic;
SIGNAL \RAM1|ram~174_combout\ : std_logic;
SIGNAL \RAM1|ram~129_q\ : std_logic;
SIGNAL \RAM1|ram~33_q\ : std_logic;
SIGNAL \RAM1|ram~175_combout\ : std_logic;
SIGNAL \RAM1|ram~41_q\ : std_logic;
SIGNAL \RAM1|ram~176_combout\ : std_logic;
SIGNAL \RAM1|ram~177_combout\ : std_logic;
SIGNAL \ROM1|memROM~17_combout\ : std_logic;
SIGNAL \RAM1|ram~128_q\ : std_logic;
SIGNAL \RAM1|ram~120_q\ : std_logic;
SIGNAL \RAM1|ram~171_combout\ : std_logic;
SIGNAL \RAM1|ram~56_q\ : std_logic;
SIGNAL \RAM1|ram~48_q\ : std_logic;
SIGNAL \RAM1|ram~169_combout\ : std_logic;
SIGNAL \RAM1|ram~88_q\ : std_logic;
SIGNAL \RAM1|ram~170_combout\ : std_logic;
SIGNAL \RAM1|ram~40_q\ : std_logic;
SIGNAL \RAM1|ram~32_q\ : std_logic;
SIGNAL \RAM1|ram~16_q\ : std_logic;
SIGNAL \RAM1|ram~168_combout\ : std_logic;
SIGNAL \RAM1|ram~172_combout\ : std_logic;
SIGNAL \ROM1|memROM~16_combout\ : std_logic;
SIGNAL \RAM1|ram~15_q\ : std_logic;
SIGNAL \RAM1|ram~47_q\ : std_logic;
SIGNAL \RAM1|ram~163_combout\ : std_logic;
SIGNAL \RAM1|ram~31_q\ : std_logic;
SIGNAL \RAM1|ram~127_q\ : std_logic;
SIGNAL \RAM1|ram~165_combout\ : std_logic;
SIGNAL \CPU|REGA|DOUT[0]~DUPLICATE_q\ : std_logic;
SIGNAL \RAM1|ram~39_q\ : std_logic;
SIGNAL \RAM1|ram~166_combout\ : std_logic;
SIGNAL \RAM1|ram~87_q\ : std_logic;
SIGNAL \RAM1|ram~55_q\ : std_logic;
SIGNAL \RAM1|ram~119_q\ : std_logic;
SIGNAL \RAM1|ram~164_combout\ : std_logic;
SIGNAL \RAM1|ram~167_combout\ : std_logic;
SIGNAL \ROM1|memROM~15_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add1~34_cout\ : std_logic;
SIGNAL \CPU|ULA1|Add1~17_sumout\ : std_logic;
SIGNAL \CPU|ULA1|saida[0]~4_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add1~18\ : std_logic;
SIGNAL \CPU|ULA1|Add1~21_sumout\ : std_logic;
SIGNAL \CPU|ULA1|saida[1]~5_combout\ : std_logic;
SIGNAL \CPU|REGA|DOUT[1]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|ULA1|Add1~22\ : std_logic;
SIGNAL \CPU|ULA1|Add1~25_sumout\ : std_logic;
SIGNAL \CPU|ULA1|saida[2]~6_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add1~26\ : std_logic;
SIGNAL \CPU|ULA1|Add1~29_sumout\ : std_logic;
SIGNAL \CPU|ULA1|saida[3]~7_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add1~30\ : std_logic;
SIGNAL \CPU|ULA1|Add1~1_sumout\ : std_logic;
SIGNAL \CPU|ULA1|saida[4]~0_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add1~2\ : std_logic;
SIGNAL \CPU|ULA1|Add1~5_sumout\ : std_logic;
SIGNAL \CPU|FLAG|DOUT~1_combout\ : std_logic;
SIGNAL \CPU|ULA1|saida[6]~2_combout\ : std_logic;
SIGNAL \CPU|REGA|DOUT[6]~DUPLICATE_q\ : std_logic;
SIGNAL \RAM1|ram~133_q\ : std_logic;
SIGNAL \RAM1|ram~37_q\ : std_logic;
SIGNAL \RAM1|ram~155_combout\ : std_logic;
SIGNAL \RAM1|ram~61_q\ : std_logic;
SIGNAL \RAM1|ram~125_q\ : std_logic;
SIGNAL \RAM1|ram~93_q\ : std_logic;
SIGNAL \RAM1|ram~154_combout\ : std_logic;
SIGNAL \RAM1|ram~45_q\ : std_logic;
SIGNAL \RAM1|ram~156_combout\ : std_logic;
SIGNAL \RAM1|ram~21_q\ : std_logic;
SIGNAL \RAM1|ram~53_q\ : std_logic;
SIGNAL \RAM1|ram~153_combout\ : std_logic;
SIGNAL \RAM1|ram~157_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add1~6\ : std_logic;
SIGNAL \CPU|ULA1|Add1~9_sumout\ : std_logic;
SIGNAL \CPU|ULA1|saida[7]~3_combout\ : std_logic;
SIGNAL \RAM1|ram~94_q\ : std_logic;
SIGNAL \RAM1|ram~160_combout\ : std_logic;
SIGNAL \RAM1|ram~126_q\ : std_logic;
SIGNAL \RAM1|ram~134_q\ : std_logic;
SIGNAL \RAM1|ram~161_combout\ : std_logic;
SIGNAL \RAM1|ram~46_q\ : std_logic;
SIGNAL \RAM1|ram~22feeder_combout\ : std_logic;
SIGNAL \RAM1|ram~22_q\ : std_logic;
SIGNAL \RAM1|ram~38_q\ : std_logic;
SIGNAL \RAM1|ram~158_combout\ : std_logic;
SIGNAL \RAM1|ram~54_q\ : std_logic;
SIGNAL \RAM1|ram~62_q\ : std_logic;
SIGNAL \RAM1|ram~159_combout\ : std_logic;
SIGNAL \RAM1|ram~162_combout\ : std_logic;
SIGNAL \CPU|ULA1|Add1~10\ : std_logic;
SIGNAL \CPU|ULA1|Add1~13_sumout\ : std_logic;
SIGNAL \CPU|FLAG|DOUT~2_combout\ : std_logic;
SIGNAL \CPU|FLAG|DOUT~0_combout\ : std_logic;
SIGNAL \CPU|FLAG|DOUT~q\ : std_logic;
SIGNAL \CPU|MUX2|saida_MUX[7]~0_combout\ : std_logic;
SIGNAL \CPU|incrementaPC|Add0~1_sumout\ : std_logic;
SIGNAL \CPU|MUX2|saida_MUX[0]~1_combout\ : std_logic;
SIGNAL \CPU|PC|DOUT[0]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|REGA|DOUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \CPU|PC|DOUT\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \CPU|ENDRET|DOUT\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \CPU|ENDRET|ALT_INV_DOUT\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \CPU|DECODER|ALT_INV_saida~0_combout\ : std_logic;
SIGNAL \CPU|MUX2|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \CPU|MUX2|ALT_INV_saida_MUX[7]~0_combout\ : std_logic;
SIGNAL \CPU|FLAG|ALT_INV_DOUT~q\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~13_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~12_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~11_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~10_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~9_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~8_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~7_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~6_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~5_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~4_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~3_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~2_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~1_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~0_combout\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \CPU|REGA|ALT_INV_DOUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \CPU|ULA1|ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \CPU|ULA1|ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \CPU|ULA1|ALT_INV_Add1~21_sumout\ : std_logic;
SIGNAL \CPU|ULA1|ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \CPU|ULA1|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \CPU|ULA1|ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \CPU|ULA1|ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \CPU|ULA1|ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \CPU|incrementaPC|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \RAM1|ALT_INV_process_0~1_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~182_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~181_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~130_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~122_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~180_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~90_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~179_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~58_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~50_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~178_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~42_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~34_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~18_q\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~17_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~177_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~176_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~41_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~175_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~129_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~33_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~174_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~121_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~89_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~57_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~173_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~49_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~17_q\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~16_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~172_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~171_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~128_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~120_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~170_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~88_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~169_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~56_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~48_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~168_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~40_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~32_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~16_q\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~15_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~167_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~166_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~39_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~165_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~127_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~31_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~164_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~119_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~87_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~55_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~163_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~47_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~15_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~162_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~161_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~134_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~126_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~160_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~94_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~159_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~62_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~54_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~158_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~46_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~38_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~22_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~157_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~156_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~45_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~155_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~133_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~37_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~154_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~125_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~93_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~61_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~153_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~53_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~21_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~152_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~151_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~132_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~124_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~150_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~92_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~149_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~60_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~52_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~148_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~44_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~36_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~20_q\ : std_logic;
SIGNAL \CPU|DECODER|ALT_INV_Equal10~0_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~147_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~146_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~43_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~145_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~131_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~35_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~144_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~123_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~91_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~59_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~143_combout\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~51_q\ : std_logic;
SIGNAL \RAM1|ALT_INV_ram~19_q\ : std_logic;
SIGNAL \CPU|DECODER|ALT_INV_saida~3_combout\ : std_logic;
SIGNAL \CPU|DECODER|ALT_INV_saida[3]~2_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~14_combout\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[6]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[5]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[1]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|REGA|ALT_INV_DOUT[1]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|REGA|ALT_INV_DOUT[5]~DUPLICATE_q\ : std_logic;
SIGNAL \CPU|FLAG|ALT_INV_DOUT~2_combout\ : std_logic;
SIGNAL \CPU|FLAG|ALT_INV_DOUT~1_combout\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
DataAddress <= ww_DataAddress;
endereco <= ww_endereco;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\CPU|ENDRET|ALT_INV_DOUT\(4) <= NOT \CPU|ENDRET|DOUT\(4);
\CPU|DECODER|ALT_INV_saida~0_combout\ <= NOT \CPU|DECODER|saida~0_combout\;
\CPU|ENDRET|ALT_INV_DOUT\(3) <= NOT \CPU|ENDRET|DOUT\(3);
\CPU|ENDRET|ALT_INV_DOUT\(2) <= NOT \CPU|ENDRET|DOUT\(2);
\CPU|ENDRET|ALT_INV_DOUT\(1) <= NOT \CPU|ENDRET|DOUT\(1);
\CPU|ENDRET|ALT_INV_DOUT\(0) <= NOT \CPU|ENDRET|DOUT\(0);
\CPU|MUX2|ALT_INV_Equal1~0_combout\ <= NOT \CPU|MUX2|Equal1~0_combout\;
\CPU|MUX2|ALT_INV_saida_MUX[7]~0_combout\ <= NOT \CPU|MUX2|saida_MUX[7]~0_combout\;
\CPU|FLAG|ALT_INV_DOUT~q\ <= NOT \CPU|FLAG|DOUT~q\;
\ROM1|ALT_INV_memROM~13_combout\ <= NOT \ROM1|memROM~13_combout\;
\ROM1|ALT_INV_memROM~12_combout\ <= NOT \ROM1|memROM~12_combout\;
\ROM1|ALT_INV_memROM~11_combout\ <= NOT \ROM1|memROM~11_combout\;
\ROM1|ALT_INV_memROM~10_combout\ <= NOT \ROM1|memROM~10_combout\;
\ROM1|ALT_INV_memROM~9_combout\ <= NOT \ROM1|memROM~9_combout\;
\ROM1|ALT_INV_memROM~8_combout\ <= NOT \ROM1|memROM~8_combout\;
\ROM1|ALT_INV_memROM~7_combout\ <= NOT \ROM1|memROM~7_combout\;
\ROM1|ALT_INV_memROM~6_combout\ <= NOT \ROM1|memROM~6_combout\;
\ROM1|ALT_INV_memROM~5_combout\ <= NOT \ROM1|memROM~5_combout\;
\ROM1|ALT_INV_memROM~4_combout\ <= NOT \ROM1|memROM~4_combout\;
\ROM1|ALT_INV_memROM~3_combout\ <= NOT \ROM1|memROM~3_combout\;
\ROM1|ALT_INV_memROM~2_combout\ <= NOT \ROM1|memROM~2_combout\;
\ROM1|ALT_INV_memROM~1_combout\ <= NOT \ROM1|memROM~1_combout\;
\ROM1|ALT_INV_memROM~0_combout\ <= NOT \ROM1|memROM~0_combout\;
\CPU|PC|ALT_INV_DOUT\(8) <= NOT \CPU|PC|DOUT\(8);
\CPU|PC|ALT_INV_DOUT\(7) <= NOT \CPU|PC|DOUT\(7);
\CPU|PC|ALT_INV_DOUT\(6) <= NOT \CPU|PC|DOUT\(6);
\CPU|PC|ALT_INV_DOUT\(5) <= NOT \CPU|PC|DOUT\(5);
\CPU|PC|ALT_INV_DOUT\(4) <= NOT \CPU|PC|DOUT\(4);
\CPU|PC|ALT_INV_DOUT\(3) <= NOT \CPU|PC|DOUT\(3);
\CPU|PC|ALT_INV_DOUT\(2) <= NOT \CPU|PC|DOUT\(2);
\CPU|PC|ALT_INV_DOUT\(1) <= NOT \CPU|PC|DOUT\(1);
\CPU|PC|ALT_INV_DOUT\(0) <= NOT \CPU|PC|DOUT\(0);
\CPU|REGA|ALT_INV_DOUT\(3) <= NOT \CPU|REGA|DOUT\(3);
\CPU|REGA|ALT_INV_DOUT\(2) <= NOT \CPU|REGA|DOUT\(2);
\CPU|REGA|ALT_INV_DOUT\(0) <= NOT \CPU|REGA|DOUT\(0);
\CPU|REGA|ALT_INV_DOUT\(7) <= NOT \CPU|REGA|DOUT\(7);
\CPU|REGA|ALT_INV_DOUT\(6) <= NOT \CPU|REGA|DOUT\(6);
\CPU|REGA|ALT_INV_DOUT\(5) <= NOT \CPU|REGA|DOUT\(5);
\CPU|REGA|ALT_INV_DOUT\(4) <= NOT \CPU|REGA|DOUT\(4);
\CPU|ULA1|ALT_INV_Add1~29_sumout\ <= NOT \CPU|ULA1|Add1~29_sumout\;
\CPU|ULA1|ALT_INV_Add1~25_sumout\ <= NOT \CPU|ULA1|Add1~25_sumout\;
\CPU|ULA1|ALT_INV_Add1~21_sumout\ <= NOT \CPU|ULA1|Add1~21_sumout\;
\CPU|ULA1|ALT_INV_Add1~17_sumout\ <= NOT \CPU|ULA1|Add1~17_sumout\;
\CPU|ULA1|ALT_INV_Add1~13_sumout\ <= NOT \CPU|ULA1|Add1~13_sumout\;
\CPU|ULA1|ALT_INV_Add1~9_sumout\ <= NOT \CPU|ULA1|Add1~9_sumout\;
\CPU|ULA1|ALT_INV_Add1~5_sumout\ <= NOT \CPU|ULA1|Add1~5_sumout\;
\CPU|ULA1|ALT_INV_Add1~1_sumout\ <= NOT \CPU|ULA1|Add1~1_sumout\;
\CPU|incrementaPC|ALT_INV_Add0~33_sumout\ <= NOT \CPU|incrementaPC|Add0~33_sumout\;
\CPU|incrementaPC|ALT_INV_Add0~29_sumout\ <= NOT \CPU|incrementaPC|Add0~29_sumout\;
\CPU|incrementaPC|ALT_INV_Add0~25_sumout\ <= NOT \CPU|incrementaPC|Add0~25_sumout\;
\CPU|incrementaPC|ALT_INV_Add0~21_sumout\ <= NOT \CPU|incrementaPC|Add0~21_sumout\;
\CPU|incrementaPC|ALT_INV_Add0~17_sumout\ <= NOT \CPU|incrementaPC|Add0~17_sumout\;
\CPU|incrementaPC|ALT_INV_Add0~13_sumout\ <= NOT \CPU|incrementaPC|Add0~13_sumout\;
\CPU|incrementaPC|ALT_INV_Add0~9_sumout\ <= NOT \CPU|incrementaPC|Add0~9_sumout\;
\CPU|incrementaPC|ALT_INV_Add0~5_sumout\ <= NOT \CPU|incrementaPC|Add0~5_sumout\;
\CPU|incrementaPC|ALT_INV_Add0~1_sumout\ <= NOT \CPU|incrementaPC|Add0~1_sumout\;
\RAM1|ALT_INV_process_0~1_combout\ <= NOT \RAM1|process_0~1_combout\;
\RAM1|ALT_INV_process_0~0_combout\ <= NOT \RAM1|process_0~0_combout\;
\RAM1|ALT_INV_ram~182_combout\ <= NOT \RAM1|ram~182_combout\;
\RAM1|ALT_INV_ram~181_combout\ <= NOT \RAM1|ram~181_combout\;
\RAM1|ALT_INV_ram~130_q\ <= NOT \RAM1|ram~130_q\;
\RAM1|ALT_INV_ram~122_q\ <= NOT \RAM1|ram~122_q\;
\RAM1|ALT_INV_ram~180_combout\ <= NOT \RAM1|ram~180_combout\;
\RAM1|ALT_INV_ram~90_q\ <= NOT \RAM1|ram~90_q\;
\RAM1|ALT_INV_ram~179_combout\ <= NOT \RAM1|ram~179_combout\;
\RAM1|ALT_INV_ram~58_q\ <= NOT \RAM1|ram~58_q\;
\RAM1|ALT_INV_ram~50_q\ <= NOT \RAM1|ram~50_q\;
\RAM1|ALT_INV_ram~178_combout\ <= NOT \RAM1|ram~178_combout\;
\RAM1|ALT_INV_ram~42_q\ <= NOT \RAM1|ram~42_q\;
\RAM1|ALT_INV_ram~34_q\ <= NOT \RAM1|ram~34_q\;
\RAM1|ALT_INV_ram~18_q\ <= NOT \RAM1|ram~18_q\;
\ROM1|ALT_INV_memROM~17_combout\ <= NOT \ROM1|memROM~17_combout\;
\RAM1|ALT_INV_ram~177_combout\ <= NOT \RAM1|ram~177_combout\;
\RAM1|ALT_INV_ram~176_combout\ <= NOT \RAM1|ram~176_combout\;
\RAM1|ALT_INV_ram~41_q\ <= NOT \RAM1|ram~41_q\;
\RAM1|ALT_INV_ram~175_combout\ <= NOT \RAM1|ram~175_combout\;
\RAM1|ALT_INV_ram~129_q\ <= NOT \RAM1|ram~129_q\;
\RAM1|ALT_INV_ram~33_q\ <= NOT \RAM1|ram~33_q\;
\RAM1|ALT_INV_ram~174_combout\ <= NOT \RAM1|ram~174_combout\;
\RAM1|ALT_INV_ram~121_q\ <= NOT \RAM1|ram~121_q\;
\RAM1|ALT_INV_ram~89_q\ <= NOT \RAM1|ram~89_q\;
\RAM1|ALT_INV_ram~57_q\ <= NOT \RAM1|ram~57_q\;
\RAM1|ALT_INV_ram~173_combout\ <= NOT \RAM1|ram~173_combout\;
\RAM1|ALT_INV_ram~49_q\ <= NOT \RAM1|ram~49_q\;
\RAM1|ALT_INV_ram~17_q\ <= NOT \RAM1|ram~17_q\;
\ROM1|ALT_INV_memROM~16_combout\ <= NOT \ROM1|memROM~16_combout\;
\RAM1|ALT_INV_ram~172_combout\ <= NOT \RAM1|ram~172_combout\;
\RAM1|ALT_INV_ram~171_combout\ <= NOT \RAM1|ram~171_combout\;
\RAM1|ALT_INV_ram~128_q\ <= NOT \RAM1|ram~128_q\;
\RAM1|ALT_INV_ram~120_q\ <= NOT \RAM1|ram~120_q\;
\RAM1|ALT_INV_ram~170_combout\ <= NOT \RAM1|ram~170_combout\;
\RAM1|ALT_INV_ram~88_q\ <= NOT \RAM1|ram~88_q\;
\RAM1|ALT_INV_ram~169_combout\ <= NOT \RAM1|ram~169_combout\;
\RAM1|ALT_INV_ram~56_q\ <= NOT \RAM1|ram~56_q\;
\RAM1|ALT_INV_ram~48_q\ <= NOT \RAM1|ram~48_q\;
\RAM1|ALT_INV_ram~168_combout\ <= NOT \RAM1|ram~168_combout\;
\RAM1|ALT_INV_ram~40_q\ <= NOT \RAM1|ram~40_q\;
\RAM1|ALT_INV_ram~32_q\ <= NOT \RAM1|ram~32_q\;
\RAM1|ALT_INV_ram~16_q\ <= NOT \RAM1|ram~16_q\;
\ROM1|ALT_INV_memROM~15_combout\ <= NOT \ROM1|memROM~15_combout\;
\RAM1|ALT_INV_ram~167_combout\ <= NOT \RAM1|ram~167_combout\;
\RAM1|ALT_INV_ram~166_combout\ <= NOT \RAM1|ram~166_combout\;
\RAM1|ALT_INV_ram~39_q\ <= NOT \RAM1|ram~39_q\;
\RAM1|ALT_INV_ram~165_combout\ <= NOT \RAM1|ram~165_combout\;
\RAM1|ALT_INV_ram~127_q\ <= NOT \RAM1|ram~127_q\;
\RAM1|ALT_INV_ram~31_q\ <= NOT \RAM1|ram~31_q\;
\RAM1|ALT_INV_ram~164_combout\ <= NOT \RAM1|ram~164_combout\;
\RAM1|ALT_INV_ram~119_q\ <= NOT \RAM1|ram~119_q\;
\RAM1|ALT_INV_ram~87_q\ <= NOT \RAM1|ram~87_q\;
\RAM1|ALT_INV_ram~55_q\ <= NOT \RAM1|ram~55_q\;
\RAM1|ALT_INV_ram~163_combout\ <= NOT \RAM1|ram~163_combout\;
\RAM1|ALT_INV_ram~47_q\ <= NOT \RAM1|ram~47_q\;
\RAM1|ALT_INV_ram~15_q\ <= NOT \RAM1|ram~15_q\;
\RAM1|ALT_INV_ram~162_combout\ <= NOT \RAM1|ram~162_combout\;
\RAM1|ALT_INV_ram~161_combout\ <= NOT \RAM1|ram~161_combout\;
\RAM1|ALT_INV_ram~134_q\ <= NOT \RAM1|ram~134_q\;
\RAM1|ALT_INV_ram~126_q\ <= NOT \RAM1|ram~126_q\;
\RAM1|ALT_INV_ram~160_combout\ <= NOT \RAM1|ram~160_combout\;
\RAM1|ALT_INV_ram~94_q\ <= NOT \RAM1|ram~94_q\;
\RAM1|ALT_INV_ram~159_combout\ <= NOT \RAM1|ram~159_combout\;
\RAM1|ALT_INV_ram~62_q\ <= NOT \RAM1|ram~62_q\;
\RAM1|ALT_INV_ram~54_q\ <= NOT \RAM1|ram~54_q\;
\RAM1|ALT_INV_ram~158_combout\ <= NOT \RAM1|ram~158_combout\;
\RAM1|ALT_INV_ram~46_q\ <= NOT \RAM1|ram~46_q\;
\RAM1|ALT_INV_ram~38_q\ <= NOT \RAM1|ram~38_q\;
\RAM1|ALT_INV_ram~22_q\ <= NOT \RAM1|ram~22_q\;
\RAM1|ALT_INV_ram~157_combout\ <= NOT \RAM1|ram~157_combout\;
\RAM1|ALT_INV_ram~156_combout\ <= NOT \RAM1|ram~156_combout\;
\RAM1|ALT_INV_ram~45_q\ <= NOT \RAM1|ram~45_q\;
\RAM1|ALT_INV_ram~155_combout\ <= NOT \RAM1|ram~155_combout\;
\RAM1|ALT_INV_ram~133_q\ <= NOT \RAM1|ram~133_q\;
\RAM1|ALT_INV_ram~37_q\ <= NOT \RAM1|ram~37_q\;
\RAM1|ALT_INV_ram~154_combout\ <= NOT \RAM1|ram~154_combout\;
\RAM1|ALT_INV_ram~125_q\ <= NOT \RAM1|ram~125_q\;
\RAM1|ALT_INV_ram~93_q\ <= NOT \RAM1|ram~93_q\;
\RAM1|ALT_INV_ram~61_q\ <= NOT \RAM1|ram~61_q\;
\RAM1|ALT_INV_ram~153_combout\ <= NOT \RAM1|ram~153_combout\;
\RAM1|ALT_INV_ram~53_q\ <= NOT \RAM1|ram~53_q\;
\RAM1|ALT_INV_ram~21_q\ <= NOT \RAM1|ram~21_q\;
\RAM1|ALT_INV_ram~152_combout\ <= NOT \RAM1|ram~152_combout\;
\RAM1|ALT_INV_ram~151_combout\ <= NOT \RAM1|ram~151_combout\;
\RAM1|ALT_INV_ram~132_q\ <= NOT \RAM1|ram~132_q\;
\RAM1|ALT_INV_ram~124_q\ <= NOT \RAM1|ram~124_q\;
\RAM1|ALT_INV_ram~150_combout\ <= NOT \RAM1|ram~150_combout\;
\RAM1|ALT_INV_ram~92_q\ <= NOT \RAM1|ram~92_q\;
\RAM1|ALT_INV_ram~149_combout\ <= NOT \RAM1|ram~149_combout\;
\RAM1|ALT_INV_ram~60_q\ <= NOT \RAM1|ram~60_q\;
\RAM1|ALT_INV_ram~52_q\ <= NOT \RAM1|ram~52_q\;
\RAM1|ALT_INV_ram~148_combout\ <= NOT \RAM1|ram~148_combout\;
\RAM1|ALT_INV_ram~44_q\ <= NOT \RAM1|ram~44_q\;
\RAM1|ALT_INV_ram~36_q\ <= NOT \RAM1|ram~36_q\;
\RAM1|ALT_INV_ram~20_q\ <= NOT \RAM1|ram~20_q\;
\CPU|DECODER|ALT_INV_Equal10~0_combout\ <= NOT \CPU|DECODER|Equal10~0_combout\;
\RAM1|ALT_INV_ram~147_combout\ <= NOT \RAM1|ram~147_combout\;
\RAM1|ALT_INV_ram~146_combout\ <= NOT \RAM1|ram~146_combout\;
\RAM1|ALT_INV_ram~43_q\ <= NOT \RAM1|ram~43_q\;
\RAM1|ALT_INV_ram~145_combout\ <= NOT \RAM1|ram~145_combout\;
\RAM1|ALT_INV_ram~131_q\ <= NOT \RAM1|ram~131_q\;
\RAM1|ALT_INV_ram~35_q\ <= NOT \RAM1|ram~35_q\;
\RAM1|ALT_INV_ram~144_combout\ <= NOT \RAM1|ram~144_combout\;
\RAM1|ALT_INV_ram~123_q\ <= NOT \RAM1|ram~123_q\;
\RAM1|ALT_INV_ram~91_q\ <= NOT \RAM1|ram~91_q\;
\RAM1|ALT_INV_ram~59_q\ <= NOT \RAM1|ram~59_q\;
\RAM1|ALT_INV_ram~143_combout\ <= NOT \RAM1|ram~143_combout\;
\RAM1|ALT_INV_ram~51_q\ <= NOT \RAM1|ram~51_q\;
\RAM1|ALT_INV_ram~19_q\ <= NOT \RAM1|ram~19_q\;
\CPU|DECODER|ALT_INV_saida~3_combout\ <= NOT \CPU|DECODER|saida~3_combout\;
\CPU|DECODER|ALT_INV_saida[3]~2_combout\ <= NOT \CPU|DECODER|saida[3]~2_combout\;
\CPU|ENDRET|ALT_INV_DOUT\(8) <= NOT \CPU|ENDRET|DOUT\(8);
\ROM1|ALT_INV_memROM~14_combout\ <= NOT \ROM1|memROM~14_combout\;
\CPU|ENDRET|ALT_INV_DOUT\(7) <= NOT \CPU|ENDRET|DOUT\(7);
\CPU|ENDRET|ALT_INV_DOUT\(6) <= NOT \CPU|ENDRET|DOUT\(6);
\CPU|ENDRET|ALT_INV_DOUT\(5) <= NOT \CPU|ENDRET|DOUT\(5);
\CPU|PC|ALT_INV_DOUT[6]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[6]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[5]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[5]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[3]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[2]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[1]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[1]~DUPLICATE_q\;
\CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\ <= NOT \CPU|PC|DOUT[0]~DUPLICATE_q\;
\CPU|REGA|ALT_INV_DOUT[1]~DUPLICATE_q\ <= NOT \CPU|REGA|DOUT[1]~DUPLICATE_q\;
\CPU|REGA|ALT_INV_DOUT[5]~DUPLICATE_q\ <= NOT \CPU|REGA|DOUT[5]~DUPLICATE_q\;
\CPU|FLAG|ALT_INV_DOUT~2_combout\ <= NOT \CPU|FLAG|DOUT~2_combout\;
\CPU|FLAG|ALT_INV_DOUT~1_combout\ <= NOT \CPU|FLAG|DOUT~1_combout\;

-- Location: IOOBUF_X0_Y20_N22
\DataAddress[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|PC|DOUT[0]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_DataAddress(0));

-- Location: IOOBUF_X0_Y19_N39
\DataAddress[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|PC|DOUT[1]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_DataAddress(1));

-- Location: IOOBUF_X0_Y20_N39
\DataAddress[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|PC|DOUT[2]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_DataAddress(2));

-- Location: IOOBUF_X0_Y20_N56
\DataAddress[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|PC|DOUT\(3),
	devoe => ww_devoe,
	o => ww_DataAddress(3));

-- Location: IOOBUF_X0_Y21_N5
\DataAddress[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|PC|DOUT\(4),
	devoe => ww_devoe,
	o => ww_DataAddress(4));

-- Location: IOOBUF_X0_Y20_N5
\DataAddress[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|PC|DOUT[5]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_DataAddress(5));

-- Location: IOOBUF_X0_Y21_N39
\DataAddress[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|PC|DOUT[6]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_DataAddress(6));

-- Location: IOOBUF_X10_Y0_N42
\DataAddress[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|PC|DOUT\(7),
	devoe => ww_devoe,
	o => ww_DataAddress(7));

-- Location: IOOBUF_X0_Y19_N5
\DataAddress[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \CPU|PC|DOUT\(8),
	devoe => ww_devoe,
	o => ww_DataAddress(8));

-- Location: IOOBUF_X0_Y19_N22
\endereco[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~2_combout\,
	devoe => ww_devoe,
	o => ww_endereco(0));

-- Location: IOOBUF_X0_Y18_N79
\endereco[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~4_combout\,
	devoe => ww_devoe,
	o => ww_endereco(1));

-- Location: IOOBUF_X0_Y18_N62
\endereco[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~6_combout\,
	devoe => ww_devoe,
	o => ww_endereco(2));

-- Location: IOOBUF_X0_Y18_N96
\endereco[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ROM1|memROM~8_combout\,
	devoe => ww_devoe,
	o => ww_endereco(3));

-- Location: IOOBUF_X19_Y0_N53
\endereco[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_endereco(4));

-- Location: IOOBUF_X29_Y0_N19
\endereco[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_endereco(5));

-- Location: IOIBUF_X54_Y18_N61
\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: CLKCTRL_G10
\KEY[0]~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \KEY[0]~input_o\,
	outclk => \KEY[0]~inputCLKENA0_outclk\);

-- Location: FF_X6_Y20_N34
\CPU|PC|DOUT[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[1]~DUPLICATE_q\);

-- Location: LABCELL_X7_Y20_N30
\CPU|incrementaPC|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~1_sumout\ = SUM(( \CPU|PC|DOUT[0]~DUPLICATE_q\ ) + ( VCC ) + ( !VCC ))
-- \CPU|incrementaPC|Add0~2\ = CARRY(( \CPU|PC|DOUT[0]~DUPLICATE_q\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\,
	cin => GND,
	sumout => \CPU|incrementaPC|Add0~1_sumout\,
	cout => \CPU|incrementaPC|Add0~2\);

-- Location: LABCELL_X7_Y20_N33
\CPU|incrementaPC|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~5_sumout\ = SUM(( \CPU|PC|DOUT[1]~DUPLICATE_q\ ) + ( GND ) + ( \CPU|incrementaPC|Add0~2\ ))
-- \CPU|incrementaPC|Add0~6\ = CARRY(( \CPU|PC|DOUT[1]~DUPLICATE_q\ ) + ( GND ) + ( \CPU|incrementaPC|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT[1]~DUPLICATE_q\,
	cin => \CPU|incrementaPC|Add0~2\,
	sumout => \CPU|incrementaPC|Add0~5_sumout\,
	cout => \CPU|incrementaPC|Add0~6\);

-- Location: LABCELL_X7_Y20_N36
\CPU|incrementaPC|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~9_sumout\ = SUM(( \CPU|PC|DOUT[2]~DUPLICATE_q\ ) + ( GND ) + ( \CPU|incrementaPC|Add0~6\ ))
-- \CPU|incrementaPC|Add0~10\ = CARRY(( \CPU|PC|DOUT[2]~DUPLICATE_q\ ) + ( GND ) + ( \CPU|incrementaPC|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\,
	cin => \CPU|incrementaPC|Add0~6\,
	sumout => \CPU|incrementaPC|Add0~9_sumout\,
	cout => \CPU|incrementaPC|Add0~10\);

-- Location: FF_X7_Y20_N37
\CPU|ENDRET|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~9_sumout\,
	ena => \CPU|DECODER|saida~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|ENDRET|DOUT\(2));

-- Location: FF_X6_Y20_N32
\CPU|PC|DOUT[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[3]~DUPLICATE_q\);

-- Location: FF_X5_Y20_N11
\CPU|PC|DOUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(0));

-- Location: FF_X5_Y20_N26
\CPU|PC|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(2));

-- Location: LABCELL_X5_Y20_N12
\ROM1|memROM~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~5_combout\ = ( \CPU|PC|DOUT\(1) & ( (\CPU|PC|DOUT[3]~DUPLICATE_q\ & (!\CPU|PC|DOUT\(0) & !\CPU|PC|DOUT\(2))) ) ) # ( !\CPU|PC|DOUT\(1) & ( (!\CPU|PC|DOUT\(2) & (!\CPU|PC|DOUT[3]~DUPLICATE_q\)) # (\CPU|PC|DOUT\(2) & ((\CPU|PC|DOUT\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001110100011101000111010001101000000010000000100000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\,
	datab => \CPU|PC|ALT_INV_DOUT\(0),
	datac => \CPU|PC|ALT_INV_DOUT\(2),
	dataf => \CPU|PC|ALT_INV_DOUT\(1),
	combout => \ROM1|memROM~5_combout\);

-- Location: LABCELL_X6_Y20_N48
\ROM1|memROM~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~14_combout\ = ( \CPU|PC|DOUT[2]~DUPLICATE_q\ & ( (\CPU|PC|DOUT\(1) & !\CPU|PC|DOUT[3]~DUPLICATE_q\) ) ) # ( !\CPU|PC|DOUT[2]~DUPLICATE_q\ & ( (\CPU|PC|DOUT\(1) & (\CPU|PC|DOUT[3]~DUPLICATE_q\ & \CPU|PC|DOUT[0]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000101000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(1),
	datab => \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\,
	datac => \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\,
	dataf => \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\,
	combout => \ROM1|memROM~14_combout\);

-- Location: LABCELL_X7_Y20_N48
\CPU|incrementaPC|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~25_sumout\ = SUM(( \CPU|PC|DOUT[6]~DUPLICATE_q\ ) + ( GND ) + ( \CPU|incrementaPC|Add0~22\ ))
-- \CPU|incrementaPC|Add0~26\ = CARRY(( \CPU|PC|DOUT[6]~DUPLICATE_q\ ) + ( GND ) + ( \CPU|incrementaPC|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT[6]~DUPLICATE_q\,
	cin => \CPU|incrementaPC|Add0~22\,
	sumout => \CPU|incrementaPC|Add0~25_sumout\,
	cout => \CPU|incrementaPC|Add0~26\);

-- Location: LABCELL_X7_Y20_N51
\CPU|incrementaPC|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~29_sumout\ = SUM(( \CPU|PC|DOUT\(7) ) + ( GND ) + ( \CPU|incrementaPC|Add0~26\ ))
-- \CPU|incrementaPC|Add0~30\ = CARRY(( \CPU|PC|DOUT\(7) ) + ( GND ) + ( \CPU|incrementaPC|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT\(7),
	cin => \CPU|incrementaPC|Add0~26\,
	sumout => \CPU|incrementaPC|Add0~29_sumout\,
	cout => \CPU|incrementaPC|Add0~30\);

-- Location: FF_X7_Y20_N52
\CPU|ENDRET|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~29_sumout\,
	ena => \CPU|DECODER|saida~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|ENDRET|DOUT\(7));

-- Location: LABCELL_X6_Y20_N51
\ROM1|memROM~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~11_combout\ = ( \CPU|PC|DOUT[2]~DUPLICATE_q\ & ( (\CPU|PC|DOUT\(1) & \CPU|PC|DOUT[0]~DUPLICATE_q\) ) ) # ( !\CPU|PC|DOUT[2]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT\(1) & (!\CPU|PC|DOUT[3]~DUPLICATE_q\ & !\CPU|PC|DOUT[0]~DUPLICATE_q\)) # 
-- (\CPU|PC|DOUT\(1) & (\CPU|PC|DOUT[3]~DUPLICATE_q\ & \CPU|PC|DOUT[0]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000110000001100000011000000100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(1),
	datab => \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\,
	datac => \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\,
	dataf => \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\,
	combout => \ROM1|memROM~11_combout\);

-- Location: LABCELL_X6_Y20_N18
\ROM1|memROM~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~9_combout\ = ( \CPU|PC|DOUT[2]~DUPLICATE_q\ & ( !\CPU|PC|DOUT\(1) $ (((!\CPU|PC|DOUT[0]~DUPLICATE_q\ & !\CPU|PC|DOUT\(3)))) ) ) # ( !\CPU|PC|DOUT[2]~DUPLICATE_q\ & ( !\CPU|PC|DOUT[0]~DUPLICATE_q\ $ (((!\CPU|PC|DOUT\(3) & !\CPU|PC|DOUT\(1)))) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110011001100001111001100110000111111110000000011111111000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\,
	datac => \CPU|PC|ALT_INV_DOUT\(3),
	datad => \CPU|PC|ALT_INV_DOUT\(1),
	dataf => \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\,
	combout => \ROM1|memROM~9_combout\);

-- Location: LABCELL_X6_Y20_N39
\CPU|DECODER|saida~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|DECODER|saida~0_combout\ = ( !\ROM1|memROM~9_combout\ & ( (\ROM1|memROM~10_combout\ & (!\ROM1|memROM~12_combout\ & (\ROM1|memROM~13_combout\ & \ROM1|memROM~11_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~10_combout\,
	datab => \ROM1|ALT_INV_memROM~12_combout\,
	datac => \ROM1|ALT_INV_memROM~13_combout\,
	datad => \ROM1|ALT_INV_memROM~11_combout\,
	dataf => \ROM1|ALT_INV_memROM~9_combout\,
	combout => \CPU|DECODER|saida~0_combout\);

-- Location: LABCELL_X5_Y20_N27
\CPU|MUX2|saida_MUX[7]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX2|saida_MUX[7]~8_combout\ = ( \CPU|DECODER|saida~0_combout\ & ( ((!\CPU|MUX2|saida_MUX[7]~0_combout\ & \CPU|incrementaPC|Add0~29_sumout\)) # (\CPU|ENDRET|DOUT\(7)) ) ) # ( !\CPU|DECODER|saida~0_combout\ & ( (!\CPU|MUX2|saida_MUX[7]~0_combout\ & 
-- \CPU|incrementaPC|Add0~29_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000001111101011110000111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|MUX2|ALT_INV_saida_MUX[7]~0_combout\,
	datac => \CPU|ENDRET|ALT_INV_DOUT\(7),
	datad => \CPU|incrementaPC|ALT_INV_Add0~29_sumout\,
	dataf => \CPU|DECODER|ALT_INV_saida~0_combout\,
	combout => \CPU|MUX2|saida_MUX[7]~8_combout\);

-- Location: FF_X5_Y20_N29
\CPU|PC|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[7]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(7));

-- Location: LABCELL_X7_Y20_N54
\CPU|incrementaPC|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~33_sumout\ = SUM(( \CPU|PC|DOUT\(8) ) + ( GND ) + ( \CPU|incrementaPC|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \CPU|PC|ALT_INV_DOUT\(8),
	cin => \CPU|incrementaPC|Add0~30\,
	sumout => \CPU|incrementaPC|Add0~33_sumout\);

-- Location: FF_X7_Y20_N55
\CPU|ENDRET|DOUT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~33_sumout\,
	ena => \CPU|DECODER|saida~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|ENDRET|DOUT\(8));

-- Location: LABCELL_X6_Y20_N15
\CPU|MUX2|saida_MUX[8]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX2|saida_MUX[8]~9_combout\ = ( \CPU|incrementaPC|Add0~33_sumout\ & ( \CPU|MUX2|saida_MUX[7]~0_combout\ & ( (!\CPU|MUX2|Equal1~0_combout\ & (((\CPU|ENDRET|DOUT\(8))))) # (\CPU|MUX2|Equal1~0_combout\ & (\ROM1|memROM~14_combout\ & 
-- ((\ROM1|memROM~10_combout\)))) ) ) ) # ( !\CPU|incrementaPC|Add0~33_sumout\ & ( \CPU|MUX2|saida_MUX[7]~0_combout\ & ( (!\CPU|MUX2|Equal1~0_combout\ & (((\CPU|ENDRET|DOUT\(8))))) # (\CPU|MUX2|Equal1~0_combout\ & (\ROM1|memROM~14_combout\ & 
-- ((\ROM1|memROM~10_combout\)))) ) ) ) # ( \CPU|incrementaPC|Add0~33_sumout\ & ( !\CPU|MUX2|saida_MUX[7]~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001100000111010000110000011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~14_combout\,
	datab => \CPU|MUX2|ALT_INV_Equal1~0_combout\,
	datac => \CPU|ENDRET|ALT_INV_DOUT\(8),
	datad => \ROM1|ALT_INV_memROM~10_combout\,
	datae => \CPU|incrementaPC|ALT_INV_Add0~33_sumout\,
	dataf => \CPU|MUX2|ALT_INV_saida_MUX[7]~0_combout\,
	combout => \CPU|MUX2|saida_MUX[8]~9_combout\);

-- Location: FF_X5_Y20_N47
\CPU|PC|DOUT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|MUX2|saida_MUX[8]~9_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(8));

-- Location: FF_X5_Y20_N56
\CPU|PC|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[6]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(6));

-- Location: FF_X5_Y20_N8
\CPU|PC|DOUT[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[5]~DUPLICATE_q\);

-- Location: LABCELL_X5_Y20_N33
\ROM1|memROM~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~1_combout\ = ( !\CPU|PC|DOUT[5]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT\(6) & (!\CPU|PC|DOUT\(4) & !\CPU|PC|DOUT\(7))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(6),
	datac => \CPU|PC|ALT_INV_DOUT\(4),
	datad => \CPU|PC|ALT_INV_DOUT\(7),
	dataf => \CPU|PC|ALT_INV_DOUT[5]~DUPLICATE_q\,
	combout => \ROM1|memROM~1_combout\);

-- Location: LABCELL_X5_Y20_N15
\ROM1|memROM~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~6_combout\ = ( \ROM1|memROM~1_combout\ & ( (\ROM1|memROM~5_combout\ & !\CPU|PC|DOUT\(8)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~5_combout\,
	datad => \CPU|PC|ALT_INV_DOUT\(8),
	dataf => \ROM1|ALT_INV_memROM~1_combout\,
	combout => \ROM1|memROM~6_combout\);

-- Location: LABCELL_X5_Y20_N24
\CPU|MUX2|saida_MUX[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX2|saida_MUX[2]~3_combout\ = ( \ROM1|memROM~6_combout\ & ( (!\CPU|MUX2|saida_MUX[7]~0_combout\ & (((\CPU|incrementaPC|Add0~9_sumout\)))) # (\CPU|MUX2|saida_MUX[7]~0_combout\ & (((\CPU|MUX2|Equal1~0_combout\)) # (\CPU|ENDRET|DOUT\(2)))) ) ) # ( 
-- !\ROM1|memROM~6_combout\ & ( (!\CPU|MUX2|saida_MUX[7]~0_combout\ & (((\CPU|incrementaPC|Add0~9_sumout\)))) # (\CPU|MUX2|saida_MUX[7]~0_combout\ & (\CPU|ENDRET|DOUT\(2) & (!\CPU|MUX2|Equal1~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000010111010000100001011101000010101101111110001010110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|MUX2|ALT_INV_saida_MUX[7]~0_combout\,
	datab => \CPU|ENDRET|ALT_INV_DOUT\(2),
	datac => \CPU|MUX2|ALT_INV_Equal1~0_combout\,
	datad => \CPU|incrementaPC|ALT_INV_Add0~9_sumout\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \CPU|MUX2|saida_MUX[2]~3_combout\);

-- Location: FF_X5_Y20_N25
\CPU|PC|DOUT[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[2]~DUPLICATE_q\);

-- Location: LABCELL_X6_Y20_N42
\ROM1|memROM~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~12_combout\ = ( \CPU|PC|DOUT[2]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT[0]~DUPLICATE_q\ & (!\CPU|PC|DOUT\(1) $ (!\CPU|PC|DOUT\(3)))) ) ) # ( !\CPU|PC|DOUT[2]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT[0]~DUPLICATE_q\ & !\CPU|PC|DOUT\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110000001100000001001000010010000100100001001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(1),
	datab => \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\,
	datac => \CPU|PC|ALT_INV_DOUT\(3),
	dataf => \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\,
	combout => \ROM1|memROM~12_combout\);

-- Location: LABCELL_X7_Y20_N3
\CPU|DECODER|saida~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|DECODER|saida~1_combout\ = ( !\ROM1|memROM~9_combout\ & ( \ROM1|memROM~10_combout\ & ( (!\ROM1|memROM~13_combout\ & (\ROM1|memROM~12_combout\ & \ROM1|memROM~11_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000000100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~13_combout\,
	datab => \ROM1|ALT_INV_memROM~12_combout\,
	datac => \ROM1|ALT_INV_memROM~11_combout\,
	datae => \ROM1|ALT_INV_memROM~9_combout\,
	dataf => \ROM1|ALT_INV_memROM~10_combout\,
	combout => \CPU|DECODER|saida~1_combout\);

-- Location: FF_X7_Y20_N34
\CPU|ENDRET|DOUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~5_sumout\,
	ena => \CPU|DECODER|saida~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|ENDRET|DOUT\(1));

-- Location: LABCELL_X5_Y20_N0
\ROM1|memROM~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~3_combout\ = ( \CPU|PC|DOUT[3]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT\(0) & !\CPU|PC|DOUT\(1)) ) ) # ( !\CPU|PC|DOUT[3]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT\(2) & (!\CPU|PC|DOUT\(0) & !\CPU|PC|DOUT\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000011000000110000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(2),
	datab => \CPU|PC|ALT_INV_DOUT\(0),
	datac => \CPU|PC|ALT_INV_DOUT\(1),
	dataf => \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\,
	combout => \ROM1|memROM~3_combout\);

-- Location: LABCELL_X5_Y20_N3
\ROM1|memROM~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~4_combout\ = ( \ROM1|memROM~1_combout\ & ( (!\CPU|PC|DOUT\(8) & \ROM1|memROM~3_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \CPU|PC|ALT_INV_DOUT\(8),
	datad => \ROM1|ALT_INV_memROM~3_combout\,
	dataf => \ROM1|ALT_INV_memROM~1_combout\,
	combout => \ROM1|memROM~4_combout\);

-- Location: LABCELL_X6_Y20_N33
\CPU|MUX2|saida_MUX[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX2|saida_MUX[1]~2_combout\ = ( \ROM1|memROM~4_combout\ & ( (!\CPU|MUX2|saida_MUX[7]~0_combout\ & (((\CPU|incrementaPC|Add0~5_sumout\)))) # (\CPU|MUX2|saida_MUX[7]~0_combout\ & (((\CPU|ENDRET|DOUT\(1))) # (\CPU|MUX2|Equal1~0_combout\))) ) ) # ( 
-- !\ROM1|memROM~4_combout\ & ( (!\CPU|MUX2|saida_MUX[7]~0_combout\ & (((\CPU|incrementaPC|Add0~5_sumout\)))) # (\CPU|MUX2|saida_MUX[7]~0_combout\ & (!\CPU|MUX2|Equal1~0_combout\ & (\CPU|ENDRET|DOUT\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010010101110000001001010111000010101101111110001010110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|MUX2|ALT_INV_saida_MUX[7]~0_combout\,
	datab => \CPU|MUX2|ALT_INV_Equal1~0_combout\,
	datac => \CPU|ENDRET|ALT_INV_DOUT\(1),
	datad => \CPU|incrementaPC|ALT_INV_Add0~5_sumout\,
	dataf => \ROM1|ALT_INV_memROM~4_combout\,
	combout => \CPU|MUX2|saida_MUX[1]~2_combout\);

-- Location: FF_X6_Y20_N35
\CPU|PC|DOUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(1));

-- Location: LABCELL_X6_Y20_N45
\ROM1|memROM~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~13_combout\ = ( \CPU|PC|DOUT[2]~DUPLICATE_q\ & ( (\CPU|PC|DOUT[3]~DUPLICATE_q\ & ((!\CPU|PC|DOUT\(1)) # (\CPU|PC|DOUT[0]~DUPLICATE_q\))) ) ) # ( !\CPU|PC|DOUT[2]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT\(1) & (!\CPU|PC|DOUT[0]~DUPLICATE_q\ $ 
-- (!\CPU|PC|DOUT[3]~DUPLICATE_q\))) # (\CPU|PC|DOUT\(1) & (!\CPU|PC|DOUT[0]~DUPLICATE_q\ & !\CPU|PC|DOUT[3]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100001101000011010000110100000001011000010110000101100001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(1),
	datab => \CPU|PC|ALT_INV_DOUT[0]~DUPLICATE_q\,
	datac => \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\,
	dataf => \CPU|PC|ALT_INV_DOUT[2]~DUPLICATE_q\,
	combout => \ROM1|memROM~13_combout\);

-- Location: LABCELL_X7_Y20_N18
\CPU|MUX2|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX2|Equal1~0_combout\ = ( \ROM1|memROM~9_combout\ & ( \ROM1|memROM~10_combout\ & ( (\ROM1|memROM~13_combout\ & (!\ROM1|memROM~11_combout\ & ((!\ROM1|memROM~12_combout\) # (\CPU|FLAG|DOUT~q\)))) ) ) ) # ( !\ROM1|memROM~9_combout\ & ( 
-- \ROM1|memROM~10_combout\ & ( (!\ROM1|memROM~13_combout\ & (\ROM1|memROM~12_combout\ & \ROM1|memROM~11_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001000100100010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~13_combout\,
	datab => \ROM1|ALT_INV_memROM~12_combout\,
	datac => \CPU|FLAG|ALT_INV_DOUT~q\,
	datad => \ROM1|ALT_INV_memROM~11_combout\,
	datae => \ROM1|ALT_INV_memROM~9_combout\,
	dataf => \ROM1|ALT_INV_memROM~10_combout\,
	combout => \CPU|MUX2|Equal1~0_combout\);

-- Location: LABCELL_X7_Y20_N39
\CPU|incrementaPC|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~13_sumout\ = SUM(( \CPU|PC|DOUT\(3) ) + ( GND ) + ( \CPU|incrementaPC|Add0~10\ ))
-- \CPU|incrementaPC|Add0~14\ = CARRY(( \CPU|PC|DOUT\(3) ) + ( GND ) + ( \CPU|incrementaPC|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(3),
	cin => \CPU|incrementaPC|Add0~10\,
	sumout => \CPU|incrementaPC|Add0~13_sumout\,
	cout => \CPU|incrementaPC|Add0~14\);

-- Location: FF_X7_Y20_N40
\CPU|ENDRET|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~13_sumout\,
	ena => \CPU|DECODER|saida~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|ENDRET|DOUT\(3));

-- Location: LABCELL_X5_Y20_N39
\ROM1|memROM~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~7_combout\ = ( \CPU|PC|DOUT\(1) & ( (!\CPU|PC|DOUT\(2) & (!\CPU|PC|DOUT\(0) & !\CPU|PC|DOUT\(3))) ) ) # ( !\CPU|PC|DOUT\(1) & ( (!\CPU|PC|DOUT\(2) & (!\CPU|PC|DOUT\(0) & !\CPU|PC|DOUT\(3))) # (\CPU|PC|DOUT\(2) & (\CPU|PC|DOUT\(0) & 
-- \CPU|PC|DOUT\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000101101000000000010110100000000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(2),
	datac => \CPU|PC|ALT_INV_DOUT\(0),
	datad => \CPU|PC|ALT_INV_DOUT\(3),
	dataf => \CPU|PC|ALT_INV_DOUT\(1),
	combout => \ROM1|memROM~7_combout\);

-- Location: LABCELL_X5_Y20_N36
\ROM1|memROM~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~8_combout\ = ( \ROM1|memROM~1_combout\ & ( (\ROM1|memROM~7_combout\ & !\CPU|PC|DOUT\(8)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM1|ALT_INV_memROM~7_combout\,
	datad => \CPU|PC|ALT_INV_DOUT\(8),
	dataf => \ROM1|ALT_INV_memROM~1_combout\,
	combout => \ROM1|memROM~8_combout\);

-- Location: LABCELL_X6_Y20_N30
\CPU|MUX2|saida_MUX[3]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX2|saida_MUX[3]~4_combout\ = ( \ROM1|memROM~8_combout\ & ( (!\CPU|MUX2|saida_MUX[7]~0_combout\ & (((\CPU|incrementaPC|Add0~13_sumout\)))) # (\CPU|MUX2|saida_MUX[7]~0_combout\ & (((\CPU|ENDRET|DOUT\(3))) # (\CPU|MUX2|Equal1~0_combout\))) ) ) # ( 
-- !\ROM1|memROM~8_combout\ & ( (!\CPU|MUX2|saida_MUX[7]~0_combout\ & (((\CPU|incrementaPC|Add0~13_sumout\)))) # (\CPU|MUX2|saida_MUX[7]~0_combout\ & (!\CPU|MUX2|Equal1~0_combout\ & ((\CPU|ENDRET|DOUT\(3))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101001001110000010100100111000011011010111110001101101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|MUX2|ALT_INV_saida_MUX[7]~0_combout\,
	datab => \CPU|MUX2|ALT_INV_Equal1~0_combout\,
	datac => \CPU|incrementaPC|ALT_INV_Add0~13_sumout\,
	datad => \CPU|ENDRET|ALT_INV_DOUT\(3),
	dataf => \ROM1|ALT_INV_memROM~8_combout\,
	combout => \CPU|MUX2|saida_MUX[3]~4_combout\);

-- Location: FF_X6_Y20_N31
\CPU|PC|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(3));

-- Location: LABCELL_X7_Y20_N42
\CPU|incrementaPC|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~17_sumout\ = SUM(( \CPU|PC|DOUT\(4) ) + ( GND ) + ( \CPU|incrementaPC|Add0~14\ ))
-- \CPU|incrementaPC|Add0~18\ = CARRY(( \CPU|PC|DOUT\(4) ) + ( GND ) + ( \CPU|incrementaPC|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \CPU|PC|ALT_INV_DOUT\(4),
	cin => \CPU|incrementaPC|Add0~14\,
	sumout => \CPU|incrementaPC|Add0~17_sumout\,
	cout => \CPU|incrementaPC|Add0~18\);

-- Location: FF_X7_Y20_N43
\CPU|ENDRET|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~17_sumout\,
	ena => \CPU|DECODER|saida~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|ENDRET|DOUT\(4));

-- Location: LABCELL_X6_Y20_N21
\CPU|MUX2|saida_MUX[4]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX2|saida_MUX[4]~5_combout\ = ( \CPU|incrementaPC|Add0~17_sumout\ & ( (!\CPU|MUX2|saida_MUX[7]~0_combout\) # ((\CPU|ENDRET|DOUT\(4) & \CPU|DECODER|saida~0_combout\)) ) ) # ( !\CPU|incrementaPC|Add0~17_sumout\ & ( (\CPU|ENDRET|DOUT\(4) & 
-- \CPU|DECODER|saida~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010111110000111101011111000011110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|ENDRET|ALT_INV_DOUT\(4),
	datac => \CPU|MUX2|ALT_INV_saida_MUX[7]~0_combout\,
	datad => \CPU|DECODER|ALT_INV_saida~0_combout\,
	dataf => \CPU|incrementaPC|ALT_INV_Add0~17_sumout\,
	combout => \CPU|MUX2|saida_MUX[4]~5_combout\);

-- Location: FF_X5_Y20_N44
\CPU|PC|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|MUX2|saida_MUX[4]~5_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(4));

-- Location: LABCELL_X7_Y20_N45
\CPU|incrementaPC|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|incrementaPC|Add0~21_sumout\ = SUM(( \CPU|PC|DOUT\(5) ) + ( GND ) + ( \CPU|incrementaPC|Add0~18\ ))
-- \CPU|incrementaPC|Add0~22\ = CARRY(( \CPU|PC|DOUT\(5) ) + ( GND ) + ( \CPU|incrementaPC|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \CPU|PC|ALT_INV_DOUT\(5),
	cin => \CPU|incrementaPC|Add0~18\,
	sumout => \CPU|incrementaPC|Add0~21_sumout\,
	cout => \CPU|incrementaPC|Add0~22\);

-- Location: FF_X7_Y20_N46
\CPU|ENDRET|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~21_sumout\,
	ena => \CPU|DECODER|saida~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|ENDRET|DOUT\(5));

-- Location: LABCELL_X5_Y20_N6
\CPU|MUX2|saida_MUX[5]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX2|saida_MUX[5]~6_combout\ = ( \CPU|DECODER|saida~0_combout\ & ( ((!\CPU|MUX2|saida_MUX[7]~0_combout\ & \CPU|incrementaPC|Add0~21_sumout\)) # (\CPU|ENDRET|DOUT\(5)) ) ) # ( !\CPU|DECODER|saida~0_combout\ & ( (!\CPU|MUX2|saida_MUX[7]~0_combout\ & 
-- \CPU|incrementaPC|Add0~21_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000001010111111110000101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|MUX2|ALT_INV_saida_MUX[7]~0_combout\,
	datac => \CPU|incrementaPC|ALT_INV_Add0~21_sumout\,
	datad => \CPU|ENDRET|ALT_INV_DOUT\(5),
	dataf => \CPU|DECODER|ALT_INV_saida~0_combout\,
	combout => \CPU|MUX2|saida_MUX[5]~6_combout\);

-- Location: FF_X5_Y20_N7
\CPU|PC|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT\(5));

-- Location: FF_X7_Y20_N49
\CPU|ENDRET|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~25_sumout\,
	ena => \CPU|DECODER|saida~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|ENDRET|DOUT\(6));

-- Location: LABCELL_X5_Y20_N54
\CPU|MUX2|saida_MUX[6]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX2|saida_MUX[6]~7_combout\ = ( \CPU|DECODER|saida~0_combout\ & ( ((\CPU|incrementaPC|Add0~25_sumout\ & !\CPU|MUX2|saida_MUX[7]~0_combout\)) # (\CPU|ENDRET|DOUT\(6)) ) ) # ( !\CPU|DECODER|saida~0_combout\ & ( (\CPU|incrementaPC|Add0~25_sumout\ & 
-- !\CPU|MUX2|saida_MUX[7]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000001011111010101010101111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|ENDRET|ALT_INV_DOUT\(6),
	datac => \CPU|incrementaPC|ALT_INV_Add0~25_sumout\,
	datad => \CPU|MUX2|ALT_INV_saida_MUX[7]~0_combout\,
	dataf => \CPU|DECODER|ALT_INV_saida~0_combout\,
	combout => \CPU|MUX2|saida_MUX[6]~7_combout\);

-- Location: FF_X5_Y20_N55
\CPU|PC|DOUT[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[6]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[6]~DUPLICATE_q\);

-- Location: LABCELL_X6_Y20_N54
\ROM1|memROM~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~10_combout\ = ( !\CPU|PC|DOUT\(8) & ( (!\CPU|PC|DOUT[6]~DUPLICATE_q\ & (!\CPU|PC|DOUT\(7) & (!\CPU|PC|DOUT\(5) & !\CPU|PC|DOUT\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT[6]~DUPLICATE_q\,
	datab => \CPU|PC|ALT_INV_DOUT\(7),
	datac => \CPU|PC|ALT_INV_DOUT\(5),
	datad => \CPU|PC|ALT_INV_DOUT\(4),
	dataf => \CPU|PC|ALT_INV_DOUT\(8),
	combout => \ROM1|memROM~10_combout\);

-- Location: LABCELL_X6_Y20_N36
\CPU|DECODER|Equal10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|DECODER|Equal10~0_combout\ = ( \ROM1|memROM~9_combout\ & ( \ROM1|memROM~10_combout\ ) ) # ( !\ROM1|memROM~9_combout\ & ( (\ROM1|memROM~10_combout\ & (((\ROM1|memROM~13_combout\) # (\ROM1|memROM~11_combout\)) # (\ROM1|memROM~12_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010101010101000101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~10_combout\,
	datab => \ROM1|ALT_INV_memROM~12_combout\,
	datac => \ROM1|ALT_INV_memROM~11_combout\,
	datad => \ROM1|ALT_INV_memROM~13_combout\,
	dataf => \ROM1|ALT_INV_memROM~9_combout\,
	combout => \CPU|DECODER|Equal10~0_combout\);

-- Location: LABCELL_X6_Y20_N0
\CPU|DECODER|saida~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|DECODER|saida~3_combout\ = ( \ROM1|memROM~9_combout\ & ( (!\ROM1|memROM~10_combout\) # (((\ROM1|memROM~13_combout\) # (\ROM1|memROM~11_combout\)) # (\ROM1|memROM~12_combout\)) ) ) # ( !\ROM1|memROM~9_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111110111111111111111011111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~10_combout\,
	datab => \ROM1|ALT_INV_memROM~12_combout\,
	datac => \ROM1|ALT_INV_memROM~11_combout\,
	datad => \ROM1|ALT_INV_memROM~13_combout\,
	dataf => \ROM1|ALT_INV_memROM~9_combout\,
	combout => \CPU|DECODER|saida~3_combout\);

-- Location: LABCELL_X5_Y18_N27
\CPU|ULA1|saida[5]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|saida[5]~1_combout\ = ( \CPU|ULA1|Add1~5_sumout\ & ( \CPU|DECODER|saida~3_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \CPU|DECODER|ALT_INV_saida~3_combout\,
	dataf => \CPU|ULA1|ALT_INV_Add1~5_sumout\,
	combout => \CPU|ULA1|saida[5]~1_combout\);

-- Location: LABCELL_X6_Y20_N3
\CPU|DECODER|saida[5]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|DECODER|saida[5]~4_combout\ = ( \ROM1|memROM~9_combout\ & ( (\ROM1|memROM~10_combout\ & (!\ROM1|memROM~12_combout\ & (!\ROM1|memROM~13_combout\ & !\ROM1|memROM~11_combout\))) ) ) # ( !\ROM1|memROM~9_combout\ & ( (\ROM1|memROM~10_combout\ & 
-- (!\ROM1|memROM~11_combout\ & ((\ROM1|memROM~13_combout\) # (\ROM1|memROM~12_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010100000000000101010000000001000000000000000100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~10_combout\,
	datab => \ROM1|ALT_INV_memROM~12_combout\,
	datac => \ROM1|ALT_INV_memROM~13_combout\,
	datad => \ROM1|ALT_INV_memROM~11_combout\,
	dataf => \ROM1|ALT_INV_memROM~9_combout\,
	combout => \CPU|DECODER|saida[5]~4_combout\);

-- Location: FF_X5_Y18_N29
\CPU|REGA|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[5]~1_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(5));

-- Location: FF_X5_Y18_N28
\CPU|REGA|DOUT[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[5]~1_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT[5]~DUPLICATE_q\);

-- Location: LABCELL_X5_Y20_N51
\ROM1|memROM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~0_combout\ = ( \CPU|PC|DOUT[3]~DUPLICATE_q\ & ( (\CPU|PC|DOUT\(2) & !\CPU|PC|DOUT\(1)) ) ) # ( !\CPU|PC|DOUT[3]~DUPLICATE_q\ & ( (!\CPU|PC|DOUT\(0) & (!\CPU|PC|DOUT\(2) & \CPU|PC|DOUT\(1))) # (\CPU|PC|DOUT\(0) & ((!\CPU|PC|DOUT\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111110100000000011111010000001010101000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(2),
	datac => \CPU|PC|ALT_INV_DOUT\(0),
	datad => \CPU|PC|ALT_INV_DOUT\(1),
	dataf => \CPU|PC|ALT_INV_DOUT[3]~DUPLICATE_q\,
	combout => \ROM1|memROM~0_combout\);

-- Location: LABCELL_X5_Y20_N48
\ROM1|memROM~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~2_combout\ = ( \ROM1|memROM~0_combout\ & ( (\ROM1|memROM~1_combout\ & !\CPU|PC|DOUT\(8)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \CPU|PC|ALT_INV_DOUT\(8),
	dataf => \ROM1|ALT_INV_memROM~0_combout\,
	combout => \ROM1|memROM~2_combout\);

-- Location: LABCELL_X6_Y20_N57
\RAM1|process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|process_0~0_combout\ = ( !\CPU|PC|DOUT\(8) & ( (!\CPU|PC|DOUT[6]~DUPLICATE_q\ & !\CPU|PC|DOUT\(7)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT[6]~DUPLICATE_q\,
	datad => \CPU|PC|ALT_INV_DOUT\(7),
	dataf => \CPU|PC|ALT_INV_DOUT\(8),
	combout => \RAM1|process_0~0_combout\);

-- Location: LABCELL_X6_Y20_N9
\RAM1|process_0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|process_0~1_combout\ = ( \ROM1|memROM~10_combout\ & ( \ROM1|memROM~12_combout\ & ( (\ROM1|memROM~9_combout\ & (!\ROM1|memROM~13_combout\ & (\RAM1|process_0~0_combout\ & !\ROM1|memROM~11_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~9_combout\,
	datab => \ROM1|ALT_INV_memROM~13_combout\,
	datac => \RAM1|ALT_INV_process_0~0_combout\,
	datad => \ROM1|ALT_INV_memROM~11_combout\,
	datae => \ROM1|ALT_INV_memROM~10_combout\,
	dataf => \ROM1|ALT_INV_memROM~12_combout\,
	combout => \RAM1|process_0~1_combout\);

-- Location: MLABCELL_X4_Y19_N24
\RAM1|ram~186\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~186_combout\ = ( \RAM1|process_0~1_combout\ & ( \ROM1|memROM~8_combout\ & ( (!\ROM1|memROM~4_combout\ & (\ROM1|memROM~2_combout\ & !\ROM1|memROM~6_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM1|ALT_INV_memROM~4_combout\,
	datac => \ROM1|ALT_INV_memROM~2_combout\,
	datad => \ROM1|ALT_INV_memROM~6_combout\,
	datae => \RAM1|ALT_INV_process_0~1_combout\,
	dataf => \ROM1|ALT_INV_memROM~8_combout\,
	combout => \RAM1|ram~186_combout\);

-- Location: FF_X4_Y19_N25
\RAM1|ram~92\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[5]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~186_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~92_q\);

-- Location: LABCELL_X5_Y19_N33
\RAM1|ram~150\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~150_combout\ = ( \ROM1|memROM~2_combout\ & ( (\RAM1|ram~92_q\ & !\ROM1|memROM~4_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \RAM1|ALT_INV_ram~92_q\,
	datad => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \ROM1|ALT_INV_memROM~2_combout\,
	combout => \RAM1|ram~150_combout\);

-- Location: LABCELL_X5_Y19_N36
\RAM1|ram~190\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~190_combout\ = ( \RAM1|process_0~1_combout\ & ( (\ROM1|memROM~4_combout\ & (\ROM1|memROM~2_combout\ & (!\ROM1|memROM~6_combout\ & !\ROM1|memROM~8_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010000000000000001000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \ROM1|ALT_INV_memROM~2_combout\,
	datac => \ROM1|ALT_INV_memROM~6_combout\,
	datad => \ROM1|ALT_INV_memROM~8_combout\,
	dataf => \RAM1|ALT_INV_process_0~1_combout\,
	combout => \RAM1|ram~190_combout\);

-- Location: FF_X5_Y19_N34
\RAM1|ram~44\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[5]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~44_q\);

-- Location: LABCELL_X5_Y19_N9
\RAM1|ram~183\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~183_combout\ = ( \RAM1|process_0~1_combout\ & ( (!\ROM1|memROM~6_combout\ & (!\ROM1|memROM~8_combout\ & (!\ROM1|memROM~2_combout\ & !\ROM1|memROM~4_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~6_combout\,
	datab => \ROM1|ALT_INV_memROM~8_combout\,
	datac => \ROM1|ALT_INV_memROM~2_combout\,
	datad => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \RAM1|ALT_INV_process_0~1_combout\,
	combout => \RAM1|ram~183_combout\);

-- Location: FF_X5_Y19_N44
\RAM1|ram~20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[5]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~183_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~20_q\);

-- Location: LABCELL_X6_Y19_N51
\RAM1|ram~188\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~188_combout\ = ( \ROM1|memROM~4_combout\ & ( \RAM1|process_0~1_combout\ & ( (!\ROM1|memROM~8_combout\ & (!\ROM1|memROM~2_combout\ & !\ROM1|memROM~6_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM1|ALT_INV_memROM~8_combout\,
	datac => \ROM1|ALT_INV_memROM~2_combout\,
	datad => \ROM1|ALT_INV_memROM~6_combout\,
	datae => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \RAM1|ALT_INV_process_0~1_combout\,
	combout => \RAM1|ram~188_combout\);

-- Location: FF_X6_Y19_N53
\RAM1|ram~36\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[5]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~188_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~36_q\);

-- Location: LABCELL_X5_Y19_N3
\RAM1|ram~148\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~148_combout\ = ( \ROM1|memROM~2_combout\ & ( \ROM1|memROM~4_combout\ & ( \RAM1|ram~44_q\ ) ) ) # ( !\ROM1|memROM~2_combout\ & ( \ROM1|memROM~4_combout\ & ( \RAM1|ram~36_q\ ) ) ) # ( !\ROM1|memROM~2_combout\ & ( !\ROM1|memROM~4_combout\ & ( 
-- \RAM1|ram~20_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000000000111111110101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~44_q\,
	datac => \RAM1|ALT_INV_ram~20_q\,
	datad => \RAM1|ALT_INV_ram~36_q\,
	datae => \ROM1|ALT_INV_memROM~2_combout\,
	dataf => \ROM1|ALT_INV_memROM~4_combout\,
	combout => \RAM1|ram~148_combout\);

-- Location: MLABCELL_X4_Y20_N6
\RAM1|ram~189\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~189_combout\ = ( \RAM1|process_0~1_combout\ & ( \ROM1|memROM~6_combout\ & ( (!\ROM1|memROM~2_combout\ & (\ROM1|memROM~4_combout\ & \ROM1|memROM~8_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM1|ALT_INV_memROM~2_combout\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datad => \ROM1|ALT_INV_memROM~8_combout\,
	datae => \RAM1|ALT_INV_process_0~1_combout\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \RAM1|ram~189_combout\);

-- Location: FF_X4_Y20_N53
\RAM1|ram~132\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[5]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~189_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~132_q\);

-- Location: MLABCELL_X4_Y20_N57
\RAM1|ram~124feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~124feeder_combout\ = ( \CPU|REGA|DOUT[5]~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT[5]~DUPLICATE_q\,
	combout => \RAM1|ram~124feeder_combout\);

-- Location: MLABCELL_X4_Y20_N39
\RAM1|ram~187\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~187_combout\ = ( \RAM1|process_0~1_combout\ & ( \ROM1|memROM~6_combout\ & ( (!\ROM1|memROM~4_combout\ & (\ROM1|memROM~8_combout\ & \ROM1|memROM~2_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000001000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \ROM1|ALT_INV_memROM~8_combout\,
	datac => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \RAM1|ALT_INV_process_0~1_combout\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \RAM1|ram~187_combout\);

-- Location: FF_X4_Y20_N59
\RAM1|ram~124\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \RAM1|ram~124feeder_combout\,
	ena => \RAM1|ram~187_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~124_q\);

-- Location: MLABCELL_X4_Y20_N48
\RAM1|ram~151\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~151_combout\ = ( !\ROM1|memROM~4_combout\ & ( \ROM1|memROM~2_combout\ & ( \RAM1|ram~124_q\ ) ) ) # ( \ROM1|memROM~4_combout\ & ( !\ROM1|memROM~2_combout\ & ( \RAM1|ram~132_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \RAM1|ALT_INV_ram~132_q\,
	datad => \RAM1|ALT_INV_ram~124_q\,
	datae => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \ROM1|ALT_INV_memROM~2_combout\,
	combout => \RAM1|ram~151_combout\);

-- Location: MLABCELL_X4_Y19_N33
\RAM1|ram~60feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~60feeder_combout\ = ( \CPU|REGA|DOUT[5]~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT[5]~DUPLICATE_q\,
	combout => \RAM1|ram~60feeder_combout\);

-- Location: MLABCELL_X4_Y19_N0
\RAM1|ram~185\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~185_combout\ = ( !\ROM1|memROM~4_combout\ & ( !\ROM1|memROM~8_combout\ & ( (\ROM1|memROM~2_combout\ & (\RAM1|process_0~1_combout\ & \ROM1|memROM~6_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM1|ALT_INV_memROM~2_combout\,
	datac => \RAM1|ALT_INV_process_0~1_combout\,
	datad => \ROM1|ALT_INV_memROM~6_combout\,
	datae => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \ROM1|ALT_INV_memROM~8_combout\,
	combout => \RAM1|ram~185_combout\);

-- Location: FF_X4_Y19_N34
\RAM1|ram~60\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \RAM1|ram~60feeder_combout\,
	ena => \RAM1|ram~185_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~60_q\);

-- Location: MLABCELL_X4_Y19_N6
\RAM1|ram~184\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~184_combout\ = ( \RAM1|process_0~1_combout\ & ( !\ROM1|memROM~8_combout\ & ( (!\ROM1|memROM~4_combout\ & (!\ROM1|memROM~2_combout\ & \ROM1|memROM~6_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM1|ALT_INV_memROM~4_combout\,
	datac => \ROM1|ALT_INV_memROM~2_combout\,
	datad => \ROM1|ALT_INV_memROM~6_combout\,
	datae => \RAM1|ALT_INV_process_0~1_combout\,
	dataf => \ROM1|ALT_INV_memROM~8_combout\,
	combout => \RAM1|ram~184_combout\);

-- Location: FF_X4_Y19_N7
\RAM1|ram~52\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[5]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~184_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~52_q\);

-- Location: LABCELL_X5_Y19_N39
\RAM1|ram~149\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~149_combout\ = ( \RAM1|ram~52_q\ & ( (!\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~2_combout\) # (\RAM1|ram~60_q\))) ) ) # ( !\RAM1|ram~52_q\ & ( (!\ROM1|memROM~4_combout\ & (\ROM1|memROM~2_combout\ & \RAM1|ram~60_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000100000001010001010100010101000101010001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \ROM1|ALT_INV_memROM~2_combout\,
	datac => \RAM1|ALT_INV_ram~60_q\,
	dataf => \RAM1|ALT_INV_ram~52_q\,
	combout => \RAM1|ram~149_combout\);

-- Location: LABCELL_X5_Y19_N12
\RAM1|ram~152\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~152_combout\ = ( \RAM1|ram~151_combout\ & ( \RAM1|ram~149_combout\ & ( ((!\ROM1|memROM~8_combout\ & ((\RAM1|ram~148_combout\))) # (\ROM1|memROM~8_combout\ & (\RAM1|ram~150_combout\))) # (\ROM1|memROM~6_combout\) ) ) ) # ( !\RAM1|ram~151_combout\ 
-- & ( \RAM1|ram~149_combout\ & ( (!\ROM1|memROM~6_combout\ & ((!\ROM1|memROM~8_combout\ & ((\RAM1|ram~148_combout\))) # (\ROM1|memROM~8_combout\ & (\RAM1|ram~150_combout\)))) # (\ROM1|memROM~6_combout\ & (((!\ROM1|memROM~8_combout\)))) ) ) ) # ( 
-- \RAM1|ram~151_combout\ & ( !\RAM1|ram~149_combout\ & ( (!\ROM1|memROM~6_combout\ & ((!\ROM1|memROM~8_combout\ & ((\RAM1|ram~148_combout\))) # (\ROM1|memROM~8_combout\ & (\RAM1|ram~150_combout\)))) # (\ROM1|memROM~6_combout\ & 
-- (((\ROM1|memROM~8_combout\)))) ) ) ) # ( !\RAM1|ram~151_combout\ & ( !\RAM1|ram~149_combout\ & ( (!\ROM1|memROM~6_combout\ & ((!\ROM1|memROM~8_combout\ & ((\RAM1|ram~148_combout\))) # (\ROM1|memROM~8_combout\ & (\RAM1|ram~150_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110001000100000011000111011100111111010001000011111101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~150_combout\,
	datab => \ROM1|ALT_INV_memROM~6_combout\,
	datac => \RAM1|ALT_INV_ram~148_combout\,
	datad => \ROM1|ALT_INV_memROM~8_combout\,
	datae => \RAM1|ALT_INV_ram~151_combout\,
	dataf => \RAM1|ALT_INV_ram~149_combout\,
	combout => \RAM1|ram~152_combout\);

-- Location: LABCELL_X6_Y20_N27
\CPU|DECODER|saida[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|DECODER|saida[3]~2_combout\ = ( \ROM1|memROM~9_combout\ & ( !\ROM1|memROM~10_combout\ ) ) # ( !\ROM1|memROM~9_combout\ & ( (!\ROM1|memROM~10_combout\) # ((!\ROM1|memROM~11_combout\ & !\ROM1|memROM~13_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111110100000111111111010000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~11_combout\,
	datac => \ROM1|ALT_INV_memROM~13_combout\,
	datad => \ROM1|ALT_INV_memROM~10_combout\,
	dataf => \ROM1|ALT_INV_memROM~9_combout\,
	combout => \CPU|DECODER|saida[3]~2_combout\);

-- Location: FF_X6_Y18_N52
\CPU|REGA|DOUT[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[4]~0_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT[4]~DUPLICATE_q\);

-- Location: FF_X5_Y19_N50
\RAM1|ram~43\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[4]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~43_q\);

-- Location: MLABCELL_X4_Y19_N36
\RAM1|ram~146\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~146_combout\ = ( !\ROM1|memROM~6_combout\ & ( !\ROM1|memROM~8_combout\ & ( \RAM1|ram~43_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \RAM1|ALT_INV_ram~43_q\,
	datae => \ROM1|ALT_INV_memROM~6_combout\,
	dataf => \ROM1|ALT_INV_memROM~8_combout\,
	combout => \RAM1|ram~146_combout\);

-- Location: FF_X5_Y19_N16
\RAM1|ram~35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[4]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~188_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~35_q\);

-- Location: FF_X4_Y20_N41
\RAM1|ram~131\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[4]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~189_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~131_q\);

-- Location: MLABCELL_X4_Y20_N0
\RAM1|ram~145\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~145_combout\ = ( \ROM1|memROM~8_combout\ & ( \ROM1|memROM~6_combout\ & ( \RAM1|ram~131_q\ ) ) ) # ( !\ROM1|memROM~8_combout\ & ( !\ROM1|memROM~6_combout\ & ( \RAM1|ram~35_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \RAM1|ALT_INV_ram~35_q\,
	datad => \RAM1|ALT_INV_ram~131_q\,
	datae => \ROM1|ALT_INV_memROM~8_combout\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \RAM1|ram~145_combout\);

-- Location: FF_X5_Y19_N19
\RAM1|ram~19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[4]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~183_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~19_q\);

-- Location: FF_X4_Y19_N23
\RAM1|ram~51\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[4]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~184_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~51_q\);

-- Location: MLABCELL_X4_Y19_N21
\RAM1|ram~143\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~143_combout\ = ( \RAM1|ram~51_q\ & ( !\ROM1|memROM~8_combout\ & ( (\ROM1|memROM~6_combout\) # (\RAM1|ram~19_q\) ) ) ) # ( !\RAM1|ram~51_q\ & ( !\ROM1|memROM~8_combout\ & ( (\RAM1|ram~19_q\ & !\ROM1|memROM~6_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010111110101111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~19_q\,
	datac => \ROM1|ALT_INV_memROM~6_combout\,
	datae => \RAM1|ALT_INV_ram~51_q\,
	dataf => \ROM1|ALT_INV_memROM~8_combout\,
	combout => \RAM1|ram~143_combout\);

-- Location: FF_X4_Y19_N5
\RAM1|ram~91\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[4]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~186_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~91_q\);

-- Location: FF_X4_Y20_N10
\RAM1|ram~123\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[4]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~187_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~123_q\);

-- Location: FF_X4_Y19_N44
\RAM1|ram~59\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[4]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~185_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~59_q\);

-- Location: MLABCELL_X4_Y19_N42
\RAM1|ram~144\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~144_combout\ = ( \RAM1|ram~59_q\ & ( \ROM1|memROM~6_combout\ & ( (!\ROM1|memROM~8_combout\) # (\RAM1|ram~123_q\) ) ) ) # ( !\RAM1|ram~59_q\ & ( \ROM1|memROM~6_combout\ & ( (\ROM1|memROM~8_combout\ & \RAM1|ram~123_q\) ) ) ) # ( \RAM1|ram~59_q\ & 
-- ( !\ROM1|memROM~6_combout\ & ( (\RAM1|ram~91_q\ & \ROM1|memROM~8_combout\) ) ) ) # ( !\RAM1|ram~59_q\ & ( !\ROM1|memROM~6_combout\ & ( (\RAM1|ram~91_q\ & \ROM1|memROM~8_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000000000011111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~91_q\,
	datac => \ROM1|ALT_INV_memROM~8_combout\,
	datad => \RAM1|ALT_INV_ram~123_q\,
	datae => \RAM1|ALT_INV_ram~59_q\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \RAM1|ram~144_combout\);

-- Location: MLABCELL_X4_Y19_N57
\RAM1|ram~147\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~147_combout\ = ( \RAM1|ram~143_combout\ & ( \RAM1|ram~144_combout\ & ( (!\ROM1|memROM~4_combout\) # ((!\ROM1|memROM~2_combout\ & ((\RAM1|ram~145_combout\))) # (\ROM1|memROM~2_combout\ & (\RAM1|ram~146_combout\))) ) ) ) # ( 
-- !\RAM1|ram~143_combout\ & ( \RAM1|ram~144_combout\ & ( (!\ROM1|memROM~2_combout\ & (((\ROM1|memROM~4_combout\ & \RAM1|ram~145_combout\)))) # (\ROM1|memROM~2_combout\ & (((!\ROM1|memROM~4_combout\)) # (\RAM1|ram~146_combout\))) ) ) ) # ( 
-- \RAM1|ram~143_combout\ & ( !\RAM1|ram~144_combout\ & ( (!\ROM1|memROM~2_combout\ & (((!\ROM1|memROM~4_combout\) # (\RAM1|ram~145_combout\)))) # (\ROM1|memROM~2_combout\ & (\RAM1|ram~146_combout\ & (\ROM1|memROM~4_combout\))) ) ) ) # ( 
-- !\RAM1|ram~143_combout\ & ( !\RAM1|ram~144_combout\ & ( (\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~2_combout\ & ((\RAM1|ram~145_combout\))) # (\ROM1|memROM~2_combout\ & (\RAM1|ram~146_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100001101110000011100110100110001001111011111000111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~146_combout\,
	datab => \ROM1|ALT_INV_memROM~2_combout\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datad => \RAM1|ALT_INV_ram~145_combout\,
	datae => \RAM1|ALT_INV_ram~143_combout\,
	dataf => \RAM1|ALT_INV_ram~144_combout\,
	combout => \RAM1|ram~147_combout\);

-- Location: FF_X4_Y19_N13
\RAM1|ram~90\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \RAM1|ram~186_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~90_q\);

-- Location: LABCELL_X5_Y19_N57
\RAM1|ram~180\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~180_combout\ = ( \ROM1|memROM~2_combout\ & ( !\ROM1|memROM~4_combout\ & ( \RAM1|ram~90_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \RAM1|ALT_INV_ram~90_q\,
	datae => \ROM1|ALT_INV_memROM~2_combout\,
	dataf => \ROM1|ALT_INV_memROM~4_combout\,
	combout => \RAM1|ram~180_combout\);

-- Location: FF_X5_Y19_N40
\RAM1|ram~42\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \RAM1|ram~190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~42_q\);

-- Location: FF_X5_Y19_N4
\RAM1|ram~34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \RAM1|ram~188_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~34_q\);

-- Location: FF_X5_Y19_N26
\RAM1|ram~18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \RAM1|ram~183_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~18_q\);

-- Location: LABCELL_X5_Y19_N24
\RAM1|ram~178\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~178_combout\ = ( \RAM1|ram~18_q\ & ( \ROM1|memROM~2_combout\ & ( (\RAM1|ram~42_q\ & \ROM1|memROM~4_combout\) ) ) ) # ( !\RAM1|ram~18_q\ & ( \ROM1|memROM~2_combout\ & ( (\RAM1|ram~42_q\ & \ROM1|memROM~4_combout\) ) ) ) # ( \RAM1|ram~18_q\ & ( 
-- !\ROM1|memROM~2_combout\ & ( (!\ROM1|memROM~4_combout\) # (\RAM1|ram~34_q\) ) ) ) # ( !\RAM1|ram~18_q\ & ( !\ROM1|memROM~2_combout\ & ( (\ROM1|memROM~4_combout\ & \RAM1|ram~34_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111100001111111100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \RAM1|ALT_INV_ram~42_q\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datad => \RAM1|ALT_INV_ram~34_q\,
	datae => \RAM1|ALT_INV_ram~18_q\,
	dataf => \ROM1|ALT_INV_memROM~2_combout\,
	combout => \RAM1|ram~178_combout\);

-- Location: FF_X4_Y20_N28
\RAM1|ram~122\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \RAM1|ram~187_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~122_q\);

-- Location: FF_X4_Y20_N19
\RAM1|ram~130\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \RAM1|ram~189_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~130_q\);

-- Location: LABCELL_X5_Y20_N42
\RAM1|ram~181\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~181_combout\ = ( \ROM1|memROM~2_combout\ & ( (\RAM1|ram~122_q\ & !\ROM1|memROM~4_combout\) ) ) # ( !\ROM1|memROM~2_combout\ & ( (\RAM1|ram~130_q\ & \ROM1|memROM~4_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001101010000010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~122_q\,
	datab => \RAM1|ALT_INV_ram~130_q\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \ROM1|ALT_INV_memROM~2_combout\,
	combout => \RAM1|ram~181_combout\);

-- Location: FF_X4_Y19_N40
\RAM1|ram~50\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \RAM1|ram~184_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~50_q\);

-- Location: FF_X4_Y19_N52
\RAM1|ram~58\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(3),
	sload => VCC,
	ena => \RAM1|ram~185_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~58_q\);

-- Location: LABCELL_X5_Y19_N51
\RAM1|ram~179\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~179_combout\ = ( \ROM1|memROM~2_combout\ & ( !\ROM1|memROM~4_combout\ & ( \RAM1|ram~58_q\ ) ) ) # ( !\ROM1|memROM~2_combout\ & ( !\ROM1|memROM~4_combout\ & ( \RAM1|ram~50_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~50_q\,
	datad => \RAM1|ALT_INV_ram~58_q\,
	datae => \ROM1|ALT_INV_memROM~2_combout\,
	dataf => \ROM1|ALT_INV_memROM~4_combout\,
	combout => \RAM1|ram~179_combout\);

-- Location: LABCELL_X5_Y19_N21
\RAM1|ram~182\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~182_combout\ = ( \RAM1|ram~181_combout\ & ( \RAM1|ram~179_combout\ & ( ((!\ROM1|memROM~8_combout\ & ((\RAM1|ram~178_combout\))) # (\ROM1|memROM~8_combout\ & (\RAM1|ram~180_combout\))) # (\ROM1|memROM~6_combout\) ) ) ) # ( !\RAM1|ram~181_combout\ 
-- & ( \RAM1|ram~179_combout\ & ( (!\ROM1|memROM~8_combout\ & (((\RAM1|ram~178_combout\)) # (\ROM1|memROM~6_combout\))) # (\ROM1|memROM~8_combout\ & (!\ROM1|memROM~6_combout\ & (\RAM1|ram~180_combout\))) ) ) ) # ( \RAM1|ram~181_combout\ & ( 
-- !\RAM1|ram~179_combout\ & ( (!\ROM1|memROM~8_combout\ & (!\ROM1|memROM~6_combout\ & ((\RAM1|ram~178_combout\)))) # (\ROM1|memROM~8_combout\ & (((\RAM1|ram~180_combout\)) # (\ROM1|memROM~6_combout\))) ) ) ) # ( !\RAM1|ram~181_combout\ & ( 
-- !\RAM1|ram~179_combout\ & ( (!\ROM1|memROM~6_combout\ & ((!\ROM1|memROM~8_combout\ & ((\RAM1|ram~178_combout\))) # (\ROM1|memROM~8_combout\ & (\RAM1|ram~180_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010010001100000101011001110100100110101011100011011110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~8_combout\,
	datab => \ROM1|ALT_INV_memROM~6_combout\,
	datac => \RAM1|ALT_INV_ram~180_combout\,
	datad => \RAM1|ALT_INV_ram~178_combout\,
	datae => \RAM1|ALT_INV_ram~181_combout\,
	dataf => \RAM1|ALT_INV_ram~179_combout\,
	combout => \RAM1|ram~182_combout\);

-- Location: FF_X4_Y20_N44
\RAM1|ram~49\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(2),
	sload => VCC,
	ena => \RAM1|ram~184_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~49_q\);

-- Location: FF_X5_Y19_N28
\RAM1|ram~17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(2),
	sload => VCC,
	ena => \RAM1|ram~183_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~17_q\);

-- Location: MLABCELL_X4_Y20_N45
\RAM1|ram~173\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~173_combout\ = ( !\ROM1|memROM~8_combout\ & ( \ROM1|memROM~6_combout\ & ( \RAM1|ram~49_q\ ) ) ) # ( !\ROM1|memROM~8_combout\ & ( !\ROM1|memROM~6_combout\ & ( \RAM1|ram~17_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000110011001100110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \RAM1|ALT_INV_ram~49_q\,
	datac => \RAM1|ALT_INV_ram~17_q\,
	datae => \ROM1|ALT_INV_memROM~8_combout\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \RAM1|ram~173_combout\);

-- Location: MLABCELL_X4_Y19_N15
\RAM1|ram~89feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~89feeder_combout\ = ( \CPU|REGA|DOUT\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT\(2),
	combout => \RAM1|ram~89feeder_combout\);

-- Location: FF_X4_Y19_N16
\RAM1|ram~89\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \RAM1|ram~89feeder_combout\,
	ena => \RAM1|ram~186_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~89_q\);

-- Location: FF_X5_Y20_N23
\RAM1|ram~57\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(2),
	sload => VCC,
	ena => \RAM1|ram~185_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~57_q\);

-- Location: FF_X4_Y20_N25
\RAM1|ram~121\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(2),
	sload => VCC,
	ena => \RAM1|ram~187_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~121_q\);

-- Location: LABCELL_X5_Y20_N21
\RAM1|ram~174\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~174_combout\ = ( \RAM1|ram~121_q\ & ( (!\ROM1|memROM~8_combout\ & (\ROM1|memROM~6_combout\ & ((\RAM1|ram~57_q\)))) # (\ROM1|memROM~8_combout\ & (((\RAM1|ram~89_q\)) # (\ROM1|memROM~6_combout\))) ) ) # ( !\RAM1|ram~121_q\ & ( 
-- (!\ROM1|memROM~8_combout\ & (\ROM1|memROM~6_combout\ & ((\RAM1|ram~57_q\)))) # (\ROM1|memROM~8_combout\ & (!\ROM1|memROM~6_combout\ & (\RAM1|ram~89_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000100110000001000010011000010101001101110001010100110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~8_combout\,
	datab => \ROM1|ALT_INV_memROM~6_combout\,
	datac => \RAM1|ALT_INV_ram~89_q\,
	datad => \RAM1|ALT_INV_ram~57_q\,
	dataf => \RAM1|ALT_INV_ram~121_q\,
	combout => \RAM1|ram~174_combout\);

-- Location: FF_X4_Y20_N17
\RAM1|ram~129\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(2),
	sload => VCC,
	ena => \RAM1|ram~189_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~129_q\);

-- Location: FF_X5_Y19_N2
\RAM1|ram~33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(2),
	sload => VCC,
	ena => \RAM1|ram~188_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~33_q\);

-- Location: MLABCELL_X4_Y20_N12
\RAM1|ram~175\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~175_combout\ = ( \ROM1|memROM~8_combout\ & ( \ROM1|memROM~6_combout\ & ( \RAM1|ram~129_q\ ) ) ) # ( !\ROM1|memROM~8_combout\ & ( !\ROM1|memROM~6_combout\ & ( \RAM1|ram~33_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \RAM1|ALT_INV_ram~129_q\,
	datac => \RAM1|ALT_INV_ram~33_q\,
	datae => \ROM1|ALT_INV_memROM~8_combout\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \RAM1|ram~175_combout\);

-- Location: FF_X5_Y19_N52
\RAM1|ram~41\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(2),
	sload => VCC,
	ena => \RAM1|ram~190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~41_q\);

-- Location: LABCELL_X5_Y19_N6
\RAM1|ram~176\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~176_combout\ = ( !\ROM1|memROM~6_combout\ & ( (!\ROM1|memROM~8_combout\ & \RAM1|ram~41_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~8_combout\,
	datad => \RAM1|ALT_INV_ram~41_q\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \RAM1|ram~176_combout\);

-- Location: MLABCELL_X4_Y18_N21
\RAM1|ram~177\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~177_combout\ = ( \RAM1|ram~175_combout\ & ( \RAM1|ram~176_combout\ & ( ((!\ROM1|memROM~2_combout\ & (\RAM1|ram~173_combout\)) # (\ROM1|memROM~2_combout\ & ((\RAM1|ram~174_combout\)))) # (\ROM1|memROM~4_combout\) ) ) ) # ( !\RAM1|ram~175_combout\ 
-- & ( \RAM1|ram~176_combout\ & ( (!\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~2_combout\ & (\RAM1|ram~173_combout\)) # (\ROM1|memROM~2_combout\ & ((\RAM1|ram~174_combout\))))) # (\ROM1|memROM~4_combout\ & (((\ROM1|memROM~2_combout\)))) ) ) ) # ( 
-- \RAM1|ram~175_combout\ & ( !\RAM1|ram~176_combout\ & ( (!\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~2_combout\ & (\RAM1|ram~173_combout\)) # (\ROM1|memROM~2_combout\ & ((\RAM1|ram~174_combout\))))) # (\ROM1|memROM~4_combout\ & 
-- (((!\ROM1|memROM~2_combout\)))) ) ) ) # ( !\RAM1|ram~175_combout\ & ( !\RAM1|ram~176_combout\ & ( (!\ROM1|memROM~4_combout\ & ((!\ROM1|memROM~2_combout\ & (\RAM1|ram~173_combout\)) # (\ROM1|memROM~2_combout\ & ((\RAM1|ram~174_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000001010011101110000101000100010010111110111011101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \RAM1|ALT_INV_ram~173_combout\,
	datac => \RAM1|ALT_INV_ram~174_combout\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \RAM1|ALT_INV_ram~175_combout\,
	dataf => \RAM1|ALT_INV_ram~176_combout\,
	combout => \RAM1|ram~177_combout\);

-- Location: LABCELL_X6_Y18_N12
\ROM1|memROM~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~17_combout\ = ( \ROM1|memROM~1_combout\ & ( \ROM1|memROM~5_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ROM1|ALT_INV_memROM~1_combout\,
	dataf => \ROM1|ALT_INV_memROM~5_combout\,
	combout => \ROM1|memROM~17_combout\);

-- Location: FF_X4_Y20_N32
\RAM1|ram~128\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[1]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~189_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~128_q\);

-- Location: FF_X4_Y20_N56
\RAM1|ram~120\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[1]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~187_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~120_q\);

-- Location: MLABCELL_X4_Y20_N33
\RAM1|ram~171\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~171_combout\ = ( !\ROM1|memROM~4_combout\ & ( \ROM1|memROM~2_combout\ & ( \RAM1|ram~120_q\ ) ) ) # ( \ROM1|memROM~4_combout\ & ( !\ROM1|memROM~2_combout\ & ( \RAM1|ram~128_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \RAM1|ALT_INV_ram~128_q\,
	datad => \RAM1|ALT_INV_ram~120_q\,
	datae => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \ROM1|ALT_INV_memROM~2_combout\,
	combout => \RAM1|ram~171_combout\);

-- Location: FF_X4_Y19_N31
\RAM1|ram~56\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[1]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~185_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~56_q\);

-- Location: FF_X4_Y19_N56
\RAM1|ram~48\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[1]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~184_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~48_q\);

-- Location: MLABCELL_X4_Y18_N45
\RAM1|ram~169\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~169_combout\ = ( \ROM1|memROM~2_combout\ & ( (\RAM1|ram~56_q\ & !\ROM1|memROM~4_combout\) ) ) # ( !\ROM1|memROM~2_combout\ & ( (\RAM1|ram~48_q\ & !\ROM1|memROM~4_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000001010101000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~56_q\,
	datac => \RAM1|ALT_INV_ram~48_q\,
	datad => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \ROM1|ALT_INV_memROM~2_combout\,
	combout => \RAM1|ram~169_combout\);

-- Location: FF_X4_Y18_N8
\RAM1|ram~88\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[1]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~186_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~88_q\);

-- Location: MLABCELL_X4_Y18_N6
\RAM1|ram~170\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~170_combout\ = ( \RAM1|ram~88_q\ & ( \ROM1|memROM~2_combout\ & ( !\ROM1|memROM~4_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datae => \RAM1|ALT_INV_ram~88_q\,
	dataf => \ROM1|ALT_INV_memROM~2_combout\,
	combout => \RAM1|ram~170_combout\);

-- Location: FF_X5_Y19_N32
\RAM1|ram~40\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[1]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~40_q\);

-- Location: FF_X6_Y18_N31
\CPU|REGA|DOUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[1]~5_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(1));

-- Location: FF_X5_Y19_N14
\RAM1|ram~32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(1),
	sload => VCC,
	ena => \RAM1|ram~188_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~32_q\);

-- Location: FF_X5_Y19_N47
\RAM1|ram~16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(1),
	sload => VCC,
	ena => \RAM1|ram~183_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~16_q\);

-- Location: LABCELL_X5_Y19_N45
\RAM1|ram~168\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~168_combout\ = ( \RAM1|ram~16_q\ & ( \ROM1|memROM~2_combout\ & ( (\RAM1|ram~40_q\ & \ROM1|memROM~4_combout\) ) ) ) # ( !\RAM1|ram~16_q\ & ( \ROM1|memROM~2_combout\ & ( (\RAM1|ram~40_q\ & \ROM1|memROM~4_combout\) ) ) ) # ( \RAM1|ram~16_q\ & ( 
-- !\ROM1|memROM~2_combout\ & ( (!\ROM1|memROM~4_combout\) # (\RAM1|ram~32_q\) ) ) ) # ( !\RAM1|ram~16_q\ & ( !\ROM1|memROM~2_combout\ & ( (\RAM1|ram~32_q\ & \ROM1|memROM~4_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111111110000111100000000001100110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \RAM1|ALT_INV_ram~40_q\,
	datac => \RAM1|ALT_INV_ram~32_q\,
	datad => \ROM1|ALT_INV_memROM~4_combout\,
	datae => \RAM1|ALT_INV_ram~16_q\,
	dataf => \ROM1|ALT_INV_memROM~2_combout\,
	combout => \RAM1|ram~168_combout\);

-- Location: LABCELL_X5_Y18_N18
\RAM1|ram~172\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~172_combout\ = ( \RAM1|ram~170_combout\ & ( \RAM1|ram~168_combout\ & ( (!\ROM1|memROM~6_combout\) # ((!\ROM1|memROM~8_combout\ & ((\RAM1|ram~169_combout\))) # (\ROM1|memROM~8_combout\ & (\RAM1|ram~171_combout\))) ) ) ) # ( 
-- !\RAM1|ram~170_combout\ & ( \RAM1|ram~168_combout\ & ( (!\ROM1|memROM~6_combout\ & (((!\ROM1|memROM~8_combout\)))) # (\ROM1|memROM~6_combout\ & ((!\ROM1|memROM~8_combout\ & ((\RAM1|ram~169_combout\))) # (\ROM1|memROM~8_combout\ & 
-- (\RAM1|ram~171_combout\)))) ) ) ) # ( \RAM1|ram~170_combout\ & ( !\RAM1|ram~168_combout\ & ( (!\ROM1|memROM~6_combout\ & (((\ROM1|memROM~8_combout\)))) # (\ROM1|memROM~6_combout\ & ((!\ROM1|memROM~8_combout\ & ((\RAM1|ram~169_combout\))) # 
-- (\ROM1|memROM~8_combout\ & (\RAM1|ram~171_combout\)))) ) ) ) # ( !\RAM1|ram~170_combout\ & ( !\RAM1|ram~168_combout\ & ( (\ROM1|memROM~6_combout\ & ((!\ROM1|memROM~8_combout\ & ((\RAM1|ram~169_combout\))) # (\ROM1|memROM~8_combout\ & 
-- (\RAM1|ram~171_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100010001000000111101110111001111000100011100111111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~171_combout\,
	datab => \ROM1|ALT_INV_memROM~6_combout\,
	datac => \RAM1|ALT_INV_ram~169_combout\,
	datad => \ROM1|ALT_INV_memROM~8_combout\,
	datae => \RAM1|ALT_INV_ram~170_combout\,
	dataf => \RAM1|ALT_INV_ram~168_combout\,
	combout => \RAM1|ram~172_combout\);

-- Location: LABCELL_X5_Y20_N45
\ROM1|memROM~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~16_combout\ = ( \ROM1|memROM~3_combout\ & ( \ROM1|memROM~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	dataf => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \ROM1|memROM~16_combout\);

-- Location: FF_X5_Y19_N55
\RAM1|ram~15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(0),
	sload => VCC,
	ena => \RAM1|ram~183_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~15_q\);

-- Location: FF_X5_Y20_N32
\RAM1|ram~47\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(0),
	sload => VCC,
	ena => \RAM1|ram~184_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~47_q\);

-- Location: LABCELL_X5_Y20_N30
\RAM1|ram~163\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~163_combout\ = ( \ROM1|memROM~6_combout\ & ( (!\ROM1|memROM~8_combout\ & \RAM1|ram~47_q\) ) ) # ( !\ROM1|memROM~6_combout\ & ( (\RAM1|ram~15_q\ & !\ROM1|memROM~8_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \RAM1|ALT_INV_ram~15_q\,
	datac => \ROM1|ALT_INV_memROM~8_combout\,
	datad => \RAM1|ALT_INV_ram~47_q\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \RAM1|ram~163_combout\);

-- Location: FF_X4_Y18_N20
\RAM1|ram~31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(0),
	sload => VCC,
	ena => \RAM1|ram~188_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~31_q\);

-- Location: FF_X4_Y18_N59
\RAM1|ram~127\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(0),
	sload => VCC,
	ena => \RAM1|ram~189_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~127_q\);

-- Location: MLABCELL_X4_Y18_N57
\RAM1|ram~165\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~165_combout\ = ( \RAM1|ram~127_q\ & ( \ROM1|memROM~6_combout\ & ( \ROM1|memROM~8_combout\ ) ) ) # ( \RAM1|ram~127_q\ & ( !\ROM1|memROM~6_combout\ & ( (\RAM1|ram~31_q\ & !\ROM1|memROM~8_combout\) ) ) ) # ( !\RAM1|ram~127_q\ & ( 
-- !\ROM1|memROM~6_combout\ & ( (\RAM1|ram~31_q\ & !\ROM1|memROM~8_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~31_q\,
	datad => \ROM1|ALT_INV_memROM~8_combout\,
	datae => \RAM1|ALT_INV_ram~127_q\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \RAM1|ram~165_combout\);

-- Location: FF_X6_Y18_N2
\CPU|REGA|DOUT[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[0]~4_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT[0]~DUPLICATE_q\);

-- Location: FF_X6_Y18_N8
\RAM1|ram~39\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[0]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~39_q\);

-- Location: LABCELL_X6_Y18_N6
\RAM1|ram~166\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~166_combout\ = ( \RAM1|ram~39_q\ & ( !\ROM1|memROM~6_combout\ & ( !\ROM1|memROM~8_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~8_combout\,
	datae => \RAM1|ALT_INV_ram~39_q\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \RAM1|ram~166_combout\);

-- Location: FF_X6_Y20_N7
\RAM1|ram~87\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(0),
	sload => VCC,
	ena => \RAM1|ram~186_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~87_q\);

-- Location: FF_X5_Y20_N20
\RAM1|ram~55\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(0),
	sload => VCC,
	ena => \RAM1|ram~185_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~55_q\);

-- Location: FF_X4_Y20_N1
\RAM1|ram~119\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(0),
	sload => VCC,
	ena => \RAM1|ram~187_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~119_q\);

-- Location: LABCELL_X5_Y20_N18
\RAM1|ram~164\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~164_combout\ = ( \RAM1|ram~119_q\ & ( (!\ROM1|memROM~8_combout\ & (\ROM1|memROM~6_combout\ & ((\RAM1|ram~55_q\)))) # (\ROM1|memROM~8_combout\ & (((\RAM1|ram~87_q\)) # (\ROM1|memROM~6_combout\))) ) ) # ( !\RAM1|ram~119_q\ & ( 
-- (!\ROM1|memROM~8_combout\ & (\ROM1|memROM~6_combout\ & ((\RAM1|ram~55_q\)))) # (\ROM1|memROM~8_combout\ & (!\ROM1|memROM~6_combout\ & (\RAM1|ram~87_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000100110000001000010011000010101001101110001010100110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~8_combout\,
	datab => \ROM1|ALT_INV_memROM~6_combout\,
	datac => \RAM1|ALT_INV_ram~87_q\,
	datad => \RAM1|ALT_INV_ram~55_q\,
	dataf => \RAM1|ALT_INV_ram~119_q\,
	combout => \RAM1|ram~164_combout\);

-- Location: LABCELL_X5_Y18_N0
\RAM1|ram~167\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~167_combout\ = ( \RAM1|ram~166_combout\ & ( \RAM1|ram~164_combout\ & ( ((!\ROM1|memROM~4_combout\ & (\RAM1|ram~163_combout\)) # (\ROM1|memROM~4_combout\ & ((\RAM1|ram~165_combout\)))) # (\ROM1|memROM~2_combout\) ) ) ) # ( !\RAM1|ram~166_combout\ 
-- & ( \RAM1|ram~164_combout\ & ( (!\ROM1|memROM~4_combout\ & (((\ROM1|memROM~2_combout\)) # (\RAM1|ram~163_combout\))) # (\ROM1|memROM~4_combout\ & (((!\ROM1|memROM~2_combout\ & \RAM1|ram~165_combout\)))) ) ) ) # ( \RAM1|ram~166_combout\ & ( 
-- !\RAM1|ram~164_combout\ & ( (!\ROM1|memROM~4_combout\ & (\RAM1|ram~163_combout\ & (!\ROM1|memROM~2_combout\))) # (\ROM1|memROM~4_combout\ & (((\RAM1|ram~165_combout\) # (\ROM1|memROM~2_combout\)))) ) ) ) # ( !\RAM1|ram~166_combout\ & ( 
-- !\RAM1|ram~164_combout\ & ( (!\ROM1|memROM~2_combout\ & ((!\ROM1|memROM~4_combout\ & (\RAM1|ram~163_combout\)) # (\ROM1|memROM~4_combout\ & ((\RAM1|ram~165_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000001110000001001010111010100101010011110100010111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~4_combout\,
	datab => \RAM1|ALT_INV_ram~163_combout\,
	datac => \ROM1|ALT_INV_memROM~2_combout\,
	datad => \RAM1|ALT_INV_ram~165_combout\,
	datae => \RAM1|ALT_INV_ram~166_combout\,
	dataf => \RAM1|ALT_INV_ram~164_combout\,
	combout => \RAM1|ram~167_combout\);

-- Location: LABCELL_X5_Y20_N57
\ROM1|memROM~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~15_combout\ = ( \ROM1|memROM~1_combout\ & ( \ROM1|memROM~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ROM1|ALT_INV_memROM~0_combout\,
	dataf => \ROM1|ALT_INV_memROM~1_combout\,
	combout => \ROM1|memROM~15_combout\);

-- Location: LABCELL_X5_Y18_N30
\CPU|ULA1|Add1~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add1~34_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \CPU|ULA1|Add1~34_cout\);

-- Location: LABCELL_X5_Y18_N33
\CPU|ULA1|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add1~17_sumout\ = SUM(( \RAM1|ram~167_combout\ ) + ( (!\CPU|DECODER|saida~3_combout\ & (((!\ROM1|memROM~15_combout\)) # (\CPU|PC|DOUT\(8)))) # (\CPU|DECODER|saida~3_combout\ & (((!\CPU|REGA|DOUT\(0))))) ) + ( \CPU|ULA1|Add1~34_cout\ ))
-- \CPU|ULA1|Add1~18\ = CARRY(( \RAM1|ram~167_combout\ ) + ( (!\CPU|DECODER|saida~3_combout\ & (((!\ROM1|memROM~15_combout\)) # (\CPU|PC|DOUT\(8)))) # (\CPU|DECODER|saida~3_combout\ & (((!\CPU|REGA|DOUT\(0))))) ) + ( \CPU|ULA1|Add1~34_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000111010001100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(8),
	datab => \CPU|REGA|ALT_INV_DOUT\(0),
	datac => \CPU|DECODER|ALT_INV_saida~3_combout\,
	datad => \RAM1|ALT_INV_ram~167_combout\,
	dataf => \ROM1|ALT_INV_memROM~15_combout\,
	cin => \CPU|ULA1|Add1~34_cout\,
	sumout => \CPU|ULA1|Add1~17_sumout\,
	cout => \CPU|ULA1|Add1~18\);

-- Location: LABCELL_X6_Y18_N0
\CPU|ULA1|saida[0]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|saida[0]~4_combout\ = ( \CPU|ULA1|Add1~17_sumout\ & ( (\CPU|DECODER|saida~3_combout\) # (\ROM1|memROM~2_combout\) ) ) # ( !\CPU|ULA1|Add1~17_sumout\ & ( (\ROM1|memROM~2_combout\ & !\CPU|DECODER|saida~3_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001111110011111100110000001100000011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM1|ALT_INV_memROM~2_combout\,
	datac => \CPU|DECODER|ALT_INV_saida~3_combout\,
	datae => \CPU|ULA1|ALT_INV_Add1~17_sumout\,
	combout => \CPU|ULA1|saida[0]~4_combout\);

-- Location: FF_X6_Y18_N1
\CPU|REGA|DOUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[0]~4_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(0));

-- Location: LABCELL_X5_Y18_N36
\CPU|ULA1|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add1~21_sumout\ = SUM(( \RAM1|ram~172_combout\ ) + ( (!\CPU|DECODER|saida~3_combout\ & (((!\ROM1|memROM~16_combout\)) # (\CPU|PC|DOUT\(8)))) # (\CPU|DECODER|saida~3_combout\ & (((!\CPU|REGA|DOUT[1]~DUPLICATE_q\)))) ) + ( \CPU|ULA1|Add1~18\ ))
-- \CPU|ULA1|Add1~22\ = CARRY(( \RAM1|ram~172_combout\ ) + ( (!\CPU|DECODER|saida~3_combout\ & (((!\ROM1|memROM~16_combout\)) # (\CPU|PC|DOUT\(8)))) # (\CPU|DECODER|saida~3_combout\ & (((!\CPU|REGA|DOUT[1]~DUPLICATE_q\)))) ) + ( \CPU|ULA1|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000111000101100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(8),
	datab => \CPU|DECODER|ALT_INV_saida~3_combout\,
	datac => \CPU|REGA|ALT_INV_DOUT[1]~DUPLICATE_q\,
	datad => \RAM1|ALT_INV_ram~172_combout\,
	dataf => \ROM1|ALT_INV_memROM~16_combout\,
	cin => \CPU|ULA1|Add1~18\,
	sumout => \CPU|ULA1|Add1~21_sumout\,
	cout => \CPU|ULA1|Add1~22\);

-- Location: LABCELL_X6_Y18_N30
\CPU|ULA1|saida[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|saida[1]~5_combout\ = ( \CPU|ULA1|Add1~21_sumout\ & ( (\CPU|DECODER|saida~3_combout\) # (\ROM1|memROM~4_combout\) ) ) # ( !\CPU|ULA1|Add1~21_sumout\ & ( (\ROM1|memROM~4_combout\ & !\CPU|DECODER|saida~3_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM1|ALT_INV_memROM~4_combout\,
	datac => \CPU|DECODER|ALT_INV_saida~3_combout\,
	dataf => \CPU|ULA1|ALT_INV_Add1~21_sumout\,
	combout => \CPU|ULA1|saida[1]~5_combout\);

-- Location: FF_X6_Y18_N32
\CPU|REGA|DOUT[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[1]~5_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT[1]~DUPLICATE_q\);

-- Location: LABCELL_X5_Y18_N39
\CPU|ULA1|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add1~25_sumout\ = SUM(( \RAM1|ram~177_combout\ ) + ( (!\CPU|DECODER|saida~3_combout\ & (((!\ROM1|memROM~17_combout\)) # (\CPU|PC|DOUT\(8)))) # (\CPU|DECODER|saida~3_combout\ & (((!\CPU|REGA|DOUT\(2))))) ) + ( \CPU|ULA1|Add1~22\ ))
-- \CPU|ULA1|Add1~26\ = CARRY(( \RAM1|ram~177_combout\ ) + ( (!\CPU|DECODER|saida~3_combout\ & (((!\ROM1|memROM~17_combout\)) # (\CPU|PC|DOUT\(8)))) # (\CPU|DECODER|saida~3_combout\ & (((!\CPU|REGA|DOUT\(2))))) ) + ( \CPU|ULA1|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000111000101100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|PC|ALT_INV_DOUT\(8),
	datab => \CPU|DECODER|ALT_INV_saida~3_combout\,
	datac => \CPU|REGA|ALT_INV_DOUT\(2),
	datad => \RAM1|ALT_INV_ram~177_combout\,
	dataf => \ROM1|ALT_INV_memROM~17_combout\,
	cin => \CPU|ULA1|Add1~22\,
	sumout => \CPU|ULA1|Add1~25_sumout\,
	cout => \CPU|ULA1|Add1~26\);

-- Location: LABCELL_X6_Y18_N27
\CPU|ULA1|saida[2]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|saida[2]~6_combout\ = ( \CPU|DECODER|saida~3_combout\ & ( \CPU|ULA1|Add1~25_sumout\ ) ) # ( !\CPU|DECODER|saida~3_combout\ & ( \CPU|ULA1|Add1~25_sumout\ & ( \ROM1|memROM~6_combout\ ) ) ) # ( !\CPU|DECODER|saida~3_combout\ & ( 
-- !\CPU|ULA1|Add1~25_sumout\ & ( \ROM1|memROM~6_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~6_combout\,
	datae => \CPU|DECODER|ALT_INV_saida~3_combout\,
	dataf => \CPU|ULA1|ALT_INV_Add1~25_sumout\,
	combout => \CPU|ULA1|saida[2]~6_combout\);

-- Location: FF_X6_Y18_N28
\CPU|REGA|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[2]~6_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(2));

-- Location: LABCELL_X5_Y18_N42
\CPU|ULA1|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add1~29_sumout\ = SUM(( \RAM1|ram~182_combout\ ) + ( (!\CPU|DECODER|saida[3]~2_combout\ & ((!\CPU|DECODER|saida~3_combout\ & ((!\ROM1|memROM~8_combout\))) # (\CPU|DECODER|saida~3_combout\ & (!\CPU|REGA|DOUT\(3))))) # 
-- (\CPU|DECODER|saida[3]~2_combout\ & (((!\CPU|REGA|DOUT\(3))))) ) + ( \CPU|ULA1|Add1~26\ ))
-- \CPU|ULA1|Add1~30\ = CARRY(( \RAM1|ram~182_combout\ ) + ( (!\CPU|DECODER|saida[3]~2_combout\ & ((!\CPU|DECODER|saida~3_combout\ & ((!\ROM1|memROM~8_combout\))) # (\CPU|DECODER|saida~3_combout\ & (!\CPU|REGA|DOUT\(3))))) # (\CPU|DECODER|saida[3]~2_combout\ 
-- & (((!\CPU|REGA|DOUT\(3))))) ) + ( \CPU|ULA1|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001111000111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_saida[3]~2_combout\,
	datab => \CPU|DECODER|ALT_INV_saida~3_combout\,
	datac => \CPU|REGA|ALT_INV_DOUT\(3),
	datad => \RAM1|ALT_INV_ram~182_combout\,
	dataf => \ROM1|ALT_INV_memROM~8_combout\,
	cin => \CPU|ULA1|Add1~26\,
	sumout => \CPU|ULA1|Add1~29_sumout\,
	cout => \CPU|ULA1|Add1~30\);

-- Location: LABCELL_X6_Y18_N18
\CPU|ULA1|saida[3]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|saida[3]~7_combout\ = ( \CPU|ULA1|Add1~29_sumout\ & ( (\CPU|DECODER|saida~3_combout\) # (\ROM1|memROM~8_combout\) ) ) # ( !\CPU|ULA1|Add1~29_sumout\ & ( (\ROM1|memROM~8_combout\ & !\CPU|DECODER|saida~3_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000001011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~8_combout\,
	datac => \CPU|DECODER|ALT_INV_saida~3_combout\,
	dataf => \CPU|ULA1|ALT_INV_Add1~29_sumout\,
	combout => \CPU|ULA1|saida[3]~7_combout\);

-- Location: FF_X6_Y18_N19
\CPU|REGA|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[3]~7_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(3));

-- Location: LABCELL_X5_Y18_N45
\CPU|ULA1|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add1~1_sumout\ = SUM(( \RAM1|ram~147_combout\ ) + ( (!\CPU|REGA|DOUT\(4)) # ((!\CPU|DECODER|saida[3]~2_combout\ & !\CPU|DECODER|saida~3_combout\)) ) + ( \CPU|ULA1|Add1~30\ ))
-- \CPU|ULA1|Add1~2\ = CARRY(( \RAM1|ram~147_combout\ ) + ( (!\CPU|REGA|DOUT\(4)) # ((!\CPU|DECODER|saida[3]~2_combout\ & !\CPU|DECODER|saida~3_combout\)) ) + ( \CPU|ULA1|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001110000011100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_saida[3]~2_combout\,
	datab => \CPU|DECODER|ALT_INV_saida~3_combout\,
	datac => \CPU|REGA|ALT_INV_DOUT\(4),
	datad => \RAM1|ALT_INV_ram~147_combout\,
	cin => \CPU|ULA1|Add1~30\,
	sumout => \CPU|ULA1|Add1~1_sumout\,
	cout => \CPU|ULA1|Add1~2\);

-- Location: LABCELL_X6_Y18_N51
\CPU|ULA1|saida[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|saida[4]~0_combout\ = ( \CPU|DECODER|saida~3_combout\ & ( \CPU|ULA1|Add1~1_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \CPU|DECODER|ALT_INV_saida~3_combout\,
	dataf => \CPU|ULA1|ALT_INV_Add1~1_sumout\,
	combout => \CPU|ULA1|saida[4]~0_combout\);

-- Location: FF_X6_Y18_N53
\CPU|REGA|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[4]~0_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(4));

-- Location: LABCELL_X5_Y18_N48
\CPU|ULA1|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add1~5_sumout\ = SUM(( \RAM1|ram~152_combout\ ) + ( (!\CPU|REGA|DOUT\(5)) # ((\CPU|DECODER|Equal10~0_combout\ & !\CPU|DECODER|saida~3_combout\)) ) + ( \CPU|ULA1|Add1~2\ ))
-- \CPU|ULA1|Add1~6\ = CARRY(( \RAM1|ram~152_combout\ ) + ( (!\CPU|REGA|DOUT\(5)) # ((\CPU|DECODER|Equal10~0_combout\ & !\CPU|DECODER|saida~3_combout\)) ) + ( \CPU|ULA1|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010110000101100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_Equal10~0_combout\,
	datab => \CPU|DECODER|ALT_INV_saida~3_combout\,
	datac => \CPU|REGA|ALT_INV_DOUT\(5),
	datad => \RAM1|ALT_INV_ram~152_combout\,
	cin => \CPU|ULA1|Add1~2\,
	sumout => \CPU|ULA1|Add1~5_sumout\,
	cout => \CPU|ULA1|Add1~6\);

-- Location: LABCELL_X6_Y20_N24
\CPU|FLAG|DOUT~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|FLAG|DOUT~1_combout\ = ( !\ROM1|memROM~12_combout\ & ( (\ROM1|memROM~11_combout\ & (!\ROM1|memROM~13_combout\ & (!\ROM1|memROM~9_combout\ & \ROM1|memROM~10_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~11_combout\,
	datab => \ROM1|ALT_INV_memROM~13_combout\,
	datac => \ROM1|ALT_INV_memROM~9_combout\,
	datad => \ROM1|ALT_INV_memROM~10_combout\,
	dataf => \ROM1|ALT_INV_memROM~12_combout\,
	combout => \CPU|FLAG|DOUT~1_combout\);

-- Location: LABCELL_X6_Y18_N57
\CPU|ULA1|saida[6]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|saida[6]~2_combout\ = ( \CPU|DECODER|saida~3_combout\ & ( \CPU|ULA1|Add1~9_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \CPU|DECODER|ALT_INV_saida~3_combout\,
	dataf => \CPU|ULA1|ALT_INV_Add1~9_sumout\,
	combout => \CPU|ULA1|saida[6]~2_combout\);

-- Location: FF_X6_Y18_N58
\CPU|REGA|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[6]~2_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(6));

-- Location: FF_X6_Y18_N59
\CPU|REGA|DOUT[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[6]~2_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT[6]~DUPLICATE_q\);

-- Location: FF_X4_Y18_N43
\RAM1|ram~133\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[6]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~189_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~133_q\);

-- Location: FF_X4_Y18_N53
\RAM1|ram~37\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[6]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~188_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~37_q\);

-- Location: MLABCELL_X4_Y18_N12
\RAM1|ram~155\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~155_combout\ = ( \ROM1|memROM~8_combout\ & ( \ROM1|memROM~6_combout\ & ( \RAM1|ram~133_q\ ) ) ) # ( !\ROM1|memROM~8_combout\ & ( !\ROM1|memROM~6_combout\ & ( \RAM1|ram~37_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~133_q\,
	datac => \RAM1|ALT_INV_ram~37_q\,
	datae => \ROM1|ALT_INV_memROM~8_combout\,
	dataf => \ROM1|ALT_INV_memROM~6_combout\,
	combout => \RAM1|ram~155_combout\);

-- Location: FF_X4_Y19_N47
\RAM1|ram~61\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[6]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~185_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~61_q\);

-- Location: FF_X4_Y20_N4
\RAM1|ram~125\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[6]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~187_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~125_q\);

-- Location: FF_X4_Y18_N29
\RAM1|ram~93\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[6]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~186_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~93_q\);

-- Location: MLABCELL_X4_Y18_N39
\RAM1|ram~154\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~154_combout\ = ( \ROM1|memROM~6_combout\ & ( \ROM1|memROM~8_combout\ & ( \RAM1|ram~125_q\ ) ) ) # ( !\ROM1|memROM~6_combout\ & ( \ROM1|memROM~8_combout\ & ( \RAM1|ram~93_q\ ) ) ) # ( \ROM1|memROM~6_combout\ & ( !\ROM1|memROM~8_combout\ & ( 
-- \RAM1|ram~61_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010100000000111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~61_q\,
	datac => \RAM1|ALT_INV_ram~125_q\,
	datad => \RAM1|ALT_INV_ram~93_q\,
	datae => \ROM1|ALT_INV_memROM~6_combout\,
	dataf => \ROM1|ALT_INV_memROM~8_combout\,
	combout => \RAM1|ram~154_combout\);

-- Location: FF_X6_Y18_N38
\RAM1|ram~45\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[6]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~45_q\);

-- Location: LABCELL_X6_Y18_N36
\RAM1|ram~156\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~156_combout\ = ( \RAM1|ram~45_q\ & ( !\ROM1|memROM~8_combout\ & ( !\ROM1|memROM~6_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ROM1|ALT_INV_memROM~6_combout\,
	datae => \RAM1|ALT_INV_ram~45_q\,
	dataf => \ROM1|ALT_INV_memROM~8_combout\,
	combout => \RAM1|ram~156_combout\);

-- Location: FF_X5_Y19_N58
\RAM1|ram~21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[6]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~183_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~21_q\);

-- Location: FF_X4_Y19_N20
\RAM1|ram~53\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT[6]~DUPLICATE_q\,
	sload => VCC,
	ena => \RAM1|ram~184_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~53_q\);

-- Location: MLABCELL_X4_Y18_N48
\RAM1|ram~153\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~153_combout\ = ( \ROM1|memROM~6_combout\ & ( !\ROM1|memROM~8_combout\ & ( \RAM1|ram~53_q\ ) ) ) # ( !\ROM1|memROM~6_combout\ & ( !\ROM1|memROM~8_combout\ & ( \RAM1|ram~21_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \RAM1|ALT_INV_ram~21_q\,
	datad => \RAM1|ALT_INV_ram~53_q\,
	datae => \ROM1|ALT_INV_memROM~6_combout\,
	dataf => \ROM1|ALT_INV_memROM~8_combout\,
	combout => \RAM1|ram~153_combout\);

-- Location: MLABCELL_X4_Y18_N27
\RAM1|ram~157\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~157_combout\ = ( \RAM1|ram~156_combout\ & ( \RAM1|ram~153_combout\ & ( (!\ROM1|memROM~2_combout\ & (((!\ROM1|memROM~4_combout\)) # (\RAM1|ram~155_combout\))) # (\ROM1|memROM~2_combout\ & (((\ROM1|memROM~4_combout\) # (\RAM1|ram~154_combout\)))) 
-- ) ) ) # ( !\RAM1|ram~156_combout\ & ( \RAM1|ram~153_combout\ & ( (!\ROM1|memROM~2_combout\ & (((!\ROM1|memROM~4_combout\)) # (\RAM1|ram~155_combout\))) # (\ROM1|memROM~2_combout\ & (((\RAM1|ram~154_combout\ & !\ROM1|memROM~4_combout\)))) ) ) ) # ( 
-- \RAM1|ram~156_combout\ & ( !\RAM1|ram~153_combout\ & ( (!\ROM1|memROM~2_combout\ & (\RAM1|ram~155_combout\ & ((\ROM1|memROM~4_combout\)))) # (\ROM1|memROM~2_combout\ & (((\ROM1|memROM~4_combout\) # (\RAM1|ram~154_combout\)))) ) ) ) # ( 
-- !\RAM1|ram~156_combout\ & ( !\RAM1|ram~153_combout\ & ( (!\ROM1|memROM~2_combout\ & (\RAM1|ram~155_combout\ & ((\ROM1|memROM~4_combout\)))) # (\ROM1|memROM~2_combout\ & (((\RAM1|ram~154_combout\ & !\ROM1|memROM~4_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100100010000001010111011110101111001000101010111101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~2_combout\,
	datab => \RAM1|ALT_INV_ram~155_combout\,
	datac => \RAM1|ALT_INV_ram~154_combout\,
	datad => \ROM1|ALT_INV_memROM~4_combout\,
	datae => \RAM1|ALT_INV_ram~156_combout\,
	dataf => \RAM1|ALT_INV_ram~153_combout\,
	combout => \RAM1|ram~157_combout\);

-- Location: LABCELL_X5_Y18_N51
\CPU|ULA1|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add1~9_sumout\ = SUM(( \RAM1|ram~157_combout\ ) + ( (!\CPU|REGA|DOUT\(6)) # ((\CPU|DECODER|Equal10~0_combout\ & !\CPU|DECODER|saida~3_combout\)) ) + ( \CPU|ULA1|Add1~6\ ))
-- \CPU|ULA1|Add1~10\ = CARRY(( \RAM1|ram~157_combout\ ) + ( (!\CPU|REGA|DOUT\(6)) # ((\CPU|DECODER|Equal10~0_combout\ & !\CPU|DECODER|saida~3_combout\)) ) + ( \CPU|ULA1|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010110000101100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|DECODER|ALT_INV_Equal10~0_combout\,
	datab => \CPU|DECODER|ALT_INV_saida~3_combout\,
	datac => \CPU|REGA|ALT_INV_DOUT\(6),
	datad => \RAM1|ALT_INV_ram~157_combout\,
	cin => \CPU|ULA1|Add1~6\,
	sumout => \CPU|ULA1|Add1~9_sumout\,
	cout => \CPU|ULA1|Add1~10\);

-- Location: LABCELL_X5_Y18_N24
\CPU|ULA1|saida[7]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|saida[7]~3_combout\ = ( \CPU|ULA1|Add1~13_sumout\ & ( \CPU|DECODER|saida~3_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \CPU|DECODER|ALT_INV_saida~3_combout\,
	dataf => \CPU|ULA1|ALT_INV_Add1~13_sumout\,
	combout => \CPU|ULA1|saida[7]~3_combout\);

-- Location: FF_X5_Y18_N26
\CPU|REGA|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|ULA1|saida[7]~3_combout\,
	ena => \CPU|DECODER|saida[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|REGA|DOUT\(7));

-- Location: FF_X4_Y18_N17
\RAM1|ram~94\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(7),
	sload => VCC,
	ena => \RAM1|ram~186_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~94_q\);

-- Location: MLABCELL_X4_Y18_N42
\RAM1|ram~160\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~160_combout\ = ( \RAM1|ram~94_q\ & ( (\ROM1|memROM~2_combout\ & !\ROM1|memROM~4_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110000001100000011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ROM1|ALT_INV_memROM~2_combout\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	dataf => \RAM1|ALT_INV_ram~94_q\,
	combout => \RAM1|ram~160_combout\);

-- Location: FF_X4_Y20_N7
\RAM1|ram~126\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(7),
	sload => VCC,
	ena => \RAM1|ram~187_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~126_q\);

-- Location: FF_X4_Y20_N23
\RAM1|ram~134\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(7),
	sload => VCC,
	ena => \RAM1|ram~189_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~134_q\);

-- Location: MLABCELL_X4_Y20_N21
\RAM1|ram~161\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~161_combout\ = ( \RAM1|ram~134_q\ & ( \ROM1|memROM~2_combout\ & ( (\RAM1|ram~126_q\ & !\ROM1|memROM~4_combout\) ) ) ) # ( !\RAM1|ram~134_q\ & ( \ROM1|memROM~2_combout\ & ( (\RAM1|ram~126_q\ & !\ROM1|memROM~4_combout\) ) ) ) # ( \RAM1|ram~134_q\ 
-- & ( !\ROM1|memROM~2_combout\ & ( \ROM1|memROM~4_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \RAM1|ALT_INV_ram~126_q\,
	datad => \ROM1|ALT_INV_memROM~4_combout\,
	datae => \RAM1|ALT_INV_ram~134_q\,
	dataf => \ROM1|ALT_INV_memROM~2_combout\,
	combout => \RAM1|ram~161_combout\);

-- Location: FF_X5_Y18_N17
\RAM1|ram~46\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(7),
	sload => VCC,
	ena => \RAM1|ram~190_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~46_q\);

-- Location: LABCELL_X6_Y19_N42
\RAM1|ram~22feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~22feeder_combout\ = ( \CPU|REGA|DOUT\(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \CPU|REGA|ALT_INV_DOUT\(7),
	combout => \RAM1|ram~22feeder_combout\);

-- Location: FF_X6_Y19_N43
\RAM1|ram~22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \RAM1|ram~22feeder_combout\,
	ena => \RAM1|ram~183_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~22_q\);

-- Location: FF_X4_Y18_N2
\RAM1|ram~38\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(7),
	sload => VCC,
	ena => \RAM1|ram~188_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~38_q\);

-- Location: MLABCELL_X4_Y18_N0
\RAM1|ram~158\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~158_combout\ = ( \RAM1|ram~38_q\ & ( \ROM1|memROM~2_combout\ & ( (\RAM1|ram~46_q\ & \ROM1|memROM~4_combout\) ) ) ) # ( !\RAM1|ram~38_q\ & ( \ROM1|memROM~2_combout\ & ( (\RAM1|ram~46_q\ & \ROM1|memROM~4_combout\) ) ) ) # ( \RAM1|ram~38_q\ & ( 
-- !\ROM1|memROM~2_combout\ & ( (\ROM1|memROM~4_combout\) # (\RAM1|ram~22_q\) ) ) ) # ( !\RAM1|ram~38_q\ & ( !\ROM1|memROM~2_combout\ & ( (\RAM1|ram~22_q\ & !\ROM1|memROM~4_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001111110011111100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \RAM1|ALT_INV_ram~46_q\,
	datab => \RAM1|ALT_INV_ram~22_q\,
	datac => \ROM1|ALT_INV_memROM~4_combout\,
	datae => \RAM1|ALT_INV_ram~38_q\,
	dataf => \ROM1|ALT_INV_memROM~2_combout\,
	combout => \RAM1|ram~158_combout\);

-- Location: FF_X4_Y19_N37
\RAM1|ram~54\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(7),
	sload => VCC,
	ena => \RAM1|ram~184_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~54_q\);

-- Location: FF_X4_Y19_N50
\RAM1|ram~62\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	asdata => \CPU|REGA|DOUT\(7),
	sload => VCC,
	ena => \RAM1|ram~185_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RAM1|ram~62_q\);

-- Location: MLABCELL_X4_Y19_N48
\RAM1|ram~159\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~159_combout\ = ( \RAM1|ram~62_q\ & ( !\ROM1|memROM~4_combout\ & ( (\ROM1|memROM~2_combout\) # (\RAM1|ram~54_q\) ) ) ) # ( !\RAM1|ram~62_q\ & ( !\ROM1|memROM~4_combout\ & ( (\RAM1|ram~54_q\ & !\ROM1|memROM~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \RAM1|ALT_INV_ram~54_q\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \RAM1|ALT_INV_ram~62_q\,
	dataf => \ROM1|ALT_INV_memROM~4_combout\,
	combout => \RAM1|ram~159_combout\);

-- Location: MLABCELL_X4_Y18_N33
\RAM1|ram~162\ : cyclonev_lcell_comb
-- Equation(s):
-- \RAM1|ram~162_combout\ = ( \RAM1|ram~158_combout\ & ( \RAM1|ram~159_combout\ & ( (!\ROM1|memROM~8_combout\) # ((!\ROM1|memROM~6_combout\ & (\RAM1|ram~160_combout\)) # (\ROM1|memROM~6_combout\ & ((\RAM1|ram~161_combout\)))) ) ) ) # ( 
-- !\RAM1|ram~158_combout\ & ( \RAM1|ram~159_combout\ & ( (!\ROM1|memROM~6_combout\ & (\RAM1|ram~160_combout\ & ((\ROM1|memROM~8_combout\)))) # (\ROM1|memROM~6_combout\ & (((!\ROM1|memROM~8_combout\) # (\RAM1|ram~161_combout\)))) ) ) ) # ( 
-- \RAM1|ram~158_combout\ & ( !\RAM1|ram~159_combout\ & ( (!\ROM1|memROM~6_combout\ & (((!\ROM1|memROM~8_combout\)) # (\RAM1|ram~160_combout\))) # (\ROM1|memROM~6_combout\ & (((\RAM1|ram~161_combout\ & \ROM1|memROM~8_combout\)))) ) ) ) # ( 
-- !\RAM1|ram~158_combout\ & ( !\RAM1|ram~159_combout\ & ( (\ROM1|memROM~8_combout\ & ((!\ROM1|memROM~6_combout\ & (\RAM1|ram~160_combout\)) # (\ROM1|memROM~6_combout\ & ((\RAM1|ram~161_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100111101010100010011101010101001001111111111100100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~6_combout\,
	datab => \RAM1|ALT_INV_ram~160_combout\,
	datac => \RAM1|ALT_INV_ram~161_combout\,
	datad => \ROM1|ALT_INV_memROM~8_combout\,
	datae => \RAM1|ALT_INV_ram~158_combout\,
	dataf => \RAM1|ALT_INV_ram~159_combout\,
	combout => \RAM1|ram~162_combout\);

-- Location: LABCELL_X5_Y18_N54
\CPU|ULA1|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|ULA1|Add1~13_sumout\ = SUM(( \RAM1|ram~162_combout\ ) + ( (!\CPU|REGA|DOUT\(7)) # ((!\CPU|DECODER|saida~3_combout\ & \CPU|DECODER|Equal10~0_combout\)) ) + ( \CPU|ULA1|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100010101000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|REGA|ALT_INV_DOUT\(7),
	datab => \CPU|DECODER|ALT_INV_saida~3_combout\,
	datac => \CPU|DECODER|ALT_INV_Equal10~0_combout\,
	datad => \RAM1|ALT_INV_ram~162_combout\,
	cin => \CPU|ULA1|Add1~10\,
	sumout => \CPU|ULA1|Add1~13_sumout\);

-- Location: LABCELL_X5_Y18_N12
\CPU|FLAG|DOUT~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|FLAG|DOUT~2_combout\ = ( \CPU|ULA1|Add1~21_sumout\ & ( \CPU|ULA1|Add1~29_sumout\ & ( (\CPU|FLAG|DOUT~q\ & !\CPU|FLAG|DOUT~1_combout\) ) ) ) # ( !\CPU|ULA1|Add1~21_sumout\ & ( \CPU|ULA1|Add1~29_sumout\ & ( (\CPU|FLAG|DOUT~q\ & 
-- !\CPU|FLAG|DOUT~1_combout\) ) ) ) # ( \CPU|ULA1|Add1~21_sumout\ & ( !\CPU|ULA1|Add1~29_sumout\ & ( (\CPU|FLAG|DOUT~q\ & !\CPU|FLAG|DOUT~1_combout\) ) ) ) # ( !\CPU|ULA1|Add1~21_sumout\ & ( !\CPU|ULA1|Add1~29_sumout\ & ( (!\CPU|FLAG|DOUT~1_combout\ & 
-- (\CPU|FLAG|DOUT~q\)) # (\CPU|FLAG|DOUT~1_combout\ & (((!\CPU|ULA1|Add1~17_sumout\ & !\CPU|ULA1|Add1~25_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111010001000100010001000100010001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FLAG|ALT_INV_DOUT~q\,
	datab => \CPU|FLAG|ALT_INV_DOUT~1_combout\,
	datac => \CPU|ULA1|ALT_INV_Add1~17_sumout\,
	datad => \CPU|ULA1|ALT_INV_Add1~25_sumout\,
	datae => \CPU|ULA1|ALT_INV_Add1~21_sumout\,
	dataf => \CPU|ULA1|ALT_INV_Add1~29_sumout\,
	combout => \CPU|FLAG|DOUT~2_combout\);

-- Location: LABCELL_X5_Y18_N6
\CPU|FLAG|DOUT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|FLAG|DOUT~0_combout\ = ( \CPU|ULA1|Add1~13_sumout\ & ( \CPU|FLAG|DOUT~2_combout\ & ( !\CPU|FLAG|DOUT~1_combout\ ) ) ) # ( !\CPU|ULA1|Add1~13_sumout\ & ( \CPU|FLAG|DOUT~2_combout\ & ( (!\CPU|FLAG|DOUT~1_combout\) # ((!\CPU|ULA1|Add1~5_sumout\ & 
-- (!\CPU|ULA1|Add1~9_sumout\ & !\CPU|ULA1|Add1~1_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011101100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|ULA1|ALT_INV_Add1~5_sumout\,
	datab => \CPU|FLAG|ALT_INV_DOUT~1_combout\,
	datac => \CPU|ULA1|ALT_INV_Add1~9_sumout\,
	datad => \CPU|ULA1|ALT_INV_Add1~1_sumout\,
	datae => \CPU|ULA1|ALT_INV_Add1~13_sumout\,
	dataf => \CPU|FLAG|ALT_INV_DOUT~2_combout\,
	combout => \CPU|FLAG|DOUT~0_combout\);

-- Location: FF_X5_Y18_N7
\CPU|FLAG|DOUT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|FLAG|DOUT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|FLAG|DOUT~q\);

-- Location: LABCELL_X7_Y20_N12
\CPU|MUX2|saida_MUX[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX2|saida_MUX[7]~0_combout\ = ( \ROM1|memROM~9_combout\ & ( \ROM1|memROM~10_combout\ & ( (\ROM1|memROM~13_combout\ & (!\ROM1|memROM~11_combout\ & ((!\ROM1|memROM~12_combout\) # (\CPU|FLAG|DOUT~q\)))) ) ) ) # ( !\ROM1|memROM~9_combout\ & ( 
-- \ROM1|memROM~10_combout\ & ( (\ROM1|memROM~11_combout\ & (!\ROM1|memROM~12_combout\ $ (!\ROM1|memROM~13_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001111000000110100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FLAG|ALT_INV_DOUT~q\,
	datab => \ROM1|ALT_INV_memROM~12_combout\,
	datac => \ROM1|ALT_INV_memROM~13_combout\,
	datad => \ROM1|ALT_INV_memROM~11_combout\,
	datae => \ROM1|ALT_INV_memROM~9_combout\,
	dataf => \ROM1|ALT_INV_memROM~10_combout\,
	combout => \CPU|MUX2|saida_MUX[7]~0_combout\);

-- Location: FF_X7_Y20_N31
\CPU|ENDRET|DOUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|incrementaPC|Add0~1_sumout\,
	ena => \CPU|DECODER|saida~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|ENDRET|DOUT\(0));

-- Location: LABCELL_X5_Y20_N9
\CPU|MUX2|saida_MUX[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \CPU|MUX2|saida_MUX[0]~1_combout\ = ( \ROM1|memROM~2_combout\ & ( (!\CPU|MUX2|saida_MUX[7]~0_combout\ & (((\CPU|incrementaPC|Add0~1_sumout\)))) # (\CPU|MUX2|saida_MUX[7]~0_combout\ & (((\CPU|ENDRET|DOUT\(0))) # (\CPU|MUX2|Equal1~0_combout\))) ) ) # ( 
-- !\ROM1|memROM~2_combout\ & ( (!\CPU|MUX2|saida_MUX[7]~0_combout\ & (((\CPU|incrementaPC|Add0~1_sumout\)))) # (\CPU|MUX2|saida_MUX[7]~0_combout\ & (!\CPU|MUX2|Equal1~0_combout\ & (\CPU|ENDRET|DOUT\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010010101110000001001010111000010101101111110001010110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|MUX2|ALT_INV_saida_MUX[7]~0_combout\,
	datab => \CPU|MUX2|ALT_INV_Equal1~0_combout\,
	datac => \CPU|ENDRET|ALT_INV_DOUT\(0),
	datad => \CPU|incrementaPC|ALT_INV_Add0~1_sumout\,
	dataf => \ROM1|ALT_INV_memROM~2_combout\,
	combout => \CPU|MUX2|saida_MUX[0]~1_combout\);

-- Location: FF_X5_Y20_N10
\CPU|PC|DOUT[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~inputCLKENA0_outclk\,
	d => \CPU|MUX2|saida_MUX[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CPU|PC|DOUT[0]~DUPLICATE_q\);

-- Location: IOIBUF_X18_Y45_N35
\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: IOIBUF_X34_Y45_N1
\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X40_Y45_N41
\KEY[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: IOIBUF_X54_Y19_N21
\KEY[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: LABCELL_X6_Y29_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


