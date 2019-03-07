library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity my_alu is
    Port ( clk : in STD_LOGIC;
           Opcode : in STD_LOGIC_VECTOR (3 downto 0);
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           aluOUT : out STD_LOGIC_VECTOR (3 downto 0));
end my_alu;

architecture arch_my_alu of my_alu is
    signal AU, BU, aluOUTu : unsigned(3 downto 0);
begin

process (clk) begin
    if rising_edge(clk) then

   AU <= unsigned(A);
   BU <= unsigned(B);
    
   case (Opcode) is
      when "0000" =>
         aluOUTu <= AU + BU;
      when "0001" =>
         aluOUTu <= AU - BU;
      when "0010" =>
         aluOUTu <= AU + 1;
      when "0011" =>
         aluOUTu <= AU - 1;
      when "0100" =>
         aluOUTu <= 0 - AU;
      when "0101" =>
         if AU > BU then
         aluOUTu <= to_unsigned(1,4);
         else
         aluOUTu <= to_unsigned(0,4);
         end if;
      when "0110" =>
         aluOUTu <= AU sll 1;
      when "0111" =>
         aluOUTu <= AU srl 1;
      when "1000" =>
         aluOUTu <= AU(3) & AU(3) & AU(2) & AU(1);
      when "1001" =>
         aluOUTu <= not AU;
      when "1010" =>
         aluOUTu <= AU and BU;
      when "1011" =>
         aluOUTu <= AU or BU;
      when "1100" =>
         aluOUTu <= AU xor BU;
      when "1101" =>
        aluOUTu <= AU xnor BU;
      when "1110" =>
         aluOUTu <= AU nand BU;
      when "1111" =>
         aluOUTu <= AU nor BU;
      when others =>
         aluOUTu <= "0000";
   end case;
   
   aluOUT <= std_logic_vector(aluOUTu);
   
   end if;
end process;

end arch_my_alu;