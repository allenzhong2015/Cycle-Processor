library ieee;
use ieee.std_logic_1164.all;

entity b7_adder is
  port(
    x:in std_logic_vector(6 downto 0);
    y:in std_logic_vector(6 downto 0);
    c_in:in std_logic;
    sum: out std_logic_vector(6 downto 0);
    c_out: out std_logic
);
end b7_adder;

architecture data of b7_adder is

  component bit_adder is
    port(x,y,c_in:in std_logic; sum,c_out:out std_logic);
  end component;
  
signal s : std_logic_vector(5 downto 0);

begin
  dua: bit_adder port map(x(0),y(0),c_in,sum(0),s(0));
  dub: bit_adder port map(x(1),y(1),s(0),sum(1),s(1));
  duc: bit_adder port map(x(2),y(2),s(1),sum(2),s(2));
  dud: bit_adder port map(x(3),y(3),s(2),sum(3),s(3));
  due: bit_adder port map(x(4),y(4),s(3),sum(4),s(4));
  duf: bit_adder port map(x(5),y(5),s(4),sum(5),s(5));
  dug: bit_adder port map(x(6),y(6),s(5),sum(6),c_out);
end data;