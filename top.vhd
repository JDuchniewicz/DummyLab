library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    port(CLOCK_50 : in STD_LOGIC;
         rst      : in STD_LOGIC;
         PIO      : out STD_LOGIC_VECTOR(7 downto 0));
end top;

architecture structural of top is
    component Computer is
        port(clk   : in STD_LOGIC;
             reset : in STD_LOGIC;
             PIO   : out STD_LOGIC_VECTOR(7 downto 0));
    end component;

    --component clk_divider is
    --    generic (IN_FREQ : INTEGER := 50_000_000;
    --             OUT_FREQ : INTEGER := 100);
    --    port (clk     : in STD_ULOGIC;
    --          rst     : in STD_LOGIC;
    --          out_clk : out STD_ULOGIC);
    --end component;

    signal s_out_clk : STD_LOGIC;
begin
    Comp : Computer port map(clk => CLOCK_50,
                             reset => not rst,
                             PIO => PIO);

    --clk_div : clk_divider generic map(OUT_FREQ => 100)
    --                      port map(clk => CLOCK_50,
    --                               rst => not rst,
    --                               out_clk => s_out_clk);

end structural;
