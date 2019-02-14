----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2018 19:22:14
-- Design Name: 
-- Module Name: topFibo - Behavioral
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

entity topFibo is
Port ( 
    input: in std_logic_vector(7 downto 0);
    CLK100MHZ: in std_logic;
    AN: out std_logic_vector(7 downto 0);
    seg: out std_logic_vector(6 downto 0); 
    overflow: out  std_logic
);
end topFibo;

architecture Behavioral of topFibo is

component convert_binary_to_digit is
Port ( 
    binary: in std_logic_vector(3 downto 0);
    digit: out integer
);
end component;

component convert_digit_to_binary is
Port ( 
    digit: in integer;
    binary: out std_logic_vector(3 downto 0)
);

end component;

component calculFibo is
Port ( 
    n: in integer;
    fibo: out integer;
    overflow: out std_logic
);
end component;

component zcb is
Port ( 
    x: in std_logic_vector(3 downto 0);
    seg: out std_logic_vector(6 downto 0)
);
end component;

signal digit0, digit1, n, fibo, f0, f1, f2, f3 : integer;
signal fibo1, fibo2, fibo3 : integer;
signal binary0, binary1, bin0, bin1, bin2, bin3 : std_logic_vector(3 downto 0);

signal AN0, AN1, AN2, AN3 : std_logic_vector(7 downto 0);
signal seg0, seg1, seg2, seg3 : std_logic_vector(6 downto 0);

signal activAn : std_logic_vector(1 downto 0);
signal counter: unsigned(15 downto 0) := (others => '0');
signal cnt_temp: std_logic_vector(15 downto 0);


begin

process(CLK100MHZ) 
begin
    if rising_edge(CLK100MHZ) then
        counter <= counter + 1;
    end if;
    cnt_temp <= std_logic_vector(counter);
    activAn <= cnt_temp(15 downto 14);
end process;

binary0 <= input(3 downto 0);
binary1 <= input(7 downto 4);

findDigit0: convert_binary_to_digit port map (binary => binary0, digit => digit0);
findDigit1: convert_binary_to_digit port map (binary => binary1, digit => digit1);

n <= digit1 * 10 + digit0;

calcul: calculFibo port map (n => n, fibo => fibo, overflow => overflow);

f0 <= fibo mod 10;
fibo1 <= fibo / 10;
f1 <= fibo1 mod 10;
fibo2 <= fibo1 / 10;
f2 <= fibo2 mod 10;
fibo3 <= fibo2 / 10;
f3 <= fibo3 mod 10;

findBinary0: convert_digit_to_binary port map (digit => f0, binary => bin0);
findBinary1: convert_digit_to_binary port map (digit => f1, binary => bin1);
findBinary2: convert_digit_to_binary port map (digit => f2, binary => bin2);
findBinary3: convert_digit_to_binary port map (digit => f3, binary => bin3);

AN0 <= "11111110";
AN1 <= "11111101";
AN2 <= "11111011";
AN3 <= "11110111";

segment0: zcb port map (x => bin0, seg => seg0);
segment1: zcb port map (x => bin1, seg => seg1);
segment2: zcb port map (x => bin2, seg => seg2);
segment3: zcb port map (x => bin3, seg => seg3);

process(activAn, seg0, seg1, seg2, seg3)
begin
    case activAn is
    when "00" => 
        AN <= AN0;
        seg <= seg0;
    when "01" => 
        AN <= AN1;
        seg <= seg1;
    when "10" => 
        AN <= AN2;
        seg <= seg2;
    when "11" => 
        AN <= AN3;
        seg <= seg3;
    when others =>
        AN <= (others => 'X');
        seg <= (others => 'X');
    end case;
end process;

end Behavioral;
