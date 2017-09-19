# GPIO
Project in VHDL of General Purpose Input/Output

GPIO is an integrated circuit that have generic pin, which can be an Input or Output pin.

We have three files:
- The code itself (GPIO.vhd)
- A testbench of the principal code (GPIO_TB.vhd)
- A file "do" that have the instructions of what must do for simulation (tb_project.do)

Used the programs Quartus 13.0 sp1 and ModelSim_Altera 10.1d.

## The Code
###### The Pins

                    -- Writing Pins
			Data_In: in std_logic_vector (n-1 downto 0);
			W: in std_logic;
			
			-- Reading Pins
			Data_Out: out std_logic_vector (n-1 downto 0);
			R: in std_logic;
			
			-- Adress
			
			Reg_Add: integer range 0 to k-1;
			
			-- Others Pins
			clk: in std_logic;
			reset: in std_logic;
			PIN : inout std_logic_vector (n-1 downto 0)


###### The registers

For this code, there is only 3 registers, DIR, INPUT_VALUE and OUTPUT_VALUE. 
- DIR hold the directions of the PIN (if is input or output)
- INPUT_VALUE hold the values of PIN which is an input
  - Is good to say that this registers hold the value of OUTPUT_VALUE when PIN is an output
- OUTPUT_VALUE hold the value of what is going to be the output of PIN
