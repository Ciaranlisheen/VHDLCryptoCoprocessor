
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity LUSub is
    Port ( LUTin : in unsigned (15 downto 0);
           LUTen : in STD_LOGIC;
           LUTout : out unsigned (15 downto 0));
end LUSub;

architecture Behavioral of LUSub is

component SBoxOne
port(   LUTin : in unsigned (3 downto 0);
        LUTout : out unsigned (3 downto 0);
        LUTen : in STD_LOGIC);
end component;
component SBoxTwo
port(   LUTin : in unsigned (3 downto 0);
        LUTout : out unsigned (3 downto 0);
        LUTen : in STD_LOGIC);
end component;

signal sb1in : unsigned (3 downto 0);

begin

SB1: SBoxOne port map (LUTin(7 downto 4), LUTout(7 downto 4), LUTen);
SB2: SBoxTwo port map (LUTin(3 downto 0), LUTout(3 downto 0), LUTen);

process(LUTin, LUTen)
begin

    LUTout(15 downto 8) <= LUTin(15 downto 8);
    

end process;

end Behavioral;
