----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.05.2021 20:25:44
-- Design Name: 
-- Module Name: SignExtension_tb - Behavioral
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

entity SignExtension_tb is
--  Port ( );
end SignExtension_tb;

architecture Behavioral of SignExtension_tb is
component SignExtension
    Port (Ain: in std_ulogic_vector(15 downto 0);
          Bout: out std_ulogic_vector(31 downto 0)
     );
end component;

signal Ain: std_ulogic_vector(15 downto 0);
signal Bout: std_ulogic_vector(31 downto 0);
  
begin
uut: SignExtension port map ( Ain  => Ain, Bout => Bout );

stimulus: process
  begin
  Ain <= x"abcd";
  wait for 10 ns;
  Ain <= x"7bcd";
  wait for 10 ns;
   wait;
  end process;
end Behavioral;
