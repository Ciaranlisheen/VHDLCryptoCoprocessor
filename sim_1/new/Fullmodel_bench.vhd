library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity FullModel_tb is
end;

architecture bench of FullModel_tb is

  component FullModel
      Port ( CTRL : in unsigned (3 downto 0);
             Abus : in unsigned (15 downto 0);
             Bbus : in unsigned (15 downto 0);
             Result : out unsigned (15 downto 0));
  end component;

  signal CTRL: unsigned (3 downto 0);
  signal Abus: unsigned (15 downto 0);
  signal Bbus: unsigned (15 downto 0);
  signal Result: unsigned (15 downto 0);


begin

  uut: FullModel port map ( CTRL   => CTRL,
                            Abus   => Abus,
                            Bbus   => Bbus,
                            Result => Result );

process
  begin
  
    Abus <= "0000000000000000";
    Bbus <= "0000000000000000";
    CTRL <= "0000";
wait for 10ns; 


 
sub_loop: for I in 0 to 12 loop
       
    Abus <= "0000000011001111";  --CF --207
    Bbus <= "0000000001001101";  --4D --77
    wait for 40ns;
    
    if CTRL = "0000" then
        if Result = "0000000100011100" then
            report "Opperation 1 Test 1 is successful";
        else
            report "Opperation 1 Test 1 is failed";
        end if;
    end if;    
 
     if CTRL = "0001" then      
        if Result = "0000000010000010" then
            report "Opperation 2 Test 1 is successful";
        else
            report "Opperation 2 Test 1 is failed";
        end if;
    end if; 
 
    if CTRL = "0010" then      
       if Result = "0000000001001101" then
           report "Opperation 3 Test 1 is successful";
       else
           report "Opperation 3 Test 1 is failed";
       end if;
   end if; 
 
   if CTRL = "0011" then
       if Result = "0000000011001111" then
           report "Opperation 4 Test 1 is successful";
       else
           report "Opperation 4 Test 1 is failed";
       end if;
   end if;    
 
   if CTRL = "0100" then
       if Result = "0000000010000010" then
           report "Opperation 5 Test 1 is successful";
       else
           report "Opperation 5 Test 1 is failed";
       end if;
   end if;    
   
   if CTRL = "0101" then
       if Result = "1111111100110000" then
           report "Opperation 6 Test 1 is successful";
       else
           report "Opperation 6 Test 1 is failed";
       end if;
   end if;
 
   if CTRL = "0110" then
       if Result = "0000000011001111" then
           report "Opperation 7 Test 1 is successful";
       else
           report "Opperation 7 Test 1 is failed";
       end if;
   end if; 
   
   if CTRL = "1100" then
       if Result = "0000000010100110" then
           report "Opperation 8 Test 1 is successful";
       else
           report "Opperation 8 Test 1 is failed";
       end if;
   end if; 
   
   if CTRL = "1000" then
       if Result = "1101000000000100" then
           report "Opperation 9 Test 1 is successful";
       else
           report "Opperation 9 Test 1 is failed";
       end if;
   end if; 
   
   if CTRL = "1001" then
       if Result = "0000010011010000" then
           report "Opperation 10 Test 1 is successful";
       else
           report "Opperation 10 Test 1 is failed";
       end if;
   end if; 
   
   if CTRL = "1010" then
       if Result = "0000010011010000" then
           report "Opperation 11 Test 1 is successful";
       else
           report "Opperation 11 Test 1 is failed";
       end if;
  end if; 
   
  if CTRL = "1011" then
       if Result = "0000000000000100" then
           report "Opperation 12 Test 1 is successful";
       else
           report "Opperation 12 Test 1 is failed";
       end if;
end if; 













    Abus <= "1100101001110010";  --CA72 --51,876
    Bbus <= "0011010110110101";  --35B5 --13,749
    wait for 40ns;
    
    if CTRL = "0000" then
        if Result = "0000000000100111" then
            report "Opperation 1 Test 2 is successful";
        else
            report "Opperation 1 Test 2 is failed";
        end if;
    end if;    
 
     if CTRL = "0001" then      
        if Result = "1001010010111101" then
            report "Opperation 2 Test 2 is successful";
        else
            report "Opperation 2 Test 2 is failed";
        end if;
    end if; 
 
    if CTRL = "0010" then      
       if Result = "0000000000110000" then
           report "Opperation 3 Test 2 is successful";
       else
           report "Opperation 3 Test 2 is failed";
       end if;
   end if; 
 
   if CTRL = "0011" then
       if Result = "1111111111110111" then
           report "Opperation 4 Test 2 is successful";
       else
           report "Opperation 4 Test 2 is failed";
       end if;
   end if;    
 
   if CTRL = "0100" then
       if Result = "1111111111000111" then
           report "Opperation 5 Test 2 is successful";
       else
           report "Opperation 5 Test 2 is failed";
       end if;
   end if;    
   
   if CTRL = "0101" then
       if Result = "0011010110001101" then
           report "Opperation 6 Test 2 is successful";
       else
           report "Opperation 6 Test 2 is failed";
       end if;
   end if;
 
   if CTRL = "0110" then
       if Result = "1100101001110010" then
           report "Opperation 7 Test 2 is successful";
       else
           report "Opperation 7 Test 2 is failed";
       end if;
   end if; 
   
   if CTRL = "1100" then
       if Result = "1100101000111101" then
           report "Opperation 8 Test 2 is successful";
       else
           report "Opperation 8 Test 2 is failed";
       end if;
   end if; 
   
   if CTRL = "1000" then
       if Result = "0101001101011011" then
           report "Opperation 9 Test 2 is successful";
       else
           report "Opperation 9 Test 2 is failed";
       end if;
   end if; 
   
   if CTRL = "1001" then
       if Result = "0101101101010011" then
           report "Opperation 10 Test 2 is successful";
       else
           report "Opperation 10 Test 2 is failed";
       end if;
   end if; 
   
   if CTRL = "1010" then
       if Result = "0101101101010000" then
           report "Opperation 11 Test 2 is successful";
       else
           report "Opperation 11 Test 2 is failed";
       end if;
  end if; 
   
  if CTRL = "1011" then
       if Result = "0000001101011011" then
           report "Opperation 12 Test 2 is successful";
       else
           report "Opperation 12 Test 2 is failed";
       end if;
end if; 


 
    wait for 40ns;
    CTRL <= CTRL + 1;    
end loop sub_loop;
    
end process;

end;
  