library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity IFU is
	generic (mem_file: string);
	port(
		clk, rst	 : in std_logic;

		-- Immed : 16 least significant bits of Instr --
		immed16 : in std_logic_vector(15 downto 0);

		-- Jump Target Addr --
		jump_addr : in std_logic_vector(25 downto 0);

		-- Contrl Signals --
		be_flag, bne_flag, bgtz_flag, jump, zero, gtz	 : in std_logic;

		instr_out	 : out std_logic_vector(31 downto 0)
	);
end entity IFU;

architecture structural of IFU is

	component pc is
		port(clk : in std_logic; 
				d   : in std_logic_vector(29 downto 0); 
				q   : out std_logic_vector(29 downto 0)
			  );
	end component;
  
	component adder_30 is
		port(x,y : in std_logic_vector(29 downto 0); 
			  sum : out std_logic_vector(29 downto 0)
			  );
	end component;
	
	component sign_ext is
		port (
			x	: in std_logic_vector(15 downto 0);
			z	: out std_logic_vector(29 downto 0)
		);
	end component sign_ext; 
	
	component or3_gate is
		port(
			a : in std_logic;
			b : in std_logic;
			c : in std_logic;
			or3_out : out std_logic
		);
	end component or3_gate;
	
constant start_PC_addr : std_logic_vector(29 downto 0) := "000000000100000000000000001000";
constant const_one : std_logic_vector(29 downto 0) := "000000000000000000000000000001";

signal addr : std_logic_vector(31 downto 0);
signal jump_dst, PC_in, PC_out : std_logic_vector(29 downto 0);
signal branch_to_jump_mux_signal, add_1_out_signal, sign_ext_immed_signal, last_add_out_signal : std_logic_vector(29 downto 0);
signal branch_and_zero_signal, branch_and_nz_signal, branch_and_gtz_signal, notzero : std_logic;
signal branch_mux_control : std_logic;

signal PC_in_or_rst : std_logic_vector(29 downto 0);

begin
	jump_ornot_mux : mux_n generic map(30) port map(jump, branch_to_jump_mux_signal, jump_dst, PC_in);
	
	-- Branch control
	not_zero_gate : not_gate port map(zero, notzero);
	AND_branch_zero : and_gate port map(be_flag, zero, branch_and_zero_signal);
	AND_branch_nz : and_gate port map(bne_flag, notzero, branch_and_nz_signal);
	AND_branch_gtz : and_gate port map(bgtz_flag, gtz, branch_and_gtz_signal);
	or_branch_flags : or3_gate port map(branch_and_zero_signal, branch_and_nz_signal, branch_and_gtz_signal, branch_mux_control);
	
	
	branch_zero_mux : mux_n generic map(30) port map(branch_mux_control, add_1_out_signal, last_add_out_signal, branch_to_jump_mux_signal);
	
	-- Adder adds 1 to current 30-bit PC-out
	add_1_adder : adder_30 port map(PC_out, const_one, add_1_out_signal);
	
	-- Adder adds incremented PC-out to sign-extended immed
	add_immed_adder : adder_30 port map(add_1_out_signal, sign_ext_immed_signal, last_add_out_signal);
	
	-- Sign extend immed
	sign_extend_16LSB : sign_ext port map(immed16, sign_ext_immed_signal);
	
	jump_dst <= PC_out(PC_out'Left downto PC_out'Left - 3) & jump_addr; --PC[31:28] & Jump[25:0] => jump_dst[29:0]
	
	PC_in_or_init : mux_n generic map(30) port map(rst, PC_in, start_PC_addr, PC_in_or_rst);
	
	pc_map  : pc port map(clk, PC_in_or_rst, PC_out);

	addr <= PC_out & "00"; --32-bit addr
	
	sram_port_map : sram
		generic map(mem_file => mem_file) 
		port map(
			cs => '1', --always select
			oe => '1', --read only memory
			we => '0', --read only memory
			addr => addr, 
			din => "00000000000000000000000000000000", --doesn't matter, does not read
			dout => instr_out
		);
end architecture structural;