library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoriaRAM is
   generic (
         dataWidth: natural := 8;
         addrWidth: natural := 6
    );
    port
    (  
		  rd : in std_logic;
		  wr : in std_logic;
		  Data_Address : in std_logic_vector(addrWidth-1 downto 0);
        Data_OUT : in std_logic_vector(dataWidth -1 downto 0);
        Habilita_RAM : in std_logic;
        clk      : in std_logic;
        Data_IN : out std_logic_vector(dataWidth-1 downto 0)
    );
end entity;

architecture rtl of memoriaRAM is
    -- Build a 2-D array type for the RAM
    subtype word_t is std_logic_vector(dataWidth-1 downto 0);
    type memory_t is array((2**addrWidth-1) downto 0) of word_t;

    -- Declare the RAM signal.
    signal ram : memory_t;
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(wr = '1' and Habilita_RAM='1') then
                ram(to_integer(unsigned(Data_Address))) <= Data_OUT;
            end if;
        end if;
    end process;

    -- A leitura é sempre assincrona e quando houver habilitacao:
    Data_IN <= ram(to_integer(unsigned(Data_Address))) when (rd = '1' and Habilita_RAM='1') else (others => 'Z');
end architecture;