library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_tester is
    Port ( clk: in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           btn : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0));
end alu_tester;

architecture arch_alu_tester of alu_tester is

signal Avec, Bvec, OPvec, DBNCvec, aluOUTvec: STD_LOGIC_VECTOR(3 downto 0) := "0000";

component my_alu
    Port ( clk : in STD_LOGIC;
           Opcode : in STD_LOGIC_VECTOR (3 downto 0);
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           aluOUT : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component debounce
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           dbnc : out STD_LOGIC);
end component;

begin

process (clk) begin
    if rising_edge(clk) then

if DBNCvec(0) = '1' then
    Bvec <= sw;
end if;

if DBNCvec(1) = '1' then
    Avec <= sw;
end if;

if DBNCvec(2) = '1' then
    OPvec <= sw;
end if;

if DBNCvec(3) = '1' then
    Bvec <= "0000";
    Avec <= "0000";
    OPvec <= "0000";
end if;

led <= aluOUTvec;


end if;
end process;


Deb0: debounce port map (clk => clk,
                         btn => btn(0),
                         dbnc => DBNCvec(0));

Deb1: debounce port map (clk => clk,
                         btn => btn(1),
                         dbnc => DBNCvec(1));
                         
Deb2: debounce port map (clk => clk,
                         btn => btn(2),
                         dbnc => DBNCvec(2));
                         
Deb3: debounce port map (clk => clk,
                         btn => btn(3),
                         dbnc => DBNCvec(3));

ALU: my_alu port map (clk => clk,
                      A => Avec,
                      B => Bvec,
                      Opcode => OPvec,
                      aluOUT => aluOUTvec);
                      
end arch_alu_tester;
