library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ripple_adder_tb is
end ripple_adder_tb;

architecture tb of ripple_adder_tb is

signal tb_A, tb_B, tb_S: std_logic_vector(3 downto 0);
signal tb_C0, tb_C4: std_logic;

component ripple_adder
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C0 : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C4 : out STD_LOGIC);
end component;

begin

dut: ripple_adder port map (A => tb_A,
                            B => tb_B,
                            S => tb_S,
                            C0 => tb_C0,
                            C4 => tb_C4);

    Asig: process begin
        tb_A <= "0100";
        wait for 5 us;
        tb_A <= "1001";
        wait for 5 us;
    end process;
    
    Bsig: process begin
        tb_B <= "0110";
        wait for 5 us;
        tb_B <= "0011";
        wait for 5 us;
    end process;
    
    C0sig: process begin
        tb_C0 <= '0';
        wait for 5 us;
        tb_C0 <= '1';
        wait for 5 us;
    end process;

end tb;
