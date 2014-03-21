Lab3
====
##### Code Commenting

###Good code:

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
			
#The above code is good because it is neat, organized, and uniform. This makes it easy to read and edit.

---------------------------------------------------------------------------------------
--This component converts a nibble to a value that can be viewed on a 7-segment display
--Similar in function to a 7448 BCD to 7-seg decoder
--Inputs: 4-bit vector called "nibble"
--Outputs: 8-bit vector "sseg" used for driving a single 7-segment display
---------------------------------------------------------------------------------------
	COMPONENT nibble_to_sseg
	PORT(
		nibble : IN std_logic_vector(3 downto 0);          
		sseg : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

---------------------------------------------------------------------------------------------
--This component manages the logic for displaying values on the NEXYS 2 7-segment displays
--Inputs: system clock, synchronous reset, 4 8-bit vectors from 4 instances of nibble_to_sseg
--Outputs: 7-segment display select signal (4-bit) called "sel", 
--         8-bit signal called "sseg" containing 7-segment data routed off-chip
---------------------------------------------------------------------------------------------
	COMPONENT nexys2_sseg
	GENERIC ( CLOCK_IN_HZ : integer );
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		sseg0 : IN std_logic_vector(7 downto 0);
		sseg1 : IN std_logic_vector(7 downto 0);
		sseg2 : IN std_logic_vector(7 downto 0);
		sseg3 : IN std_logic_vector(7 downto 0);          
		sel : OUT std_logic_vector(3 downto 0);
		sseg : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	

#This part of the code was also written pretty well in my opinion. The comments are neat and organized in a
#heading, and the spacing of the code helps keep it readable. Also, the code is broken into nice little modules
#which I think would make it easier to debug in case something goes wrong or you want to make an edit in the future.
#The Nexys top shell code in general was written pretty well due to it being neat and organized like above



Bad code:

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


^^ The above code is not necessarily bad, but it could be better. 
The problem is that it is very cluttered and it is hard to read.
Also, it could use more spacing in between parts of the code and
comments in order to help increase readability.
