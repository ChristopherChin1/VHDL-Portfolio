
entity onebitadder is
	port(a,b,cin : in bit;
		cout,sout : out bit);
end entity onebitadder;


architecture behav of onebitadder is
begin
	
	sout <= cin xor a xor b;
	cout <= (a and b) or (a and cin) or (b and cin);

end architecture behav;