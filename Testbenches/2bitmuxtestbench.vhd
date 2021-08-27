entity twobittestbench is
end entity twobittestbench;

architecture test_mux of twobittestbench is
	signal op0,op1,op2,op3,sel0,sel1,muxout : bit;
begin
	dut : entity work.onebitmux(behav)
		port map(op0,op1,sel0,muxout);
	stimulus : process is
	begin
	--tests all possible inputs of mux
	op0 <= '0'; op1 <= '0'; sel0 <= '0';
	wait for 10 ns;
	op0 <= '0'; op1 <= '0'; sel0 <= '1';
	wait for 10 ns;
	op0 <= '0'; op1 <= '1'; sel0 <= '0';
	wait for 10 ns;
	op0 <= '0'; op1 <= '1'; sel0 <= '1';
	wait for 10 ns;
	op0 <= '1'; op1 <= '0'; sel0 <= '0';
	wait for 10 ns;
	op0 <= '1'; op1 <= '0'; sel0 <= '1';
	wait for 10 ns;
	op0 <= '1'; op1 <= '1'; sel0 <= '0';
	wait for 10 ns;
	op0 <= '1'; op1 <= '1'; sel0 <= '1';
	wait for 10 ns;
	end process stimulus;
end architecture test_mux;