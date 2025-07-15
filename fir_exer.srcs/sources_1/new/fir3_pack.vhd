----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Aggelos Mentzelos
-- 
-- Create Date: 06/10/2025 08:44:39 PM
-- Design Name: 
-- Module Name: fir3_pack - Behavioral
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

package fir3_pack is

    constant N_TAPS : integer := 128;
    subtype coeff_t is signed(15 downto 0);  -- Q15 format

    type rom_array_t is array (0 to N_TAPS-1) of coeff_t;

    constant ROM_ARRAY : rom_array_t := (
       to_signed(0, 16),
        to_signed(0, 16),
        to_signed(0, 16),
        to_signed(0, 16),
        to_signed(0, 16),
        to_signed(1, 16),
        to_signed(1, 16),
        to_signed(0, 16),
        to_signed(-1, 16),
        to_signed(-2, 16),
        to_signed(-2, 16),
        to_signed(-1, 16),
        to_signed(2, 16),
        to_signed(5, 16),
        to_signed(6, 16),
        to_signed(2, 16),
        to_signed(-4, 16),
        to_signed(-11, 16),
        to_signed(-12, 16),
        to_signed(-5, 16),
        to_signed(8, 16),
        to_signed(21, 16),
        to_signed(23, 16),
        to_signed(10, 16),
        to_signed(-15, 16),
        to_signed(-37, 16),
        to_signed(-41, 16),
        to_signed(-17, 16),
        to_signed(25, 16),
        to_signed(63, 16),
        to_signed(68, 16),
        to_signed(29, 16),
        to_signed(-40, 16),
        to_signed(-101, 16),
        to_signed(-109, 16),
        to_signed(-47, 16),
        to_signed(62, 16),
        to_signed(156, 16),
        to_signed(168, 16),
        to_signed(72, 16),
        to_signed(-93, 16),
        to_signed(-234, 16),
        to_signed(-253, 16),
        to_signed(-110, 16),
        to_signed(137, 16),
        to_signed(348, 16),
        to_signed(378, 16),
        to_signed(166, 16),
        to_signed(-202, 16),
        to_signed(-521, 16),
        to_signed(-571, 16),
        to_signed(-256, 16),
        to_signed(306, 16),
        to_signed(809, 16),
        to_signed(907, 16),
        to_signed(421, 16),
        to_signed(-509, 16),
        to_signed(-1415, 16),
        to_signed(-1686, 16),
        to_signed(-855, 16),
        to_signed(1135, 16),
        to_signed(3831, 16),
        to_signed(6403, 16),
        to_signed(7969, 16),
        to_signed(7969, 16),
        to_signed(6403, 16),
        to_signed(3831, 16),
        to_signed(1135, 16),
        to_signed(-855, 16),
        to_signed(-1686, 16),
        to_signed(-1415, 16),
        to_signed(-509, 16),
        to_signed(421, 16),
        to_signed(907, 16),
        to_signed(809, 16),
        to_signed(306, 16),
        to_signed(-256, 16),
        to_signed(-571, 16),
        to_signed(-521, 16),
        to_signed(-202, 16),
        to_signed(166, 16),
        to_signed(378, 16),
        to_signed(348, 16),
        to_signed(137, 16),
        to_signed(-110, 16),
        to_signed(-253, 16),
        to_signed(-234, 16),
        to_signed(-93, 16),
        to_signed(72, 16),
        to_signed(168, 16),
        to_signed(156, 16),
        to_signed(62, 16),
        to_signed(-47, 16),
        to_signed(-109, 16),
        to_signed(-101, 16),
        to_signed(-40, 16),
        to_signed(29, 16),
        to_signed(68, 16),
        to_signed(63, 16),
        to_signed(25, 16),
        to_signed(-17, 16),
        to_signed(-41, 16),
        to_signed(-37, 16),
        to_signed(-15, 16),
        to_signed(10, 16),
        to_signed(23, 16),
        to_signed(21, 16),
        to_signed(8, 16),
        to_signed(-5, 16),
        to_signed(-12, 16),
        to_signed(-11, 16),
        to_signed(-4, 16),
        to_signed(2, 16),
        to_signed(6, 16),
        to_signed(5, 16),
        to_signed(2, 16),
        to_signed(-1, 16),
        to_signed(-2, 16),
        to_signed(-2, 16),
        to_signed(-1, 16),
        to_signed(0, 16),
        to_signed(1, 16),
        to_signed(1, 16),
        to_signed(0, 16),
        to_signed(0, 16),
        to_signed(0, 16),
        to_signed(0, 16),
        to_signed(0, 16)
    );

end package;
