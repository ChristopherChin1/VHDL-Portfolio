
entity test_bench_32bit is
end entity test_bench_32bit;

architecture test_sum32 of test_bench_32bit is
	signal A,B,S: bit_vector(31 downto 0);
	signal Ci,Co : bit;
begin
	dut : entity work.adder32bit(struct)
		port map(A,B,Ci,S,Co);
	stimulus: process is
	begin
	A <= "10101010101010101010101010101010";
	B <= "10101010101010101010101010101010";
	Ci <= '0';
	wait for 400 ns;
	A <= "00000000000000000000000000000000";
	B <= "11111111111111111111111111111111";
	Ci <= '1';
	wait for 400 ns;
	A <= "00000000000000001010001000000011";
	B <= "00000000000000000111011000010110";
	Ci <= '0';
	wait for 400 ns;
	end process stimulus;
end architecture test_sum32;