entity alu32bit is
	port(Alu_A,Alu_B: in bit_vector(31 downto 0); Alu_Op: in bit_vector(3 downto 0); Alu_Cin: in bit;
		Alu_Res: out bit_vector(31 downto 0); Alu_Cout: out bit);
end entity alu32bit;

architecture struct of alu32bit is
component onebitalu
	port(alu_ina,alu_inb,alu_cin,alu_binv,alu_ainv,alu_less : in bit;
		alu_op : in bit_vector(1 downto 0);
		alu_cout,alu_res, bit_add_out: out bit);
end component;
--signals
signal C : bit_vector(32 downto 0);
signal myLess: bit_vector(31 downto 0);
signal MuxOp: bit_vector(1 downto 0);
signal Alu_Ainv, Alu_Binv, SubCarry: bit;


begin
	
	--design based on design provided in class
	MuxOp(1) <= (Alu_Op(1) and not Alu_op(0)) or (Alu_Op(1) and Alu_op(0));
	MuxOp(0) <= (not Alu_Op(1) and Alu_op(0)) or (Alu_Op(1) and Alu_op(0));

	Alu_Ainv <= Alu_Op(2) and not Alu_Op(1) and not Alu_op(0);
	Alu_Binv <= Alu_Op(2) and Alu_Op(1) and not Alu_Op(0);

	SubCarry <= Alu_Cin or (Alu_Op(2) and Alu_Op(1) and not Alu_Op(0));

	C(0) <= SubCarry;

	Alu0: onebitalu port map(alu_ina => Alu_A(0),
					alu_inb => Alu_B(0),
					alu_cin => C(0),
					alu_binv => Alu_Binv,
					alu_ainv => Alu_Ainv,
					alu_less => myLess(31),
					alu_op => MuxOP,  
					alu_cout => C(1),
					alu_res => Alu_Res(0),
					bit_add_out => myLess(0));

	Alu32: for i in 1 to 31 generate
	begin
		Alux: onebitalu port map(alu_ina => Alu_A(i),
					alu_inb => Alu_B(i),
					alu_cin => C(i),
					alu_binv => Alu_Binv,
					alu_ainv => Alu_Ainv,
					alu_less => '0',
					alu_op => MuxOP,  
					alu_cout => C(i+1),
					alu_res => Alu_Res(i),
					bit_add_out => myLess(i));
	end generate Alu32;
	
	


	Alu_Cout <= C(32);
end struct;

---Control singals to decode to Invert signals and mux op signals implemented
---SLT has been implemented