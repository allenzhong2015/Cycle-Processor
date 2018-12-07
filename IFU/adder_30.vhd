library ieee;
use ieee.std_logic_1164.all;

entity adder_30 is
  port(
   x:in std_logic_vector(29 downto 0);
   y:in std_logic_vector(29 downto 0);
   sum:out std_logic_vector(29 downto 0)
);
end adder_30;

architecture data of adder_30 is

  component b32_adder is
    port(x,y:in std_logic_vector(31 downto 0); 
	     sum:out std_logic_vector(31 downto 0);
		 c_out:out std_logic; overflow:out std_logic
		 );
  end component;
  
signal x_temp,y_temp,sum_temp: std_logic_vector(31 downto 0);
signal scout,sof: std_logic;

begin
  x_temp(31 downto 2)<=x(29 downto 0);
  x_temp(1 downto 0)<="00";
  y_temp(31 downto 2)<=y(29 downto 0);
  y_temp(1 downto 0)<="00";
  dat : b32_adder port map(
					x_temp(31 downto 0),
					y_temp(31 downto 0),
					sum_temp(31 downto 0),
					scout,
					sof
					);
  sum(29 downto 0)<=sum_temp(31 downto 2);
  
end data;