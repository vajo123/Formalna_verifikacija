library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    Port (
        clk   : in  std_logic;
		rst   : in  std_logic;
		err   : out std_logic;
		rdy   : out std_logic);
end counter;

architecture Behavioral of counter is
    signal cnt : std_logic_vector(3 downto 0) := "0000";
begin
    
    process(clk)
    begin
        if rising_edge(clk) then
			if rst = '0' then
				cnt <= "0000";
            elsif cnt = "1111" then
                cnt <= "0000"; 
            else
                cnt <= std_logic_vector(unsigned(cnt(3 downto 0)) + to_unsigned(1, 4));  
            end if;
        end if;
    end process;
	
	--Z2
	--with cnt select
	--	err <= '1' when "0011" | "0100" | "1000" | "1001"  | "1010" | "1011",
	--		   '0' when others;   
	
	--Z3
	with cnt select
		err <= '1' when "0011" | "0111" | "1000" | "1011",
			   '0' when others;  
			   
	with cnt select
		rdy <= '1' when "0011" | "0100" | "0111" | "1011",
			   '0' when others;  

end Behavioral;
