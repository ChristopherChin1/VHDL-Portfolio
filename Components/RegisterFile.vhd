LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity registerfile is
	port(Instruction, writeData : in bit_vector(31 downto 0);
		RegWrite : in bit;
		
		readData1, readData2 : out bit_vector(31 downto 0));
		
end entity registerfile;

architecture behav of registerfile is

type mipsReg is array (31 downto 0) of bit_vector (31 downto 0);
signal Registers : mipsReg;

signal a,b,c : Integer;
signal readOut,writeTo,tempA,tempB,tempC : bit_vector (31 downto 0);

signal readReg1,readReg2,writeReg : bit_vector (4 downto 0);
begin
	Registers(0) <= "10101010101010101010101010101010";
	Registers(1) <= "11111111111111111111111111111111";
	Registers(2) <= "10101010101010101010101010101010";
	readReg1 <= Instruction(25 downto 21);
	readReg2 <= Instruction(20 downto 16);
	writeReg <= Instruction(15 downto 11);

	--cant get conversion to work correctly so I used constants for array index
	a <= to_integer(unsigned(to_StdLogicVector(readReg1)));
	b <= to_integer(unsigned(to_StdLogicVector(readReg2)));
	c <= to_integer(unsigned(to_StdLogicVector(writeReg)));

	
	tempA <= Registers(0);
	tempB <= Registers(1);
	tempC <= Registers(2);

	myOut: for i in 0 to 31 generate
	begin
	
		readOut(i) <= not RegWrite;

		readData1(i) <= tempA(i) and readOut(i); 
		readData2(i) <=	tempB(i) and readOut(i);
		
		writeTo(i) <= (writeData(i) and not readOut(i)) or (tempC(2) and readOut(i));
	end generate myOut;
	

end architecture behav;
