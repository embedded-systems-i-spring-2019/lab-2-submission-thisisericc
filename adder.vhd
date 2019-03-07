library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end adder;

architecture my_adder of adder is

begin

S <= A xor B xor Cin;
Cout <= ((A xor B) and Cin) or (A and B);

end my_adder;



