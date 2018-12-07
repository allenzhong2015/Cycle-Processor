library IEEE;
use IEEE.std_logic_1164.all;

entity extender_tb is
  port (
    z       : out std_logic_vector(31 downto 0)
  );
end extender_tb;

architecture structural of extender_tb is

component extender is
  port (
    x   : in  std_logic_vector(15 downto 0);
    z   : out std_logic_vector(31 downto 0)
  );
end component extender;

signal x : std_logic_vector(15 downto 0);

begin
  extender_map : extender port map (x => x, z => z);
  testbench_proc : process
  begin
    x <= "0000000000001111";

    wait for 5 ns;
   
    x <= "1111111100000000";
    wait for 5 ns;
    wait;
  end process;
end architecture structural;
