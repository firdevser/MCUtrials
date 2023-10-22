----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.06.2021 14:42:33
-- Design Name: 
-- Module Name: DataMemory_tb - Behavioral
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

entity DataMemory_tb is
--  Port ( );
end DataMemory_tb;

architecture Behavioral of DataMemory_tb is
  component DataMemory
    Port ( Address, WriteData: in std_logic_vector(31 downto 0);
           Clk, MemWrite, MemRead: in std_logic;
           ReadData: out std_logic_vector(31 downto 0)
    );
  end component;
  
  signal Address, WriteData: std_logic_vector(31 downto 0);
  signal Clk, MemWrite, MemRead: std_logic;
  signal ReadData: std_logic_vector(31 downto 0);
    constant clk_period : time := 2 ns;
    
begin
  uut: entity work.DataMemory(Behavioral) port map ( Address   => Address,
                             WriteData => WriteData,
                             Clk       => Clk,
                             MemWrite  => MemWrite,
                             MemRead   => MemRead,
                             ReadData  => ReadData );

stimulus: process
  begin
  Address <= x"10010000";
  WriteData <= x"11112222";
  MemWrite <= '0';
  wait for 10 ns;
  MemWrite <= '1';
  wait for 10 ns;
  MemWrite <= '0';
  wait for 10 ns;
   assert false
      report "End"
      severity failure;
end process;

clocking: process
  begin
        clk <= '0';
        wait for clk_period/2;  --for 1 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 1 ns signal is '1'.
  end process;
end Behavioral;
