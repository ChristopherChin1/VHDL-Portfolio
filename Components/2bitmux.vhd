
entity twobitmux is
	port(op0,op1,op2,op3 : in bit;
		sel : in bit_vector(1 downto 0);
		muxout : out bit);
end entity twobitmux;

architecture behav of twobitmux is
begin
	--mux logic	
	muxout <= (op0 and (not sel(1) and not sel(0))) or 
			(op1 and (not sel(1) and sel(0))) or
			(op2 and (sel(1) and not sel(0))) or 
			(op3 and (sel(1) and sel(0)));

end architecture behav;