library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity CompleteCryptoCoprocessor_tb is
end;

architecture bench of CompleteCryptoCoprocessor_tb is

  component CompleteCryptoCoprocessor
      Port ( instruction : in STD_LOGIC_VECTOR (15 downto 0);
              reset : in STD_LOGIC;
              clkin : in std_logic := '1');
  end component;

  signal instruction: STD_LOGIC_VECTOR (15 downto 0);
  signal reset: STD_LOGIC;
  signal clkin: std_logic;

  constant clock_period: time := 20 ns;
  signal stop_the_clock: boolean;

begin

  uut: CompleteCryptoCoprocessor port map ( instruction => instruction,
                                            reset       => reset,
                                            clkin       => clkin );

  stimulus: process
  begin
  
    instruction <= "0000010101001100";
    reset <= '0';
    stop_the_clock <= false;

    instruction <= "0100000110000111" after 2*clock_period;
    wait for 4*clock_period;
    instruction <= "1000000011000000";
    wait for 2*clock_period;
    instruction <= "1010111110010011";
    wait for 2*clock_period;
    instruction <= "0000000001111010";
    wait for 2*clock_period;
    instruction <= "0001011100111100";
    wait for 2*clock_period;
    instruction <= "0111111110010011";
    wait for 2*clock_period;
    instruction <= "0010110010101001";
    wait for 2*clock_period;
    instruction <= "0111110010101001";
    wait for 2*clock_period;
    instruction <= "1100100100000010";
    
  wait;  
  end process;

  clocking: process
  begin
     while not stop_the_clock loop
      clkin <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  