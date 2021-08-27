entity test_bench_alu_control is
end entity test_bench_alu_control;

architecture test_input of test_bench_alu_control is
	signal testF : bit_vector(5 downto 0);
	signal testOp : bit_vector(1 downto 0);
	signal testCl : bit_vector(3 downto 0);
begin
	dut : entity work.alucontrol(behav)
		port map(testF,testOp,testCl);
	stimulus: process is
	begin
	--tests all values for ALU needed and all operations 
	testOP <= "00";
	testF <= "111111";
	wait for 20 ns;

	testOP <= "01";
	testF <= "111111";
	wait for 20 ns;

	testOP <= "10";
	testF <= "100000";
	wait for 20 ns;

	testOP <= "10";
	testF <= "100010";
	wait for 20 ns;

	testOP <= "10";
	testF <= "100100";
	wait for 20 ns;

	testOP <= "10";
	testF <= "100101";
	wait for 20 ns;

	testOP <= "10";
	testF <= "101010";
	wait for 100 ns;
	
	end process stimulus;
end architecture test_input;
