library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity black_box is
    Port (
        	clk   : in  std_logic;
		rst   : in  std_logic;
		a     : out std_logic;
		b     : out std_logic;
		c     : out std_logic;
		rdy   : out std_logic;
		rt    : out std_logic;
		start : out std_logic;
		endd  : out std_logic;
		stop  : out std_logic;
		status  : out std_logic;
		enable  : out std_logic;
		interrupt  : out std_logic;
		read_enable  : out std_logic;
		write_enable  : out std_logic;
		psel  : out std_logic;
		penable  : out std_logic;
		pready  : out std_logic;
		pwrite  : out std_logic;
		pwaddr  : out std_logic;
		pstrb  : out std_logic;
		status_valid  : out std_logic);
end black_box;

architecture Behavioral of black_box is
    signal cnt : integer range 0 to 31;
begin
    
    process(clk)
    begin
        if rising_edge(clk) then
	    if rst = '1' then
		cnt <= 0;
            elsif cnt = 31 then
                cnt <= 0; 
            else
                cnt <= cnt + 1;  
            end if;
        end if;
    end process;
	
	--Z1
	with cnt select
		start <= '1' when 3,
			   '0' when others;

	with cnt select
		interrupt <= '1' when 5,
			   '0' when others;

	with cnt select
		endd <= '1' when 10,
			   '0' when others;

	with cnt select
		enable <= '1' when 1,
			   '0' when others;

	with cnt select
		stop <= '1' when 9,
			   '0' when others;

	with cnt select
		read_enable <= '1' when 2 | 3 | 4 | 5 | 6 | 11 | 12 | 13,
			   '0' when others;

	with cnt select
		write_enable <= '1' when 7| 8 | 9 | 15 | 16,
			   '0' when others;

	with cnt select
		status_valid <= '1' when 2 | 9 | 18,
			   '0' when others;

	with cnt select
		status <= '1' when 1 | 6 | 15 | 17,
			   '0' when others;

	with cnt select
		rt <= '1' when 2 | 7,
			   '0' when others;
	
	with cnt select
		rdy <= '1' when 4 | 9,
			   '0' when others;

	
	with cnt select
		psel <= '1' when 2 | 6 | 15,
			   '0' when others;

	with cnt select
		penable <= '1' when 3 | 7 | 8 | 9 | 10 | 11 | 16 | 17 | 18,
			   '0' when others;
	
	with cnt select
		pready <= '1' when 3 | 11 | 18,
			   '0' when others;

	
	with cnt select
		pwaddr <= '1' when 15 | 16 | 17 | 18,
			   '0' when others;

	with cnt select
		pwrite <= '1' when 1 | 2 | 3 | 16,
			   '0' when others;
	
	with cnt select
		pstrb <= '1' when 2 | 3,
			   '0' when others;

	with cnt select
		a <= '1' when 3 | 10 ,
			   '0' when others;

	with cnt select
		b <= '1' when 11 | 12 | 13,
			   '0' when others;
	
	with cnt select
		c <= '1' when 4 | 14,
			   '0' when others;

	
	
	
	
		
end Behavioral;
