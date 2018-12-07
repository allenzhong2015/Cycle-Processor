library ieee;
use ieee.std_logic_1164.all;

package logic_ops is
   
   component not_gate
    port (
      x : in  std_logic;
      z : out std_logic
    );
  end component not_gate;

  component not_gate_n
    generic (
      n : integer
    );
    port (
      x : in  std_logic_vector(n-1 downto 0);
      z : out std_logic_vector(n-1 downto 0)
    );
  end component not_gate_n;

  component not_gate_32
    port (
      x : in  std_logic_vector(31 downto 0);
      z : out std_logic_vector(31 downto 0)
    );
  end component not_gate_32;

  component and_gate
    port (
      x : in  std_logic;
      y : in  std_logic;
      z : out std_logic
    );
  end component and_gate;

  component and_gate_n
    generic (
      n : integer
    );
    port (
      x : in  std_logic_vector(n-1 downto 0);
      y : in  std_logic_vector(n-1 downto 0);
      z : out std_logic_vector(n-1 downto 0)
    );
  end component and_gate_n;

  component and_gate_32
    port (
      x : in  std_logic_vector(31 downto 0);
      y : in  std_logic_vector(31 downto 0);
      z : out std_logic_vector(31 downto 0)
    );
  end component and_gate_32;

  component or_gate
    port (
      x : in  std_logic;
      y : in  std_logic;
      z : out std_logic
    );
  end component or_gate;

  component or_gate_n
    generic (
      n : integer
    );
    port (
      x : in  std_logic_vector(n-1 downto 0);
      y : in  std_logic_vector(n-1 downto 0);
      z : out std_logic_vector(n-1 downto 0)
    );
  end component or_gate_n;

  component or_gate_32
    port (
      x : in  std_logic_vector(31 downto 0);
      y : in  std_logic_vector(31 downto 0);
      z : out std_logic_vector(31 downto 0)
    );
  end component or_gate_32;

  component nand_gate
    port (
      x : in  std_logic;
      y : in  std_logic;
      z : out std_logic
    );
  end component nand_gate;

  component nand_gate_n
    generic (
      n : integer
    );
    port (
      x : in  std_logic_vector(n-1 downto 0);
      y : in  std_logic_vector(n-1 downto 0);
      z : out std_logic_vector(n-1 downto 0)
    );
  end component nand_gate_n;

  component nand_gate_32
    port (
      x : in  std_logic_vector(31 downto 0);
      y : in  std_logic_vector(31 downto 0);
      z : out std_logic_vector(31 downto 0)
    );
  end component nand_gate_32;

  component nor_gate
    port (
      x : in  std_logic;
      y : in  std_logic;
      z : out std_logic
    );
  end component nor_gate;

  component nor_gate_n
    generic (
      n : integer
    );
    port (
      x : in  std_logic_vector(n-1 downto 0);
      y : in  std_logic_vector(n-1 downto 0);
      z : out std_logic_vector(n-1 downto 0)
    );
  end component nor_gate_n;

  component nor_gate_32
    port (
      x : in  std_logic_vector(31 downto 0);
      y : in  std_logic_vector(31 downto 0);
      z : out std_logic_vector(31 downto 0)
    );
  end component nor_gate_32;

  component xor_gate
    port (
      x : in  std_logic;
      y : in  std_logic;
      z : out std_logic
    );
  end component xor_gate;

  component xor_gate_n
    generic (
      n : integer
    );
    port (
      x : in  std_logic_vector(n-1 downto 0);
      y : in  std_logic_vector(n-1 downto 0);
      z : out std_logic_vector(n-1 downto 0)
    );
  end component xor_gate_n;

  component xor_gate_32
    port (
      x : in  std_logic_vector(31 downto 0);
      y : in  std_logic_vector(31 downto 0);
      z : out std_logic_vector(31 downto 0)
    );
  end component xor_gate_32;

  component xnor_gate
    port (
      x : in  std_logic;
      y : in  std_logic;
      z : out std_logic
    );
  end component xnor_gate;

  component xnor_gate_n
    generic (
      n : integer
    );
    port (
      x : in  std_logic_vector(n-1 downto 0);
      y : in  std_logic_vector(n-1 downto 0);
      z : out std_logic_vector(n-1 downto 0)
    );
  end component xnor_gate_n;

  component xnor_gate_32
    port (
      x : in  std_logic_vector(31 downto 0);
      y : in  std_logic_vector(31 downto 0);
      z : out std_logic_vector(31 downto 0)
    );
  end component xnor_gate_32;
   
   component dff
     port (
      clk	: in  std_logic;
      d  	: in  std_logic;
      q	  : out std_logic
     );
   end component;
   
   component dffr
     port (
      clk	: in  std_logic;
      d	  : in  std_logic;
      q	  : out std_logic
     );
   end component;
   
   component dffr_a
    port (
      clk	   : in  std_logic;
      arst   : in  std_logic;
      aload  : in  std_logic;
      adata  : in  std_logic;
      d	     : in  std_logic;
      enable : in  std_logic;
      q	     : out std_logic
     );
   end component;
   
   component mux
     port (
      sel	  : in 	std_logic;
      src0  :	in	 std_logic;
      src1  :	in	 std_logic;
      z	    : out std_logic
     );
   end component;
   
   component mux_32
     port (
      sel   : in  std_logic;
      src0  : in  std_logic_vector(31 downto 0);
      src1  : in  std_logic_vector(31 downto 0);
      z	    : out std_logic_vector(31 downto 0)
     );
   end component;
   
   component mux_n
     generic (
      n	: integer
     );
     port (
      sel	  : in	 std_logic;
      src0  :	in	 std_logic_vector(n-1 downto 0);
      src1  :	in	 std_logic_vector(n-1 downto 0);
      z	    : out std_logic_vector(n-1 downto 0)
     );
   end component;

   component sram
     generic (
      mem_file : string
     );
     port (
      cs	  : in	 std_logic;
      oe	  :	in	 std_logic;
      we	  :	in	 std_logic;
      addr : in	 std_logic_vector(31 downto 0);
      din	 :	in	 std_logic_vector(31 downto 0);
      dout :	out std_logic_vector(31 downto 0)
     );
   end component;
   
   component syncram
     generic (
      mem_file : string
     );
     port (
      clk   : in  std_logic;
      cs	   : in	 std_logic;
      oe	   :	in	 std_logic;
      we	   :	in	 std_logic;
      addr  : in	 std_logic_vector(31 downto 0);
      din	  :	in	 std_logic_vector(31 downto 0);
      dout  :	out std_logic_vector(31 downto 0)
     );
   end component;

end logic_ops;