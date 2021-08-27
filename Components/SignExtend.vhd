entity signextend is
	port(offset : in bit_vector(15 downto 0);
		extended : out bit_vector(31 downto 0));
end entity signextend;

architecture behav of signextend is
begin
	--Sets first 16 bits as input
	Assign: for i in 0 to 15 generate
	begin
		extended(i) <= offset(i);
		
	end generate Assign;
	--Sets higher 16 bits as 0 for sign extend
	Assign2: for i in 16 to 31 generate
	begin
		extended(i) <= offset(15);
	end generate Assign2;

end architecture behav;
