
entity onebittestbench is
end entity onebittestbench;

architecture test_mux of onebittestbench is
	signal op0,op1,sel0,muxout : bit;
begin
	dut : entity work.onebitmux(behav)
		port map(op0,op1,sel0,muxout);
	stimulus : process is
	begin
	--test input all values for 1 bit mux
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