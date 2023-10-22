----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2021 00:36:54
-- Design Name: 
-- Module Name: register_file_tb - Behavioral
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

entity register_file_tb is
--  Port ( );
end register_file_tb;

architecture Behavioral of register_file_tb is
 component register_file
    Port (ReadRegister1, ReadRegister2, WriteRegister: in std_logic_vector(4 downto 0);
          WriteData: in std_logic_vector(31 downto 0);
          RegWrite, clk: in std_logic;
          ReadData1, ReadData2: out std_logic_vector(31 downto 0)
     );
 end component;
 
  signal ReadRegister1, ReadRegister2, WriteRegister: std_logic_vector(4 downto 0):= "00000";
  signal WriteData: std_logic_vector(31 downto 0):= (others => '0');
  signal RegWrite: std_logic:= '1';
  signal ReadData1, ReadData2: std_logic_vector(31 downto 0);
  signal clk: std_logic:= '0' ;
  constant clk_period : time := 2 ns;

begin
  uut: register_file port map ( ReadRegister1 => ReadRegister1,
                                ReadRegister2 => ReadRegister2,
                                WriteRegister => WriteRegister,
                                WriteData     => WriteData,
                                RegWrite      => RegWrite,
                                ReadData1     => ReadData1,
                                ReadData2     => ReadData2,
                                clk           => clk );

  stimulus: process
  begin
    wait for 1 ns;
    ReadRegister1 <= "00111";
    WriteData <= x"abcdef98";
    wait for 2 ns;
    WriteRegister <= "01000";
    WriteData <= x"0ece274a";
    wait for 2 ns;
    WriteRegister <= "10101";
    WriteData <= x"00000014";
    wait for 2 ns;
    WriteRegister <= "11111";
    WriteData <= x"000003e8";
    wait for 2 ns;
    RegWrite <= '0';
    ReadRegister1 <= "00000";
    ReadRegister2 <= "01000";
    wait for 2 ns;
    ReadRegister1 <= "10101";
    ReadRegister2 <= "11111";
   wait;
  end process;
  
  clocking: process
  begin
        clk <= '0';
        wait for clk_period/2;  --for 1 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 1 ns signal is '1'.
  end process;
end Behavioral;
