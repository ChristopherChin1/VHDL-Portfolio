entity test_bench_alu_one is
end entity test_bench_alu_one;

architecture test_input of test_bench_alu_one is
	signal A,B,Cin,Binv,Ainv,Less: bit;
	signal testop : bit_vector(1 downto 0);
	signal Cout,Res : bit;
begin
	dut : entity work.onebitalu(struct)
		port map(A,B,Cin,Binv,Ainv,Less,testop,Cout,Res);
	stimulus: process is
	begin
	--tests input for all values of A and B and all ALU operations
	A <= '0';
	B <= '0';
	Cin <= '0';
	Binv <= '0';
	testop <= "00";
	wait for 20 ns;
	testop <= "01";
	wait for 20 ns;
	testop <= "10";
	wait for 20 ns;
	testop <= "11";
	wait for 50 ns;
	A <= '0';
	B <= '1';
	Cin <= '0';
	Binv <= '0';
	testop <= "00";
	wait for 20 ns;
	testop <= "01";
	wait for 20 ns;
	testop <= "10";
	wait for 20 ns;
	testop <= "11";
	wait for 50 ns;
	A <= '1';
	B <= '0';
	Cin <= '0';
	Binv <= '0';
	testop <= "00";
	wait for 20 ns;
	testop <= "01";
	wait for 20 ns;
	testop <= "10";
	wait for 20 ns;
	testop <= "11";
	wait for 50 ns;
	A <= '1';
	B <= '1';
	Cin <= '0';
	Binv <= '0';
	testop <= "00";
	wait for 20 ns;
	testop <= "01";
	wait for 20 ns;
	testop <= "10";
	wait for 20 ns;
	testop <= "11";
	wait for 50 ns;
	end process stimulus;
end architecture test_input;
