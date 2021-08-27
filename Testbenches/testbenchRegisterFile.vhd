entity test_bench_reg_file is
end entity test_bench_reg_file;

architecture test_input of test_bench_reg_file is
	signal Inst,wData,rData1,rData2 : bit_vector(31 downto 0);
	signal RW  : bit;
	--signal A,B : integer;
begin
	dut : entity work.registerfile(behav)
		port map(Inst,wData,RW, rData1,rData2);
	stimulus: process is
	begin
	Inst <= "00000000000000010000000000000000";
	wData <= "10101010101010101010101010101010";
	RW <= '0';
	wait for 100 ns;
	
	end process stimulus;
end architecture test_input;
