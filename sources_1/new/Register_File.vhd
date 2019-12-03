library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Register_File is   
    port
    (
    Abus : out std_logic_vector(15 downto 0);
    Bbus : out std_logic_vector(15 downto 0);
    result : in  unsigned(15 downto 0);
    writeEnable : in std_logic;
    regASel : in std_logic_vector(3 downto 0);
    regBSel : in std_logic_vector(3 downto 0);
    writeRegSel : in std_logic_vector(3 downto 0);
    reset : in std_logic;
    clock : in std_logic
    );
end Register_File;

architecture behavioral of Register_File is

type memory is array(0 to 15) of std_logic_vector(15 downto 0);
signal registers : memory := (
0 => x"0001",
1 => x"c505",
2 => x"3c07",
3 => x"d405",
4 => x"1186",
5 => x"f407",
6 => x"1086",
7 => x"4706",
8 => x"6808",
9 => x"baa0",
10=> x"c902",
11 => x"100b",
12 => x"C000",
13=> x"c902",
14 => x"100b",
15 => x"B000",
others => (others => '0'));


begin

    regFile: process(clock, reset)
    begin
    if reset = '1' then
        Abus <= "0000000000000000";
        Bbus <= "0000000000000000";
    
    else
        if rising_edge(clock) then 
            if(writeEnable = '1') then
                registers(to_integer(unsigned(writeRegSel))) <= std_logic_vector(result);
            end if;
            Abus <= registers(to_integer(unsigned(regASel)));
            Bbus <= registers(to_integer(unsigned(regBSel)));
            if(WriteRegSel = regASel) then
                Abus <= std_logic_vector(result);
            elsif(WriteRegSel = regBSel) then
                Bbus <= std_logic_vector(result);
            end if;
        end if;
    end if;
end process;
end behavioral;