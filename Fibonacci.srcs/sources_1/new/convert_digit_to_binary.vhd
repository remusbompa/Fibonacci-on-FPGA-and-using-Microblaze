----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2018 19:09:37
-- Design Name: 
-- Module Name: convert_digit_to_binary - Behavioral
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

entity convert_digit_to_binary is
Port ( 
    digit: in integer;
    binary: out std_logic_vector(3 downto 0)
);

end convert_digit_to_binary;

architecture Behavioral of convert_digit_to_binary is

begin

binary <= "0000" when digit = 0 else
        "0001" when digit = 1 else     
        "0010" when digit = 2 else
        "0011" when digit = 3 else
        "0100" when digit = 4 else
        "0101" when digit = 5 else
        "0110" when digit = 6 else
        "0111" when digit = 7 else
        "1000" when digit = 8 else
        "1001" when digit = 9;

end Behavioral;
