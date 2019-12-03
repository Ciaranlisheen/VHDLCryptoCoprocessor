----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2018 19:56:35
-- Design Name: 
-- Module Name: SHIFTER - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SHIFTER is
    Port ( SHIFTin : in unsigned (15 downto 0);
           SHIFTctrl : in unsigned (3 downto 0);
           SHIFTout : out unsigned (15 downto 0));
end SHIFTER;

architecture Behavioral of SHIFTER is

begin
 process(SHIFTin,SHIFTctrl)
 begin
 case(SHIFTctrl) is
  when "1000" => -- Rotate right 4 bits
   SHIFTout <= SHIFTin ror(4);  
  when "1001" => -- Rotate left 4 bits
   SHIFTout <= SHIFTin rol(4);
  when "1010" => --  Shift left 4 bits
   SHIFTout <= SHIFTin sll(4);
  when "1011" => --  Shift right 4 bits
   SHIFTout <= SHIFTin srl(4);
 
   
  when others => SHIFTout <= SHIFTin ; -- Shift out = shift in;
  
  end case;
end process;

end Behavioral;
