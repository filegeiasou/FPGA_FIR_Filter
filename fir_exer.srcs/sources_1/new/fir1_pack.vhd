----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Aggelos Mentzelos
-- 
-- Create Date: 06/10/2025 08:44:39 PM
-- Design Name: 
-- Module Name: fir1_pack - Behavioral
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

package fir1_pack is

    constant N_TAPS : integer := 32;
    subtype coeff_t is signed(15 downto 0);  -- Q15 format

    type rom_array_t is array (0 to N_TAPS-1) of coeff_t;

    constant ROM_ARRAY : rom_array_t := (
       to_signed(-185, 16),
        to_signed(-265, 16),
        to_signed(-327, 16),
        to_signed(-350, 16),
        to_signed(-314, 16),
        to_signed(-199, 16),
        to_signed(5, 16),
        to_signed(302, 16),
        to_signed(686, 16),
        to_signed(1137, 16),
        to_signed(1629, 16),
        to_signed(2126, 16),
        to_signed(2589, 16),
        to_signed(2977, 16),
        to_signed(3258, 16),
        to_signed(3405, 16),
        to_signed(3405, 16),
        to_signed(3258, 16),
        to_signed(2977, 16),
        to_signed(2589, 16),
        to_signed(2126, 16),
        to_signed(1629, 16),
        to_signed(1137, 16),
        to_signed(686, 16),
        to_signed(302, 16),
        to_signed(5, 16),
        to_signed(-199, 16),
        to_signed(-314, 16),
        to_signed(-350, 16),
        to_signed(-327, 16),
        to_signed(-265, 16),
        to_signed(-185, 16)
    );

end package;
