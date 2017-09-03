LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY GPIO_TB IS
	GENERIC (
	n: INTEGER :=4; -- Numero de bits dos registradores
	k: INTEGER :=3 -- Numero de registradores   0=DIR  1=INPUT_VAL 2=OUTPUT_VAL
	);
END GPIO_TB;
 
ARCHITECTURE BEHAVIOR OF GPIO_TB IS 
	
   		-- Porta de Writing
			signal Data_In_tb: std_logic_vector (n-1 downto 0):= (others => '0');
			signal W_tb: std_logic := '0';
			
			-- Porta de Reading
			signal Data_Out_tb: std_logic_vector (n-1 downto 0);
			signal R_tb: std_logic := '0';
			
			--Enrecamento
			
			signal Reg_Add_tb: integer range 0 to k-1 := 0;
			
			-- Outras variaveis
			signal clk_tb:  std_logic := '0';
			signal reset_tb:  std_logic := '0';
			signal PIN_tb : std_logic_vector (n-1 downto 0):= (others => '0');

 
BEGIN
   duv: entity work.GPIO 
		
		generic map(
			n => n,
			k => k
		)
	
		PORT MAP (
	
		Data_In => Data_In_tb,
		W => W_tb,
		Data_Out => Data_Out_tb,
		R => R_tb,
		Reg_Add => Reg_Add_tb,
		clk => clk_tb,
		reset => reset_tb,
		PIN => PIN_tb
		
		);
		
		process
	begin
		wait for 20 ns;
		clk_tb <= not clk_tb;
	end process;
	
	
	process
   begin
      -- insert stimulus here 		
		PIN_tb <= "1Z1Z";
		Data_In_tb <= "0101";
		Reg_Add_tb <= 0;
		W_tb <= '1';
		wait until rising_edge(clk_tb);
		Data_In_tb <= "1001";
		Reg_Add_tb <= 2;
		W_tb <= '1';
		wait until rising_edge(clk_tb);
		W_tb <= '0';
		R_tb <= '1';
		Reg_Add_tb <= 0; --conferir se registrou corretamente
		wait until rising_edge(clk_tb);
		Reg_Add_tb <= 2; --conferir se registrou corretamente
      wait until rising_edge(clk_tb);
		Reg_Add_tb <= 1; -- conferir se a logica do PIN esta corretamente (Armazenada dentro do INPUT_VAL)
		
		wait until rising_edge(clk_tb);
		reset_tb <= '1';
		wait until rising_edge(clk_tb);	
		reset_tb <= '0';
		wait until rising_edge(clk_tb);
		
		PIN_tb <= "10ZZ";
		Data_In_tb <= "0011";
		Reg_Add_tb <= 0;
		W_tb <= '1';
		wait until rising_edge(clk_tb);
		Data_In_tb <= "1001";
		Reg_Add_tb <= 2;
		W_tb <= '1';
		wait until rising_edge(clk_tb);
		W_tb <= '0';
		R_tb <= '1';
		Reg_Add_tb <= 0; --conferir se registrou corretamente
		wait until rising_edge(clk_tb);
		Reg_Add_tb <= 2; --conferir se registrou corretamente
		wait until rising_edge(clk_tb);
		Reg_Add_tb <= 1; -- conferir se a logica do PIN esta corretamente (Armazenada dentro do INPUT_VAL)
		wait;
		
		
   end process;

END ARCHITECTURE;