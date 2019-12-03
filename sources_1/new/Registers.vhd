

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Registers is
    Port ( AbusIn : in unsigned (15 downto 0);
           BbusIn : in unsigned (15 downto 0);
           CtrlIn : in unsigned (3 downto 0);
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           ResultOut : out unsigned (15 downto 0));
end Registers;

architecture Behavioral of Registers is
component FullModel
Port ( CTRL : in unsigned (3 downto 0);
           Abus : in unsigned (15 downto 0);
           Bbus : in unsigned (15 downto 0);
           Result : out unsigned (15 downto 0));
end component;

signal Result : unsigned(15 downto 0);
signal Abus : unsigned (15 downto 0);
signal Bbus : unsigned (15 downto 0);
signal Ctrl : unsigned (3 downto 0);
begin

LogicCircuit : FullModel port map(Ctrl, Abus, Bbus, Result);  
  
process(clock, reset)
begin
      if reset = '1' then
          ResultOut <= "0000000000000000";
          Abus <= "0000000000000000";
          Bbus <= "0000000000000000";
          Ctrl <= "0000";
      elsif rising_edge(clock) then
              Abus <= AbusIn;
              Bbus <= BbusIn;
              Ctrl <= CtrlIn;
      end if;
              
      if reset = '1' then
            ResultOut <= "0000000000000000";
      elsif falling_edge(clock) then
              ResultOut <= Result;
      end if;

end process;

end Behavioral;
