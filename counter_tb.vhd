library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_tb is
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is
    component counter is
		port (clk: in std_logic;
		      rst: in std_logic;
			  err: out std_logic;
			  rdy: out std_logic);
	end component counter;
	
	signal clk_s: std_logic;
	signal rst_s: std_logic;
	signal err_s: std_logic;
	signal rdy_s: std_logic;
	
begin

    duv: counter
		port map (
			clk => clk_s,
			rst => rst_s,
			err => err_s,
			rdy => rdy_s);
    
    clk_gen: process
	begin
		clk_s <= '0', '1' after 100 ns;
		wait for 200 ns;
	end process;
	
	rst_gen: process
	begin
		rst_s <= '0', '1' after 300 ns;
		wait;
	end process;
    
end Behavioral;
