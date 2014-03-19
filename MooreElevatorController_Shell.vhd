----------------------------------------------------------------------------------
-- Company: USAFA/DFEC
-- Engineer: Silva
-- 
-- Create Date:    	10:33:47 07/07/2012 
-- Design Name:		CE3
-- Module Name:    	MooreElevatorController_Shell - Behavioral 
-- Description: 		Shell for completing CE3
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MooreElevatorController_Shell is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  pickfloor : in STD_LOGIC_VECTOR (3 downto 0);
			  floorone : out STD_LOGIC_VECTOR  (3 downto 0);
			  direction : out STD_LOGIC;
			  move : out STD_LOGIC );
			  
			  
end MooreElevatorController_Shell;

architecture Behavioral of MooreElevatorController_Shell is

--Below you create a new variable type! You also define what values that 
--variable type can take on. Now you can assign a signal as 
--"floor_state_type" the same way you'd assign a signal as std_logic 
type floor_state_type is (floor1, floor2, floor3, floor5, floor7, floor11, floor13, floor17);

--Here you create a variable "floor_state" that can take on the values
--defined above. Neat-o!
signal floor_state : floor_state_type;

signal stop : STD_LOGIC;
signal up_down : STD_LOGIC;
signal current : STD_LOGIC_VECTOR (3 downto 0);


begin
---------------------------------------------
--Below you will code your next-state process
---------------------------------------------

--This line will set up a process that is sensitive to the clock
floor_state_machine: process(clk)

begin
	if (pickfloor > current) then 
			up_down <='1'; 
			stop<='0'; 
			move <='1'; elsif
			
		(pickfloor < current) then 
			up_down <='0'; 
			stop<='0';
			move <='1'; else
			
			stop <='1';
			move <='0';
		end if;
		
		direction <= up_down;
		
	--clk'event and clk='1' is VHDL-speak for a rising edge
	if clk'event and clk='1' then
		--reset is active high and will return the elevator to floor1
		--Question: is reset synchronous or asynchronous?


		if reset='1' then
			floor_state <= floor1;
		--now we will code our next-state logic
		else
			case floor_state is
				--when our current state is floor1
				when floor1 =>
					--if up_down is set to "go up" and stop is set to 
					--"don't stop" which floor do we want to go to?
					if (up_down='1' and stop='0') then 
						--floor2 right?? This makes sense!
						floor_state <= floor2;
					--otherwise we're going to stay at floor1
					else
						floor_state <= floor1;
					end if;
--FLOOR 1 --
				when floor2 => 
					--if up_down is set to "go up" and stop is set to 
					--"don't stop" which floor do we want to go to?
					if (up_down='1' and stop='0') then 
						floor_state <= floor3; 			
					--if up_down is set to "go down" and stop is set to 
					--"don't stop" which floor do we want to go to?
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor1;
					--otherwise we're going to stay at floor2
					else
						floor_state <= floor2;
					end if;
				
--FLOOR 2--
				when floor3 =>
						--if the elevator goes up with no stop, we go 
						--up a floor
					if (up_down='1' and stop='0') then 
						floor_state <= floor5;
						--if the elevator goes down with no stop, we go
						--down a floor
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor2;	
						--In all other cases, we stay at the same floor since the 
						--elevator does not move
					else
						floor_state <= floor3;	
					end if;
--FLOOR 3--
				when floor5 =>
						--if the elevator goes up with no stop, we go 
						--up a floor
					if (up_down='1' and stop='0') then 
						floor_state <= floor7;
						--if the elevator goes down with no stop, we go
						--down a floor
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor3;	
						--In all other cases, we stay at the same floor since the 
						--elevator does not move
					else
						floor_state <= floor5;	
					end if;
--FLOOR 4--
				when floor7 =>
						--if the elevator goes up with no stop, we go 
						--up a floor
					if (up_down='1' and stop='0') then 
						floor_state <= floor11;
						--if the elevator goes down with no stop, we go
						--down a floor
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor5;	
						--In all other cases, we stay at the same floor since the 
						--elevator does not move
					else
						floor_state <= floor7;	
					end if;		
--FLOOR 5--
				when floor11 =>
						--if the elevator goes up with no stop, we go 
						--up a floor
					if (up_down='1' and stop='0') then 
						floor_state <= floor13;
						--if the elevator goes down with no stop, we go
						--down a floor
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor7;	
						--In all other cases, we stay at the same floor since the 
						--elevator does not move
					else
						floor_state <= floor11;	
					end if;		
--FLOOR 6--
				when floor13 =>
						--if the elevator goes up with no stop, we go 
						--up a floor
					if (up_down='1' and stop='0') then 
						floor_state <= floor17;
						--if the elevator goes down with no stop, we go
						--down a floor
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor11;	
						--In all other cases, we stay at the same floor since the 
						--elevator does not move
					else
						floor_state <= floor13;	
					end if;		
--FLOOR 7--
				when floor17 =>
						--if the elevator goes up with no stop, we go 
						--up a floor
					if (up_down='1' and stop='0') then 
						floor_state <= floor17;
						--if the elevator goes down with no stop, we go
						--down a floor
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor13;	
						--In all other cases, we stay at the same floor since the 
						--elevator does not move
					else
						floor_state <= floor17;	
					end if;					
--FLOOR 8--
--				when floor19 =>
--						--if the elevator goes up with no stop, we go 
--						--up a floor
--					if (up_down='1' and stop='0') then 
--						floor_state <= floor19;
--						--if the elevator goes down with no stop, we go
--						--down a floor
--					elsif (up_down='0' and stop='0') then 
--						floor_state <= floor17;	
--						--In all other cases, we stay at the same floor since the 
--						--elevator does not move
--					else
--						floor_state <= floor19;	
--					end if;
				
				--This line accounts for phantom states
				when others =>
					floor_state <= floor1;
			end case;
		end if;
	end if;
end process;

-- Here you define your output logic. Finish the statements below
--For this part, I did not know how to start at floor2, so I started at
--floor1, and adjusted the outputs by making them offset by 1.
current <= "0000" when (floor_state = floor1) else --0
			"0001" when (floor_state = floor2) else    --1
			"0010" when (floor_state = floor3) else    --2
			"0011" when (floor_state = floor5) else    --3
			"0100" when (floor_state = floor7) else    --4
			"0101" when (floor_state = floor11) else   --5
			"0110" when (floor_state = floor13) else   --6
			"0111" when (floor_state = floor17) else   --7		
			"0001";

floorone <= current;			

--floorten <= "0001" when (floor_state = floor7) else
--			   "0001" when (floor_state = floor11) else
--				"0001" when (floor_state = floor13) else
--				"0001" when (floor_state = floor17) else
--				"0000";

end Behavioral;

