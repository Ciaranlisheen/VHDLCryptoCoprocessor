library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SBoxOne is
    Port ( LUTin : in unsigned (3 downto 0);
           LUTout : out unsigned (3 downto 0);
           LUTen : in STD_LOGIC);
end SBoxOne;

architecture Behavioral of SBoxOne is

begin

 process(LUTin,LUTen)
 begin
 
if LUTen = '1' then
  case(LUTin) is
  when "0000" => -- 0
   LUTout <= "0001";  
  when "0001" => -- 1
   LUTout <= "1011";
  when "0010" => --  2
   LUTout <= "1001";
  when "0011" => --  3
   LUTout <= "1100";
   
  when "0100" => -- 4
   LUTout <= "1101";  
  when "0101" => -- 5
   LUTout <= "0110";
  when "0110" => --  6
   LUTout <= "1111";
  when "0111" => --  7
   LUTout <= "0011";
   
  when "1000" => -- 8
   LUTout <= "1110";  
  when "1001" => -- 9
   LUTout <= "1000";
  when "1010" => --  10
   LUTout <= "0111";
  when "1011" => --  11
   LUTout <= "0100";   
   
  when "1100" => -- 12
   LUTout <= "1010";  
  when "1101" => -- 13
   LUTout <= "0010";
  when "1110" => --  14
   LUTout <= "0101";
  when "1111" => --  15
   LUTout <= "0000";  
   
  when others => Lutout <= "0000" ; -- this should not be possible
  end case;

end if;  
end process;

end Behavioral;
