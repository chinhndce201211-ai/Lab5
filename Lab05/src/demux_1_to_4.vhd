library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity demux_1_to_4 is
    port (
        i_Data  : in  std_logic;
        i_Sel0  : in  std_logic;
        i_Sel1  : in  std_logic;
        o_Data0 : out std_logic;
        o_Data1 : out std_logic;
        o_Data2 : out std_logic;
        o_Data3 : out std_logic
    );
end entity demux_1_to_4;
 
architecture RTL of demux_1_to_4 is
begin
    -- Sel1 Sel0 = 00 -> Data0, 01 -> Data1, 10 -> Data2, 11 -> Data3
    o_Data0 <= i_Data when (i_Sel1 = '0' and i_Sel0 = '0') else '0';
    o_Data1 <= i_Data when (i_Sel1 = '0' and i_Sel0 = '1') else '0';
    o_Data2 <= i_Data when (i_Sel1 = '1' and i_Sel0 = '0') else '0';
    o_Data3 <= i_Data when (i_Sel1 = '1' and i_Sel0 = '1') else '0';
end architecture RTL;   