entity pc is
	port(address : in bit_vector (31 downto 0);
		nextaddress : out bit_vector (31 downto 0));
end entity pc;

architecture behav of pc is
begin
	--fowards next address
	nextaddress <= address;

end architecture behav;
