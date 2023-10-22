----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.05.2021 03:08:54
-- Design Name: 
-- Module Name: register_file - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file is

  Port (ReadRegister1, ReadRegister2, WriteRegister: in std_logic_vector(4 downto 0);
        WriteData: in std_logic_vector(31 downto 0);
        RegWrite: in std_logic;
        ReadData1, ReadData2: out std_logic_vector(31 downto 0);
        clk: in std_logic
   );
end register_file;

architecture Behavioral of register_file is
    type reg_array is array (0 to 31) of std_logic_vector(31 downto 0);
    signal reg_file: reg_array;

begin
 process(RegWrite,clk)
    begin 
        if rising_edge(clk) then  
          if RegWrite = '1' then
            reg_file(to_integer(unsigned(WriteRegister))) <= WriteData;
          end if;
        elsif falling_edge(clk) then 
         ReadData1 <= reg_file(to_integer(unsigned(ReadRegister1)));
         ReadData2 <= reg_file(to_integer(unsigned(ReadRegister2)));
        end if;
    end process;
end Behavioral;
