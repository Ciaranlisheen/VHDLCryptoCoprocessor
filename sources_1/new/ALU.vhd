----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2018 19:16:23
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use ieee.NUMERIC_STD.all;


entity ALU is
    Port ( ALUctrl : in unsigned (3 downto 0);
           Abus : in unsigned (15 downto 0);
           Bbus : in unsigned (15 downto 0);
           ALUout : out unsigned (15 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

 process(Abus,Bbus,ALUctrl)
 begin
  case(ALUctrl) is
  when "0000" => -- Addition
   ALUout <= Abus + Bbus;  -- ALUout <= A + B ; 
  when "0001" => -- Subtraction
   ALUout <= Abus - Bbus ;
  when "0010" => -- Logical and 
   ALUout <= Abus and Bbus;
  when "0011" => -- Logical or
   ALUout <= Abus or Bbus;
  when "0100" => -- Logical xor 
   ALUout <= Abus xor Bbus;
  when "0101" => -- Logical not
   ALUout <= not Abus;
  when "0110" => -- Logical mov 
   ALUout <= Abus;
  when others => ALUout <= Abus + Bbus;
  end case;
 end process;

end Behavioral;

