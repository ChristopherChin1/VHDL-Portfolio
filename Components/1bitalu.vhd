
entity onebitalu is
	port(alu_ina,alu_inb,alu_cin,alu_binv,alu_ainv,alu_less : in bit;
		alu_op : in bit_vector(1 downto 0);
		alu_cout,alu_res, bit_add_out : out bit);
end entity onebitalu;


architecture struct of onebitalu is
component onebitadder
	port(a,b,cin : in bit;
		cout,sout : out bit);
end component;

--mux designs created from scratch
component onebitmux
	port(op0,op1,sel0 : in bit;
		muxout : out bit);
end component;
component twobitmux
	port(op0,op1,op2,op3 : in bit;
		sel : in bit_vector(1 downto 0);
		muxout : out bit);
end component;

signal Andgate: bit;
signal Orgate: bit;
signal NotA: bit;
signal NotB: bit;
signal Mux1out: bit;
signal Mux2out: bit;
signal Adderout: bit;
begin
	
	--Input invert signals
	NotA <= not alu_ina;
	NotB <= not alu_inb;

	Mux1: onebitmux port map(op0 => alu_inb,op1 => NotB,sel0 => alu_binv, muxout => Mux1out);
	Mux2: onebitmux port map(op0 => alu_ina,op1 => NotA,sel0 => alu_ainv, muxout => Mux2out);
	
	--And/Or gates
	Andgate <= Mux1out and Mux2out;
	Orgate <= Mux1out or Mux2out;
	
	--output signal generation
	Fax: onebitadder port map(a => Mux2out,b => Mux1out,cin => alu_cin, cout => alu_cout, sout => Adderout);
	bit_add_out <= Adderout;
	Mux3: twobitmux port map(op0 => Andgate,op1 => Orgate,op2 => Adderout,op3 => alu_less, sel => alu_op(1 downto 0), muxout => alu_res);
	

end struct;