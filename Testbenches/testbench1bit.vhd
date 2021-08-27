entity test_bench_1bit is
end entity test_bench_1bit;

architecture test_sum of test_bench_1bit is
	signal a,b,cin,cout,sout : bit;
begin
	dut : entity work.onebitadder(behav)
		port map(a,b,cin,cout,sout);
	stimulus : process is
	begin
	a <= '0'; b <= '0'; cin <= '0';
	wait for 10 ns;
	a <= '0'; b <= '0'; cin <= '1';
	wait for 10 ns;
	a <= '0'; b <= '1'; cin <= '0';
	wait for 10 ns;
	a <= '0'; b <= '1'; cin <= '1';
	wait for 10 ns;
	a <= '1'; b <= '0'; cin <= '0';
	wait for 10 ns;
	a <= '1'; b <= '0'; cin <= '1';
	wait for 10 ns;
	a <= '1'; b <= '1'; cin <= '0';
	wait for 10 ns;
	a <= '1'; b <= '1'; cin <= '1';
	wait for 10 ns;
	end process stimulus;
end architecture test_sum;
	