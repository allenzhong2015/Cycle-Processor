library ieee;
use ieee.std_logic_1164.all;

entity dff_8 is
  port (
	clk	: in  std_logic;
	d	 : in  std_logic_vector(7 downto 0);
	q  	: out std_logic_vector(7 downto 0)
  );
end dff_8;

architecture structural of dff_8 is

component dff is
  port (
	clk	: in  std_logic;
	d	 : in  std_logic;
	q	 : out std_logic
  );
end component;

begin
  dff00: dff port map(clk, d(0), q(0));
  dff01: dff port map(clk, d(1), q(1));
  dff02: dff port map(clk, d(2), q(2));
  dff03: dff port map(clk, d(3), q(3));
  dff04: dff port map(clk, d(4), q(4));
  dff05: dff port map(clk, d(5), q(5));
  dff06: dff port map(clk, d(6), q(6));
  dff07: dff port map(clk, d(7), q(7));
end structural;