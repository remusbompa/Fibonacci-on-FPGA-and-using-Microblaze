----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.10.2018 16:09:54
-- Design Name: 
-- Module Name: zcb - Behavioral
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

entity zcb is
Port ( 
    x: in std_logic_vector(3 downto 0);
    seg: out std_logic_vector(6 downto 0)
);
end zcb;

architecture Behavioral of zcb is

begin
    
    seg(0) <= (x(2) and not(x(1)) and not(x(0))) or ( not(x(3)) and not(x(2)) and not(x(1)) and x(0));
    seg(1) <= (x(2) and not(x(1)) and x(0)) or (x(2) and x(1) and not(x(0)));
    seg(2) <= (not(x(2)) and x(1) and not(x(0)));
    seg(3) <= (x(2) and not(x(1)) and not(x(0))) or (x(2) and x(1) and x(0)) or (not(x(3)) and not(x(2)) and not(x(1)) and x(0));
    seg(4) <= x(0) or (x(2) and not(x(1)));
    seg(5) <= (not(x(3)) and not(x(2)) and x(0))  or (x(1) and x(0)) or (not(x(3)) and not(x(2)) and x(1));
    seg(6) <= (not(x(3)) and not(x(2)) and not(x(1))) or (x(2) and x(1) and x(0));
end Behavioral;
