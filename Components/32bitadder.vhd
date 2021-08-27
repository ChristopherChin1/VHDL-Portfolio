entity adder32bit is
	port(A,B: in bit_vector(31 downto 0); Ci: in bit;
		S: out bit_vector(31 downto 0); Co: out bit);
end entity adder32bit;

architecture struct of adder32bit is
component fourbitadder
	port(A,B: in bit_vector(3 downto 0); Ci: in bit;
		S: out bit_vector(3 downto 0); Co: out bit);
end component;
signal C: bit_vector(8 downto 0);

begin
	C(0) <= Ci;
	FullAdd32: for i in 0 to 7 generate
	begin
		FAx: fourbitadder port map(A((3+(4*i)) downto (4*i)),B((3+(4*i)) downto (4*i)),C(i),S((3+(4*i)) downto (4*i)),C(i+1));
	end generate FullAdd32;
	Co <= C(8);
end struct;
