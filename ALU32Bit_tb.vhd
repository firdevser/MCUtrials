----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.05.2021 01:26:30
-- Design Name: 
-- Module Name: ALU32Bit_tb - Behavioral
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
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU32Bit_tb is
--  Port ( );
end ALU32Bit_tb;

architecture Behavioral of ALU32Bit_tb is
component ALU32Bit
 Port(
  ALUControl: in std_logic_vector(3 downto 0);
  A: in std_logic_vector(31 downto 0);
  B: in std_logic_vector(31 downto 0);
  ALUResult: inout std_logic_vector(31 downto 0);
  ZERO: out std_logic
   );
end component;

signal A: std_logic_vector(31 downto 0):= (others => '0');
signal B: std_logic_vector(31 downto 0):= (others => '0');
signal ALUControl: std_logic_vector(3 downto 0):= x"0";
signal ALUResult: std_logic_vector(31 downto 0);
signal ZERO: std_logic;

signal i: integer;
begin
UUT: ALU32Bit port map (
A => A, B => B, ALUControl => ALUControl, ALUResult => ALUResult, ZERO => ZERO);

stimulus: process
   begin  
 -- A <= x"00000064"; B <= x"00000056";
 -- A <= x"FFFF0000"; B <= x"0000000F";
 -- A <= x"FFFFFFFF"; B <= x"0000001";  
 -- A <= x"FFFFFFFF"; B <= x"FFFFFFFF"; 
    A <= x"00000FED"; B <= x"00000005"; ALUControl <= "0000";
   
   for i in 0 to 15 loop 
   ALUControl <= ALUControl + "0001";
   wait for 10 ns;
   end loop;
     
   wait;

  end process;
end Behavioral;