entity instructionmem is
	port(addressIn, instructionIn : in bit_vector(31 downto 0);
		addressOut, instructionOut : out bit_vector(31 downto 0);
		rwSig : out bit);
end entity instructionmem;

architecture behav of instructionmem is

begin
	rwSig <= '1';
	addressOut <= addressIn;
	instructionOut <= instructionIn;
	
	--Not making memory unit so it would put 
	--adress on memory bus and it would get
	--instuction from memory back
end architecture behav;
