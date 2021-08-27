entity onebitmux is
	port(op0,op1,sel0 : in bit;
		muxout : out bit);
end entity onebitmux;

architecture behav of onebitmux is
begin
	--mux operation
	muxout <= (op0 and not sel0) or (op1 and sel0);

end architecture behav;