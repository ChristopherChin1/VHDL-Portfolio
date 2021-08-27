entity alucontrol is
	port(F : in bit_vector(5 downto 0);
		AluOp: in bit_vector(1 downto 0);
		AluCl : out bit_vector(3 downto 0));
end entity alucontrol;


architecture behav of alucontrol is
begin
	--Alu signals based on table provided in Chapter 4 of class textbook (based on function code and Op provided from main control unit)
	AluCl(3) <= '0';
	AluCl(2) <= (not F(2) and F(1) and not F(0) and AluOp(1)) or (not AluOp(1) and AluOp(0));
	AluCl(1) <= ((not F(2) and not F(0) and AluOp(1)) or (not AluOp(1) and not AluOp(0))) or (not AluOp(1) and AluOp(0));
	AluCl(0) <= ((F(2) and not F(1) and F(0)) or (F(3) and not F(2) and F(1) and not F(0))) and AluOp(1);

end architecture behav;

--Working