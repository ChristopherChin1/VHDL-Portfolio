entity fourbitadder is 
	port(A,B: in bit_vector(3 downto 0); Ci: in bit;
		S: out bit_vector(3 downto 0); Co: out bit);
end entity fourbitadder;

architecture struct of fourbitadder is
component onebitadder
	port(a,b,cin : in bit;
		cout,sout: out bit);
end component;
signal C: bit_vector(4 downto 0);

begin
	C(0) <= Ci;
	FullAdd4: for i in 0 to 3 generate
	begin
		FAx: onebitadder port map(A(i),B(i),C(i),C(i+1),S(i));
	end generate FullAdd4;
	Co <= C(4);
end struct;
	