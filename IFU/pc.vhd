library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;
-- Essentially a 30-bit rising edge flip-flop--
entity pc is
  port (
	clk	: in  std_logic;
	d	: in  std_logic_vector(29 downto 0);
	q  	: out std_logic_vector(29 downto 0)
  );
end pc;

architecture structural of pc is
begin
	
	generate_dffs : for i in 0 to 29 generate
		dffs : dffr port map(clk, d(i), q(i));
	end generate;
	
end structural;