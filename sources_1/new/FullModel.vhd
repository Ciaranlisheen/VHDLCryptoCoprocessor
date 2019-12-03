library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity FullModel is
    Port ( CTRL : in unsigned (3 downto 0);
           Abus : in unsigned (15 downto 0);
           Bbus : in unsigned (15 downto 0);
           Result : out unsigned (15 downto 0));
end FullModel;

architecture Behavioral of FullModel is

component LUSub
port(   LUTin : in unsigned (15 downto 0);
        LUTen : in STD_LOGIC;
        LUTout : out unsigned (15 downto 0));     
end component;

component ALU
port( ALUctrl : in unsigned (3 downto 0);
      Abus : in unsigned (15 downto 0);
      Bbus : in unsigned (15 downto 0);
      ALUout : out unsigned (15 downto 0));    
end component;

component SHIFTER
Port ( SHIFTin : in unsigned (15 downto 0);
       SHIFTctrl : in unsigned (3 downto 0);
       SHIFTout : out unsigned (15 downto 0));    
end component;

signal LUTenable : STD_LOGIC;
signal ALUcontrol : unsigned(3 downto 0);
signal SHIFTcontrol : unsigned(3 downto 0);
signal ALUoutput : unsigned(15 downto 0);
signal Shifteroutput : unsigned(15 downto 0);
signal LUoutput : unsigned(15 downto 0);
signal Cout : STD_LOGIC;

begin

myALU : ALU port map(ALUcontrol, Abus, Bbus, ALUoutput);
myShifter : SHIFTER port map(Bbus, SHIFTcontrol, Shifteroutput);
myLUT : LUSub port map(Abus, LUTenable, LUoutput);

process
begin
wait for 10ns;
LUTenable <= '0';
SHIFTcontrol <= "0000";

    if CTRL = "1100" then
        LUTenable <= '1';
        Result <= LUoutput;
        --Lookup table component;
    
    elsif CTRL(3) = '0' then
    --ALU code here
        ALUcontrol(3 downto 0) <= CTRL(3 downto 0);
        Result <= ALUoutput;
    
    elsif CTRL(2) = '0' then
    --Shifter component code
          SHIFTcontrol <= CTRL;
          Result <= Shifteroutput;
    
    else
        Result <= (others => '0');
        
    end if;

end process;
end Behavioral;
