----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2018 18:15:13
-- Design Name: 
-- Module Name: calculFibo - Behavioral
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

entity calculFibo is
Port ( 
    n: in integer;
    fibo: out integer;
    overflow: out std_logic
    
);
end calculFibo;

architecture Behavioral of calculFibo is

signal f: integer;

begin

f <= 0 when n = 0 else
    1 when n = 1 else
    1 when n = 2 else
    2 when n = 3 else
    
    3 when n = 4 else
    5 when n = 5 else
    8 when n = 6 else
    13 when n = 7 else
    21 when n = 8 else
    34 when n = 9 else
    55 when n = 10 else
    89 when n = 11 else
    144 when n = 12 else
    233 when n = 13 else
    377 when n = 14 else
    610 when n = 15 else
    987 when n = 16 else
    
    1597 when n = 17 else
    2584 when n = 18 else
    4181 when n = 19 else
    6765 when n = 20 else
    9999;   
    
overflow <= '1' when f = 9999 else
            '0';
            
 fibo <= f;
 
end Behavioral;
