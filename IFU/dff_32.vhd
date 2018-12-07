library ieee;
use ieee.std_logic_1164.all;

entity dff_32 is
  port (
	clk	: in  std_logic;
	d	 : in  std_logic_vector(31 downto 0);
	q  	: out std_logic_vector(31 downto 0)
  );
end dff_32;

architecture structural of dff_32 is

component dff_8 is
  port (
	clk	: in  std_logic;
	d	 : in  std_logic_vector(7 downto 0);
	q	 : out std_logic_vector(7 downto 0)
  );
end component;

begin
  dff00: dff_8 port map(clk, d(7  downto 0 ), q(7  downto 0 ));
  dff01: dff_8 port map(clk, d(15 downto 8 ), q(15 downto 8 ));
  dff02: dff_8 port map(clk, d(23 downto 16), q(23 downto 16));
  dff03: dff_8 port map(clk, d(31 downto 24), q(31 downto 24));
end structural;