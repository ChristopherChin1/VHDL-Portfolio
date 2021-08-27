entity controlunit is
	port(opcode : in bit_vector(5 downto 0);
		PCWriteCond,MemRead,MemWrite,MemtoReg,RegDst,RegWrite,ALUSrc,Branch,PCSource  : out bit;
		ALUOp : out bit_vector(1 downto 0));
end entity controlunit;

architecture behav of controlunit is

signal R : bit;
signal L : bit;
signal S : bit;
signal B : bit;

begin
	--signals for if function is rtype, load, store, or branch
	R <= not opcode(5) and not opcode(4) and not opcode(3) and not opcode(2) and not opcode(1) and not opcode(0);
	L <= (opcode(5) and not opcode(4) and not opcode(3) and not opcode(2) and opcode(1) and opcode(0));
	S <= (opcode(5) and not opcode(4) and opcode(3) and not opcode(2) and opcode(1) and opcode(0));
	B <= not opcode(5) and not opcode(4) and not opcode(3) and opcode(2) and not opcode(1) and not opcode(0);
	
	--set output signals according to table provided in lecture
	RegDst <= R;
	AluSrc <= L or S;
	MemtoReg <= L;
	RegWrite <= R or L;
	MemRead <= L;
	MemWrite <= S;
	Branch <= B;
	ALUOp(1) <= R;
	ALUOp(0) <= B;
	PCWriteCond <= B;
	PCSource <= R or L or S; 


end architecture behav;
