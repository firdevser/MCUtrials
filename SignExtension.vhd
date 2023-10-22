----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.05.2021 15:42:12
-- Design Name: 
-- Module Name: SignExtension - Behavioral
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

entity SignExtension is
  Port (Ain: in std_ulogic_vector(15 downto 0);
        Bout: out std_ulogic_vector(31 downto 0)
   );
end SignExtension;

architecture Behavioral of SignExtension is

begin

Bout <= x"0000" & Ain when Ain(15) = '0' else x"ffff" & Ain;

end Behavioral;
-- process(Ain)
--  begin
--  if Ain(15) = '0' then
--     Bout <= x"0000" & Ain;
--  elsif Ain(15) = '1' then
--     Bout <= x"ffff" & Ain;
--  end if;
-- end process;

--process(Ain)
--  begin
--    case Ain(15) is
--    when "0" => Bout <= x"0000" & Ain;

-- process(Ain)
--  begin
--  if Ain(15) = '0' then
--     Bout(31 downto 16) <= x"0000";
--     Bout(15 downto 0) <= Ain;
--  elsif Ain(15) = '1' then
--     Bout(31 downto 16) <= x"ffff";
--     Bout(15 downto 0) <= Ain;
--  end if;
-- end process;

