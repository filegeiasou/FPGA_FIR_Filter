----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2025 05:34:51 PM
-- Design Name: 
-- Module Name: fir_filter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- chose filter
--use work.fir1_pack.all;
--use work.fir2_pack.all;
use work.fir3_pack.all;


entity fir_filter is
    port (
        clk       : in  std_logic;
        reset     : in  std_logic;
        enable    : in  std_logic;
        valid_in  : in  std_logic;
        x_in      : in  std_logic_vector(15 downto 0); -- Q15 input
        y_out     : out std_logic_vector(15 downto 0); -- Q15 output
        valid_out : out std_logic
    );
end fir_filter;

architecture rtl of fir_filter is

    constant N : integer := N_TAPS;
    type state_t is (IDLE, MULT, COPY, SUM, Y_OUT1); 
    type data_array_t is array (0 to N-1) of signed(15 downto 0);
    type y_array_t is array (0 to N-1) of signed(31 downto 0);

    signal x_reg      : data_array_t := (others => (others => '0'));
    signal y_acc      : signed(31 downto 0) := (others => '0');
    signal valid_out_reg : std_logic := '0';
    signal y_pipe : y_array_t := (others => (others => '0'));
    signal y_pipe1     : y_array_t := (others => (others => '0'));
    signal valid_pipe : std_logic_vector(0 to N) := (others => '0');
    signal state : state_t := IDLE;
    signal i     : integer range 0 to N := 0;
    signal acc   : signed(31 downto 0) := (others => '0');

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                state <= IDLE;
                valid_out_reg <= '0';
                i <= 0;
                acc <= (others => '0');
            else
                case state is
                    when IDLE =>
                        --valid_out_reg <= '0';
                        if enable = '1' and valid_in = '1' then
                            -- shift input
                            valid_out_reg <= '0';
                            for k in N-1 downto 1 loop
                                x_reg(k) <= x_reg(k-1);
                            end loop;
                            x_reg(0) <= signed(x_in);
    
                            i <= 0;
                            acc <= (others => '0');
                            valid_pipe <= valid_pipe(0 to N-1) & valid_in;
                            state <= MULT;
                        end if;
    
                    when MULT =>
                        y_pipe1(i) <= resize((resize(ROM_ARRAY(i), 32) * resize(x_reg(i), 32)), 32);
                        if i = N-1 then
                            i <= 0;
                            state <= COPY;
                        else
                            i <= i + 1;
                            state <= MULT;  -- stays in MULT
                        end if;
    
                    when COPY =>
                        y_pipe(i) <= y_pipe1(i);
                        if i = N-1 then
                            i <= 0;
                            acc <= (others => '0');
                            state <= SUM;
                        else
                            i <= i + 1;
                            state <= COPY;  -- stays in COPY
                        end if;
    
                    when SUM =>
                        acc <= acc + y_pipe(i);
                        if i = N-1 then
                            y_acc <= acc + y_pipe(i); -- last sum
                            state <= Y_OUT1;
                        else
                            i <= i + 1;
                        end if;
    
                    when Y_OUT1 =>
                        valid_out_reg <= '1';
                        state <= IDLE;
                end case;
            end if;
        end if;
    end process;

    -- Output assignments
    y_out <= std_logic_vector(y_acc(30 downto 15));
    valid_out <= valid_pipe(N);

end rtl;


