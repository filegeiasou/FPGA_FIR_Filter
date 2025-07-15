library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
--use work.fir1_pack.all;
--use work.fir2_pack.all;
use work.fir3_pack.all;

entity fir_filter_tb is
end fir_filter_tb;

architecture behavior of fir_filter_tb is

    -- Component Declaration
    component fir_filter
        port (
            clk       : in  std_logic;
            reset     : in  std_logic;
            enable    : in  std_logic;
            valid_in  : in  std_logic;
            x_in      : in  std_logic_vector(15 downto 0);
            y_out     : out std_logic_vector(15 downto 0);
            valid_out : out std_logic
        );
    end component;

    -- Signals
    signal clk       : std_logic := '0';
    signal reset     : std_logic := '1';
    signal enable    : std_logic := '0';
    signal valid_in  : std_logic := '0';
    signal x_in      : std_logic_vector(15 downto 0) := (others => '0');
    signal y_out     : std_logic_vector(15 downto 0);
    signal valid_out : std_logic;
    signal stop_sim  : std_logic := '0';  -- Διορθώθηκε από boolean σε std_logic

    -- File I/O
    file input_file  : text open read_mode is "C:\\Users\\fileg\\Downloads\\input_data.txt";
    file output_file : text open write_mode is "C:\\Users\\fileg\\Downloads\\output_data.txt";

    -- Clock generation
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: fir_filter
        port map (
            clk       => clk,
            reset     => reset,
            enable    => enable,
            valid_in  => valid_in,
            x_in      => x_in,
            y_out     => y_out,
            valid_out => valid_out
        );

    -- Clock process
    clk_process : process
    begin
        while stop_sim = '0' loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    stim_proc: process
        variable inline  : line;
        variable data_int : integer;
    begin
    -- Reset
        wait for 20 ns;
        reset <= '0';
        enable <= '1';
    
        -- Read each sample
        while not endfile(input_file) loop
            -- Read next input value
            readline(input_file, inline);
            read(inline, data_int);
            x_in <= std_logic_vector(to_signed(data_int, 16));
            valid_in <= '1';
            wait for clk_period *3 * N_TAPS;        
        end loop;
    
        -- Wait extra
        valid_in <= '0';
        wait for clk_period * N_TAPS; 
        stop_sim <= '1';
        wait;
    end process;

    -- Output logging process
    process(clk)
    variable outline : line;
    begin
        if rising_edge(clk) then
            if valid_out = '1' then
                write(outline, integer'image(to_integer(signed(y_out))));
                writeline(output_file, outline);
            end if;
        end if;
    end process;

end behavior;
