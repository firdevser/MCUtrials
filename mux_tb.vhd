----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2021 02:48:04
-- Design Name: 
-- Module Name: mux_tb - Behavioral
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
use IEEE.Numeric_Std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_tb is
--  Port ( );
end mux_tb;

architecture Behavioral of mux_tb is
component Mux32Bit2To1
    Port(sel: in std_logic;
         inA: in std_logic_vector(31 downto 0);
         inB: in std_logic_vector(31 downto 0);
         X: out std_logic_vector(31 downto 0)
         );
end component;

  signal sel: std_logic:='0';
  signal inA: std_logic_vector(31 downto 0):= "10011010011011100011100110101011"; 
  signal inB: std_logic_vector(31 downto 0):= "01100101010111100010111110001000";
  signal X: std_logic_vector(31 downto 0);

begin
uut: Mux32Bit2To1 port map (   sel => sel,
                               inA => inA,
                               inB => inB,
                               X   => X );
                               
stimulus: process
   begin
       --wait for 10 ps;
       --inA <= "10011010011011100011100110101011";
       --inB <= "01100101010111100010111110001000";
       --wait for 10 ns;
       sel <= '1';
       wait for 10 ns;
       sel <= '0';
       wait for 10 ns;
   end process stimulus;
end Behavioral;
