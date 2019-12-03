
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity CompleteCryptoCoprocessor is
    Port ( instruction : in STD_LOGIC_VECTOR (15 downto 0);
            reset : in STD_LOGIC;
            clkin : in std_logic);
end CompleteCryptoCoprocessor;

architecture Behavioral of CompleteCryptoCoprocessor is

component FullModel
    Port ( CTRL : in unsigned (3 downto 0);
           Abus : in unsigned (15 downto 0);
           Bbus : in unsigned (15 downto 0);
           Result : out unsigned (15 downto 0));    
end component;

component Register_File
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
end component;

signal interAbus : std_logic_vector(15 downto 0);
signal interBbus : std_logic_vector(15 downto 0);
signal outResult : unsigned(15 downto 0);
signal inResult : unsigned(15 downto 0);
signal writeEn : std_logic;
signal clk : std_logic;

begin


myFile : Register_File port map(interAbus, interBbus, inResult, writeEn, instruction(11 downto 8), instruction(7 downto 4), instruction(3 downto 0), reset, clk);
myLogic : FullModel port map(unsigned(instruction(15 downto 12)) , unsigned(interAbus), unsigned(interBbus), outResult);


stimulus: process(clkin, reset)
begin
if reset = '1' then
        writeEn <= '0';
else
    if (instruction(15 downto 12)) = "0111" then
        
    else
        writeEn <= '1';
        clk <= clkin;
            
        if falling_edge(clkin) then 
            inResult<=outResult;    
        end if;
    end if;
end if;

end process;
end Behavioral;
