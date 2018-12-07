library ieee;
use ieee.std_logic_1164.all;

entity bit_adder is
   port (
     x:in std_logic;
     y:in std_logic;
     c_in: in std_logic;
     sum:out std_logic;
     c_out:out std_logic
);
end bit_adder;

architecture data of bit_adder is
  component and_gate is
    port(x,y:in std_logic; z:out std_logic);
  end component;

  component or_gate is
    port(x,y:in std_logic; z:out std_logic);
  end component;

  component xor_gate is
    port(x,y:in std_logic; z:out std_logic);
  end component;
  
signal s: std_logic_vector(4 downto 0);

begin

  s0: xor_gate port map(x,y,s(0));
  s1: xor_gate port map(s(0),c_in,sum);
  c0: and_gate port map(x,c_in,s(1));
  c1: and_gate port map(y,c_in,s(2));
  c2: and_gate port map(x,y,s(3));
  c3: or_gate port map(s(1),s(2),s(4));
  c4: or_gate port map(s(3),s(4),c_out);
  
end data;