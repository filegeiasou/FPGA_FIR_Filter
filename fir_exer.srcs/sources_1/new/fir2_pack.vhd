----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/10/2025 08:44:39 PM
-- Design Name: 
-- Module Name: fir2_pack - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package fir2_pack is

    constant N_TAPS : integer := 64;
    subtype coeff_t is signed(15 downto 0);  -- Q15 format

    type rom_array_t is array (0 to N_TAPS-1) of coeff_t;

    constant ROM_ARRAY : rom_array_t := (
       to_signed(-10, 16),
        to_signed(-10, 16),
        to_signed(19, 16),
        to_signed(20, 16),
        to_signed(-33, 16),
        to_signed(-34, 16),
        to_signed(52, 16),
        to_signed(53, 16),
        to_signed(-77, 16),
        to_signed(-80, 16),
        to_signed(110, 16),
        to_signed(114, 16),
        to_signed(-152, 16),
        to_signed(-160, 16),
        to_signed(206, 16),
        to_signed(218, 16),
        to_signed(-276, 16),
        to_signed(-294, 16),
        to_signed(365, 16),
        to_signed(393, 16),
        to_signed(-482, 16),
        to_signed(-527, 16),
        to_signed(643, 16),
        to_signed(717, 16),
        to_signed(-878, 16),
        to_signed(-1012, 16),
        to_signed(1267, 16),
        to_signed(1547, 16),
        to_signed(-2066, 16),
        to_signed(-2890, 16),
        to_signed(4909, 16),
        to_signed(14724, 16),
        to_signed(14724, 16),
        to_signed(4909, 16),
        to_signed(-2890, 16),
        to_signed(-2066, 16),
        to_signed(1547, 16),
        to_signed(1267, 16),
        to_signed(-1012, 16),
        to_signed(-878, 16),
        to_signed(717, 16),
        to_signed(643, 16),
        to_signed(-527, 16),
        to_signed(-482, 16),
        to_signed(393, 16),
        to_signed(365, 16),
        to_signed(-294, 16),
        to_signed(-276, 16),
        to_signed(218, 16),
        to_signed(206, 16),
        to_signed(-160, 16),
        to_signed(-152, 16),
        to_signed(114, 16),
        to_signed(110, 16),
        to_signed(-80, 16),
        to_signed(-77, 16),
        to_signed(53, 16),
        to_signed(52, 16),
        to_signed(-34, 16),
        to_signed(-33, 16),
        to_signed(20, 16),
        to_signed(19, 16),
        to_signed(-10, 16),
        to_signed(-10, 16)
    );

end package;
