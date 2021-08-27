entity test_bench_data_mem is
end entity test_bench_data_mem;

architecture test_input of test_bench_data_mem is
	signal AIn,dataS,dataI,dataO,AOut,readData : bit_vector(31 downto 0);
	signal MW,MR,RW  : bit;
begin
	dut : entity work.datamemory(behav)
		port map(AIn,dataS,dataI,MW,MR,dataO,AOut,readData,RW);
	stimulus: process is
	begin
	--tests address Ox0 and data input to data mem
	AIn <= "00000000000000000000000000000000";
	dataS <= "11111111111111111111111111111111";
	--data I in from memory bus if there was memory
	dataI <= "10101010101010101010101010101010";
	MR <= '1';
	MW <= '0';
	wait for 20 ns;
	MR <= '0';
	MW <= '1';
	wait for 100 ns;
	
	end process stimulus;
end architecture test_input;
