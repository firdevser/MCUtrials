----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.06.2021 13:33:44
-- Design Name: 
-- Module Name: DataMemory - Behavioral
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

entity DataMemory is
  Port ( Address, WriteData: in std_logic_vector(31 downto 0);
         Clk, MemWrite, MemRead: in std_logic;
         ReadData: out std_logic_vector(31 downto 0)
  );
end DataMemory;

architecture Behavioral of DataMemory is
    type RAM_1024x32 is array (0 to 1024) of std_logic_vector(31 downto 0);
    signal DM: RAM_1024x32;

begin
process(MemWrite, MemRead, Clk)
  begin
   if rising_edge(Clk) then
    if (MemWrite = '1') then
      DM((TO_INTEGER(unsigned(Address)))) <= WriteData;
    end if;
   end if;
    if (MemRead = '1') then
      ReadData <= DM((TO_INTEGER(unsigned(Address))));
    end if;
end process;
end Behavioral;
