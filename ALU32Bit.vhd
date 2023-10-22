----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.05.2021 16:12:44
-- Design Name: 
-- Module Name: ALU32Bit - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU32Bit is
  Port(
  ALUControl: in std_logic_vector(3 downto 0);
  A: in std_logic_vector(31 downto 0);
  B: in std_logic_vector(31 downto 0);
  ALUResult: inout std_logic_vector(31 downto 0);
  ZERO: out std_logic
   );
end ALU32Bit;

architecture Behavioral of ALU32Bit is
-- signal tmp: std_logic_vector(31 downto 0);

begin
process(ALUControl, A, B)
variable count : unsigned(31 downto 0) := x"00000000";
  begin
    case ALUControl is
    when "0000" => ALUResult <= A + B;
    when "0001" => ALUResult <= A - B;
    when "0010" => ALUResult <= std_logic_vector(to_unsigned((to_integer(unsigned(A)) * to_integer(unsigned(B))),32));
    when "0011" => ALUResult <= A and B;
    when "0100" => ALUResult <= A or B;
    when "0101" => 
    if (A < B) then ALUResult <= x"00000001";
    else ALUResult <= x"00000000";
    end if;
    when "0110" => 
    if (A = B) then ALUResult <= x"00000001";
    else ALUResult <= x"00000000";
    end if;
    when "0111" => 
    if (A = B)then ALUResult <= x"00000000";
    else ALUResult <= x"00000001";
    end if;
    when "1000" =>
    ALUResult <= std_logic_vector(to_unsigned(to_integer(unsigned(A))*(2**(to_integer(unsigned(B)))),32));
    when "1001" =>
    ALUResult <= std_logic_vector(to_unsigned(to_integer(unsigned(A))/(2**(to_integer(unsigned(B)))),32));
    when "1010" =>
    ALUResult <= A(to_integer(unsigned(B))-1 downto 0) & A(31 downto (to_integer(unsigned(B))));
    when "1011" => 
     count := x"00000000";   --initialize count variable.
      for i in A'range loop   --for all the bits.
       count := count + ("0000000000000000000000000000000" & A(i));   --Add the bit to the count.  --Add the bit to the count.
      end loop;
    ALUResult <= std_logic_vector(count); -- the all 1s in the binary number.
    when "1100" => 
     count := x"00000000";
      for i IN A'RANGE LOOP 
        CASE A(i) IS 
          WHEN '0' => count := count + 1; 
          WHEN OTHERS => EXIT; 
        END CASE; 
       END LOOP; 
    ALUResult <= std_logic_vector(count); -- the 0s before first one 
    when others => ALUResult <= x"00000000";
    end case;
  end process;
 
process (ALUResult)
 begin 
 case ALUResult is
    when x"00000000" =>
        ZERO <= '1';
    when others => -- ALUResult = X"00000000" then
        ZERO <= '0';
 end case;
end process;

end Behavioral;
