----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.06.2021 21:52:43
-- Design Name: 
-- Module Name: InstructionMemory_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionMemory_tb is
--  Port ( );
end InstructionMemory_tb;

architecture Behavioral of InstructionMemory_tb is
  component InstructionMemory
    Port (Address: in std_logic_vector(31 downto 0);
          Instruction: out std_logic_vector(31 downto 0)
    );
  end component;
  
  signal Address: std_logic_vector(31 downto 0);
  signal Instruction: std_logic_vector(31 downto 0) ;

begin
  uut: InstructionMemory port map ( Address     => Address,
                                    Instruction => Instruction );

  stimulus: process
  begin
  wait;
  end process;
end Behavioral;
