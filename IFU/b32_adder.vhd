library ieee;
use ieee.std_logic_1164.all;

entity b32_adder is
  port(
   x:in std_logic_vector(31 downto 0);
   y:in std_logic_vector(31 downto 0);
   sum:out std_logic_vector(31 downto 0);
   c_out:out std_logic;
   overflow: out std_logic
);
end b32_adder;

architecture data of b32_adder is

  component b8_adder is
    port(x,y:in std_logic_vector(7 downto 0);c_in:in std_logic;sum:out std_logic_vector(7 downto 0); c_out:out std_logic);
  end component;
  
  component b7_adder is
    port(x,y:in std_logic_vector(6 downto 0);c_in:in std_logic;sum:out std_logic_vector(6 downto 0); c_out:out std_logic);
  end component;
  
  component bit_adder is
    port(x,y,c_in:in std_logic;sum,c_out:out std_logic);
  end component;
  
  component xor_gate is
    port(x,y:in std_logic; z:out std_logic);
  end component;

signal c_in:std_logic;
signal s:std_logic_vector(3 downto 0);
signal cout: std_logic;

begin
  c_in <= '0';
  dua:b8_adder port map(x(7 downto 0),y(7 downto 0),c_in,sum(7 downto 0),s(0));
  dub:b8_adder port map(x(15 downto 8),y(15 downto 8),s(0),sum(15 downto 8),s(1));
  duc:b8_adder port map(x(23 downto 16),y(23 downto 16),s(1),sum(23 downto 16),s(2));
  dud:b7_adder port map(x(30 downto 24),y(30 downto 24),s(2),sum(30 downto 24),s(3));
  due:bit_adder port map(x(31),y(31),s(3),sum(31),cout);
  c_out <= cout;
--  overflow <= s(3) xor cout;
  duf: xor_gate port map(s(3),cout,overflow);
end data;