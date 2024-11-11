library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    Port (
        	clk   : in  std_logic;
		rst   : in  std_logic;
		err   : out std_logic;
		rdy   : out std_logic;
		rt    : out std_logic;
		start : out std_logic;
		endd  : out std_logic;
		stop  : out std_logic;
		status  : out std_logic;
		enable  : out std_logic;
		interrupt  : out std_logic;
		status_valid  : out std_logic);
end counter;

architecture Behavioral of counter is
    signal cnt : integer range 0 to 15;
begin
    
    process(clk)
    begin
        if rising_edge(clk) then
	    if rst = '1' then
		cnt <= 0;
            elsif cnt = 15 then
                cnt <= 0; 
            else
                cnt <= cnt + 1;  
            end if;
        end if;
    end process;
	
	--Z1
	--with cnt select
	--	rt <= '1' when 0 | 1 | 2 | 3 | 4 | 9,
	--		   '0' when others;

	--with cnt select
	--	rdy <= '1' when 6,
	--		   '0' when others;

	--with cnt select
	--	start <= '1' when 9,
	--		   '0' when others;
	
	--with cnt select
	--	endd <= '1' when 7,
	--		   '0' when others;
	
	--Z2
	--with cnt select
	--	err <= '1' when 3 | 4 | 8 | 9 | 10 | 11,
	--		   '0' when others;   
	
	--Z3
	--with cnt select
	--	err <= '1' when 2 | 6 | 7 | 10,
	--		   '0' when others;  
			   
	--with cnt select
	--	rdy <= '1' when 2 | 4 | 6 | 10,
	--		   '0' when others;

	--Z4
	--with cnt select
	--	start <= '1' when 3,
	--		   '0' when others;  
			   
	--with cnt select
	--	rdy <= '1' when 7,
	--		   '0' when others;

	--Z5
	--stop <= '0';
	--with cnt select
	--	err <= '1' when 11,
	--		   '0' when others;

	--with cnt select
	--	rdy <= '1' when 2 | 3 | 9 | 10 | 11,
	--		   '0' when others;

	--with cnt select
	--	start <= '1' when 9,
	--		   '0' when others;
	
	--with cnt select
	--	endd <= '1' when 3,
	--		   '0' when others;

	--Z6
	--with cnt select
	--	err <= '1' when 11,
	--		   '0' when others;

	--with cnt select
	--	rdy <= '1' when 2 | 3 | 5 | 6 | 7 | 10 | 11,
	--		   '0' when others;

	--with cnt select
	--	stop <= '1' when 6,
	--		   '0' when others;
	
	--with cnt select
	--	endd <= '1' when 3,
	--		   '0' when others;

	--Z7
	--with cnt select
	--	status_valid <= '1' when 11,
	--		   '0' when others;

	--with cnt select
	--	status <= '1' when 6,
	--		   '0' when others;
	
	--with cnt select
	--	endd <= '1' when 4,
	--		   '0' when others;

	--Z8
	--with cnt select
	--	enable <= '1' when 8,
	--		   '0' when others;

	--with cnt select
	--	rt <= '1' when 0 | 1 | 2 | 3,
	--		   '0' when others;

	--Z9
	with cnt select
		rdy <= '1' when 3|4|5|6|7|8,
			   '0' when others;

	with cnt select
		start <= '1' when 6 | 7 | 8,
			   '0' when others;

	with cnt select
		interrupt <= '1' when 8,
			   '0' when others;
	
	
		
end Behavioral;
