----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.06.2021 15:05:59
-- Design Name: 
-- Module Name: InstructionMemory - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionMemory is
  Port (Address: in std_logic_vector(31 downto 0);
        Instruction: out std_logic_vector(31 downto 0)
  );
end InstructionMemory;

architecture Behavioral of InstructionMemory is
type RAM_1024x32 is array (0 to 15) of std_logic_vector(31 downto 0);
    signal IM: RAM_1024x32:= (x"2010000e",
                              x"2011000f",
                              x"2012001d",
                              x"2013fff1",
                              x"02324020",
                              x"02504024",
                              x"72114002",
                              x"02504025",
                              x"36080010",
                              x"02124022",
                              x"72604021",
                              x"72404020",
                              x"0211402a",
                              x"0230402a",
                              x"00114080",
                              x"001240c2");
--"memory[0] = 32'h2010000e;"	//	main:	addi	$s0, $zero, 14
--"memory[1] = 32'h2011000f;"	//		addi	$s1, $zero, 15
--"memory[2] = 32'h2012001d;"	//		addi	$s2, $zero, 29
--"memory[3] = 32'h2013fff1;"	//		addi	$s3, $zero, -15
--"memory[4] = 32'h02324020;"	//		add	$t0, $s1, $s2
--"memory[5] = 32'h02504024;"	//		and	$t0, $s2, $s0
--"memory[6] = 32'h72114002;"	//		mul	$t0, $s0, $s1
--"memory[7] = 32'h02504025;"	//		or	$t0, $s2, $s0
--"memory[8] = 32'h36080010;"	//		ori	$t0, $s0, 16
--"memory[9] = 32'h02124022;"	//		sub	$t0, $s0, $s2
--"memory[10] = 32'h72604021;"	//		clo	$t0, $s3
--"memory[11] = 32'h72404020;"	//		clz	$t0, $s2
--"memory[12] = 32'h0211402a;"	//		slt	$t0, $s0, $s1
--"memory[13] = 32'h0230402a;"	//		slt	$t0, $s1, $s0
--"memory[14] = 32'h00114080;"	//		sll	$t0, $s1, 2
--"memory[15] = 32'h001240c2;"	//		srl	$t0, $s2, 3

begin
Instruction <= IM((TO_INTEGER(unsigned(Address))*4));
end Behavioral;
