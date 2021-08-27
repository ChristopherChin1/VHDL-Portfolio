entity test_bench_4bit is
end entity test_bench_4bit;

architecture test_sum4 of test_bench_4bit is
	signal A,B,S: bit_vector(3 downto 0);
	signal Ci,Co : bit;
begin
	dut : entity work.fourbitadder(struct)
		port map(A,B,Ci,S,Co);
	stimulus: process is
	begin
	A <= "1111";
	B <= "1010";
	Ci <= '0';
	wait for 50 ns;
	A <= "1111";
	B <= "0000";
	Ci <= '1';
	wait for 50 ns;
	A <= "1111";
	B <= "1111";
	Ci <= '0';
	wait for 50 ns;
	end process stimulus;
end architecture test_sum4;