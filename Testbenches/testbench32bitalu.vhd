entity test_bench_32alu is
end entity test_bench_32alu;

architecture test_input of test_bench_32alu is
	signal A,B,Res: bit_vector(31 downto 0);
	signal Op: bit_vector(3 downto 0);
	signal Ci,Co : bit;
begin
	dut : entity work.alu32bit(struct)
		port map(A,B,Op,Ci,Res,Co);
	stimulus: process is
	begin
	--tests two different input values and every ALU operation possible
	A <= "10101010101010101010101010101010";
	B <= "10101010101010101010101010101010";
	Ci <= '0';
	Op <= "0000";
	wait for 50 ns;
	Op <= "0001";
	wait for 50 ns;
	Op <= "0010";
	wait for 50 ns;
	Op <= "0110";
	wait for 50 ns;
	Op <= "0111";
	wait for 50 ns;
	Op <= "1100";
	wait for 200 ns;
	A <= "00000000000000000000000000000000";
	B <= "10101010101010101010101010101010";
	Ci <= '0';
	Op <= "0000";
	wait for 50 ns;
	Op <= "0001";
	wait for 50 ns;
	Op <= "0010";
	wait for 50 ns;
	Op <= "0110";
	wait for 50 ns;
	Op <= "0111";
	wait for 50 ns;
	Op <= "1100";
	wait for 200 ns;
	end process stimulus;
end architecture test_input;