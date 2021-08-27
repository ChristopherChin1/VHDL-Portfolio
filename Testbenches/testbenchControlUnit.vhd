entity test_bench_control is
end entity test_bench_control;

architecture test_input of test_bench_control is
	signal OpIn : bit_vector(5 downto 0);
	signal PCWC,MR,MW,M2R,RD,RW,ALUS,B,PCS  : bit;
	signal AluOpOut : bit_vector(1 downto 0);
begin
	dut : entity work.controlunit(behav)
		port map(OpIn,PCWC,MR,MW,M2R,RD,RW,ALUS,B,PCS,AluOpOut);
	stimulus: process is
	begin
	--tests possible inputs 0, 35, 43, and 4
	OpIn <= "000000";

	wait for 20 ns;
	OpIn <= "100011";

	wait for 20 ns;
	OpIn <= "101011";

	wait for 20 ns;
	OpIn <= "000100";

	wait for 100 ns;
	
	end process stimulus;
end architecture test_input;
