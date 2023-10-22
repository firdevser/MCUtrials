----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.05.2021 13:57:11
-- Design Name: 
-- Module Name: PCAdder_tb - Behavioral
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

entity PCAdder_tb is
--  Port ( );
end PCAdder_tb;

architecture Behavioral of PCAdder_tb is
component PCAdder
    Port (PCResult: in std_logic_vector(31 downto 0);
          PCAddResult: out std_logic_vector(31 downto 0)   
    );
  end component;
  
   signal PCResult: std_logic_vector(31 downto 0);
   signal PCAddResult: std_logic_vector(31 downto 0) ;
  
begin
uut: PCAdder port map ( PCResult    => PCResult,
                        PCAddResult => PCAddResult );

stimulus: process
  begin
--  wait for 1ps;
--  PCResult <= x"00000000";
--  wait for 10 ns;
--  PCResult <= x"FFFFFFFC";
--  wait for 10 ns;
  PCResult <= x"0000000A";
  wait for 10 ns;
--  PCResult <= x"00000017";
  wait;
 end process;
end Behavioral;
