----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2018 19:09:15
-- Design Name: 
-- Module Name: convert_binary_to_digit - Behavioral
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

entity convert_binary_to_digit is
Port ( 
    binary: in std_logic_vector(3 downto 0);
    digit: out integer
);
end convert_binary_to_digit;

architecture Behavioral of convert_binary_to_digit is

begin

digit <= 0 when binary = "0000" else
        1 when binary = "0001" else
        2 when binary = "0010" else
        3 when binary = "0011" else
        4 when binary = "0100" else
        5 when binary = "0101" else
        6 when binary = "0110" else
        7 when binary = "0111" else
        8 when binary = "1000" else
        9 when binary = "1001" ;

end Behavioral;
