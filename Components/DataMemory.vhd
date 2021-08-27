entity datamemory is
	port(addressIn, dataSrc, dataIn : in bit_vector (31 downto 0);
		MemWrite, MemRead : in bit;
		dataOut, addressOut, readData : out bit_vector (31 downto 0);
		rw : out bit);
end entity datamemory;

architecture behav of datamemory is
begin	
	--generating output based on write signal
	Writing: for i in 0 to 31 generate
	begin
		Wx: dataOut(i) <= dataSrc(i) and MemWrite;
	end generate Writing;
	--signals send to memory bus
	rw <= MemRead and not MemWrite;
	addressOut <= addressIn;
	readData <= dataIn;
	

	--Explaination: Since I'm not making memory
	--I place data and address on memory bus 
	--and output a r/w signal r high w low
	--data placed on bus is 
end architecture behav;
