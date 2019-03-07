library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C0 : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C4 : out STD_LOGIC);
end ripple_adder;

architecture my_ripple_adder of ripple_adder is
    component adder
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               Cin : in STD_LOGIC;
               S : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;

    signal C1, C2, C3: std_logic;

begin
FA0: adder port map (A => A(0),
                     B => B(0),
                     Cin => C0,
                     S => S(0),
                     Cout => C1);
                   
FA1: adder port map (A => A(1),
                     B => B(1),
                     Cin => C1,
                     S => S(1),
                     Cout => C2);
                     
FA2: adder port map (A => A(2),
                     B => B(2),
                     Cin => C2,
                     S => S(2),
                     Cout => C3);
                     
FA3: adder port map (A => A(3),
                     B => B(3),
                     Cin => C3,
                     S => S(3),
                     Cout => C4);
end my_ripple_adder;