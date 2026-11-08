library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity lfsr_timer is
    generic (
        G_WIDTH : positive := 22
    );
    port (
        i_Clk       : in  std_logic;
        o_LFSR_Data : out std_logic_vector(G_WIDTH-1 downto 0);
        o_LFSR_Done : out std_logic
    );
end entity lfsr_timer;
 
architecture RTL of lfsr_timer is
    constant C_ZERO : std_logic_vector(G_WIDTH-1 downto 0) := (others => '0');
    signal r_LFSR : std_logic_vector(G_WIDTH-1 downto 0) := (others => '0');
    signal w_XNOR : std_logic;
begin
    -- XNOR feedback from the two most significant bits
    w_XNOR <= r_LFSR(G_WIDTH-1) xnor r_LFSR(G_WIDTH-2);
 
    process (i_Clk)
    begin
        if rising_edge(i_Clk) then
            r_LFSR <= r_LFSR(G_WIDTH-2 downto 0) & w_XNOR;
        end if;
    end process;
 
    o_LFSR_Data <= r_LFSR;
 
    -- Done pulse (one clock wide) when the LFSR is all zeros
    o_LFSR_Done <= '1' when r_LFSR = C_ZERO else '0';
end architecture RTL;