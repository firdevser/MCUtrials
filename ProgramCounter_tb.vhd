----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.05.2021 15:20:25
-- Design Name: 
-- Module Name: ProgramCounter_tb - Behavioral
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

entity ProgramCounter_tb is
--  Port ( );
end ProgramCounter_tb;

architecture Behavioral of ProgramCounter_tb is
 component ProgramCounter
    Port (Address: in std_logic_vector(31 downto 0);
          Reset, Clk: in std_logic;
          PCResult: out std_logic_vector(31 downto 0)
    );
  end component;
  
  signal Address: std_logic_vector(31 downto 0):=  x"0000000A";
  signal Reset: std_logic:='0';
  signal Clk: std_logic;
  signal PCResult: std_logic_vector(31 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin
uut: ProgramCounter port map ( Address  => Address,
                               Reset    => Reset,
                               Clk      => Clk,
                               PCResult => PCResult );

stimulus: process
  begin
  Reset <= '1';
  wait for 10 ns;
  Address <= x"0000000A";
  wait for 10 ns;
  Reset <= '0';
  wait for 10 ns;
 
  stop_the_clock <= true;
    wait;
end process;

clocking: process
  begin
    while not stop_the_clock loop
      Clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
end process;

end Behavioral;
