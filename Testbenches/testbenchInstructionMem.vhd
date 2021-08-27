entity test_bench_inst_mem is
end entity test_bench_inst_mem;

architecture test_input of test_bench_inst_mem is
	signal AIn,InstIn,AOut,InstOut : bit_vector(31 downto 0);
	signal rw : bit;
begin
	dut : entity work.instructionmem(behav)
		port map(AIn,InstIn,AOut,InstOut,rw);
	stimulus: process is
	begin
	AIn <= "00000000000000000000000000000000";
	InstIn <= "10101010101010101010101010101010";
	wait for 20 ns;
	
	-- Sets input address to Ox0 and the next instruction from memory as OxAAAAAAAA

	end process stimulus;
end architecture test_input;
