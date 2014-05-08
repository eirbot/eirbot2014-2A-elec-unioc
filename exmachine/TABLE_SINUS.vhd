--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: TABLE_COSINUS
-- But: Infere une ROM avec SINUS
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TABLE_SINUS is Port ( 
	H       : in  STD_LOGIC;
	ANGLE   : in  STD_LOGIC_VECTOR(15 downto 0);
	SINUS   : out STD_LOGIC_VECTOR(15 downto 0);
	COSINUS : out STD_LOGIC_VECTOR(15 downto 0)
);
end TABLE_SINUS;

architecture Behavioral of TABLE_SINUS is
TYPE tableSinus is array(0 to ((360+90)*8-1)) of STD_LOGIC_VECTOR(11 downto 0);
SIGNAL TABLE : tableSinus := (
X"000", X"002", X"004", X"007", X"009", X"00B", X"00D", X"010", X"012", X"014", 
X"016", X"019", X"01B", X"01D", X"01F", X"022", X"024", X"026", X"028", X"02A", 
X"02D", X"02F", X"031", X"033", X"036", X"038", X"03A", X"03C", X"03F", X"041", 
X"043", X"045", X"047", X"04A", X"04C", X"04E", X"050", X"053", X"055", X"057", 
X"059", X"05B", X"05E", X"060", X"062", X"064", X"067", X"069", X"06B", X"06D", 
X"06F", X"072", X"074", X"076", X"078", X"07B", X"07D", X"07F", X"081", X"083", 
X"086", X"088", X"08A", X"08C", X"08F", X"091", X"093", X"095", X"097", X"09A", 
X"09C", X"09E", X"0A0", X"0A2", X"0A5", X"0A7", X"0A9", X"0AB", X"0AD", X"0B0", 
X"0B2", X"0B4", X"0B6", X"0B8", X"0BB", X"0BD", X"0BF", X"0C1", X"0C3", X"0C6", 
X"0C8", X"0CA", X"0CC", X"0CE", X"0D1", X"0D3", X"0D5", X"0D7", X"0D9", X"0DB", 
X"0DE", X"0E0", X"0E2", X"0E4", X"0E6", X"0E9", X"0EB", X"0ED", X"0EF", X"0F1", 
X"0F3", X"0F6", X"0F8", X"0FA", X"0FC", X"0FE", X"100", X"103", X"105", X"107", 
X"109", X"10B", X"10D", X"10F", X"112", X"114", X"116", X"118", X"11A", X"11C", 
X"11F", X"121", X"123", X"125", X"127", X"129", X"12B", X"12E", X"130", X"132", 
X"134", X"136", X"138", X"13A", X"13C", X"13F", X"141", X"143", X"145", X"147", 
X"149", X"14B", X"14D", X"14F", X"152", X"154", X"156", X"158", X"15A", X"15C", 
X"15E", X"160", X"162", X"165", X"167", X"169", X"16B", X"16D", X"16F", X"171", 
X"173", X"175", X"177", X"179", X"17B", X"17E", X"180", X"182", X"184", X"186", 
X"188", X"18A", X"18C", X"18E", X"190", X"192", X"194", X"196", X"198", X"19A", 
X"19C", X"19E", X"1A0", X"1A3", X"1A5", X"1A7", X"1A9", X"1AB", X"1AD", X"1AF", 
X"1B1", X"1B3", X"1B5", X"1B7", X"1B9", X"1BB", X"1BD", X"1BF", X"1C1", X"1C3", 
X"1C5", X"1C7", X"1C9", X"1CB", X"1CD", X"1CF", X"1D1", X"1D3", X"1D5", X"1D7", 
X"1D9", X"1DB", X"1DD", X"1DF", X"1E1", X"1E3", X"1E5", X"1E7", X"1E9", X"1EB", 
X"1ED", X"1EE", X"1F0", X"1F2", X"1F4", X"1F6", X"1F8", X"1FA", X"1FC", X"1FE", 
X"200", X"202", X"204", X"206", X"208", X"20A", X"20C", X"20D", X"20F", X"211", 
X"213", X"215", X"217", X"219", X"21B", X"21D", X"21F", X"221", X"222", X"224", 
X"226", X"228", X"22A", X"22C", X"22E", X"230", X"231", X"233", X"235", X"237", 
X"239", X"23B", X"23D", X"23E", X"240", X"242", X"244", X"246", X"248", X"24A", 
X"24B", X"24D", X"24F", X"251", X"253", X"254", X"256", X"258", X"25A", X"25C", 
X"25E", X"25F", X"261", X"263", X"265", X"266", X"268", X"26A", X"26C", X"26E", 
X"26F", X"271", X"273", X"275", X"276", X"278", X"27A", X"27C", X"27D", X"27F", 
X"281", X"283", X"284", X"286", X"288", X"28A", X"28B", X"28D", X"28F", X"291", 
X"292", X"294", X"296", X"297", X"299", X"29B", X"29C", X"29E", X"2A0", X"2A1", 
X"2A3", X"2A5", X"2A7", X"2A8", X"2AA", X"2AC", X"2AD", X"2AF", X"2B1", X"2B2", 
X"2B4", X"2B5", X"2B7", X"2B9", X"2BA", X"2BC", X"2BE", X"2BF", X"2C1", X"2C2", 
X"2C4", X"2C6", X"2C7", X"2C9", X"2CB", X"2CC", X"2CE", X"2CF", X"2D1", X"2D2", 
X"2D4", X"2D6", X"2D7", X"2D9", X"2DA", X"2DC", X"2DD", X"2DF", X"2E1", X"2E2", 
X"2E4", X"2E5", X"2E7", X"2E8", X"2EA", X"2EB", X"2ED", X"2EE", X"2F0", X"2F1", 
X"2F3", X"2F4", X"2F6", X"2F7", X"2F9", X"2FA", X"2FC", X"2FD", X"2FF", X"300", 
X"302", X"303", X"305", X"306", X"308", X"309", X"30B", X"30C", X"30E", X"30F", 
X"310", X"312", X"313", X"315", X"316", X"318", X"319", X"31A", X"31C", X"31D", 
X"31F", X"320", X"321", X"323", X"324", X"326", X"327", X"328", X"32A", X"32B", 
X"32C", X"32E", X"32F", X"330", X"332", X"333", X"334", X"336", X"337", X"338", 
X"33A", X"33B", X"33C", X"33E", X"33F", X"340", X"342", X"343", X"344", X"346", 
X"347", X"348", X"349", X"34B", X"34C", X"34D", X"34E", X"350", X"351", X"352", 
X"353", X"355", X"356", X"357", X"358", X"35A", X"35B", X"35C", X"35D", X"35E", 
X"360", X"361", X"362", X"363", X"364", X"366", X"367", X"368", X"369", X"36A", 
X"36B", X"36D", X"36E", X"36F", X"370", X"371", X"372", X"373", X"375", X"376", 
X"377", X"378", X"379", X"37A", X"37B", X"37C", X"37D", X"37F", X"380", X"381", 
X"382", X"383", X"384", X"385", X"386", X"387", X"388", X"389", X"38A", X"38B", 
X"38C", X"38D", X"38E", X"38F", X"390", X"391", X"392", X"393", X"394", X"395", 
X"396", X"397", X"398", X"399", X"39A", X"39B", X"39C", X"39D", X"39E", X"39F", 
X"3A0", X"3A1", X"3A2", X"3A3", X"3A4", X"3A5", X"3A6", X"3A7", X"3A7", X"3A8", 
X"3A9", X"3AA", X"3AB", X"3AC", X"3AD", X"3AE", X"3AF", X"3AF", X"3B0", X"3B1", 
X"3B2", X"3B3", X"3B4", X"3B5", X"3B5", X"3B6", X"3B7", X"3B8", X"3B9", X"3BA", 
X"3BA", X"3BB", X"3BC", X"3BD", X"3BE", X"3BE", X"3BF", X"3C0", X"3C1", X"3C1", 
X"3C2", X"3C3", X"3C4", X"3C5", X"3C5", X"3C6", X"3C7", X"3C7", X"3C8", X"3C9", 
X"3CA", X"3CA", X"3CB", X"3CC", X"3CC", X"3CD", X"3CE", X"3CF", X"3CF", X"3D0", 
X"3D1", X"3D1", X"3D2", X"3D3", X"3D3", X"3D4", X"3D5", X"3D5", X"3D6", X"3D6", 
X"3D7", X"3D8", X"3D8", X"3D9", X"3DA", X"3DA", X"3DB", X"3DB", X"3DC", X"3DD", 
X"3DD", X"3DE", X"3DE", X"3DF", X"3DF", X"3E0", X"3E0", X"3E1", X"3E2", X"3E2", 
X"3E3", X"3E3", X"3E4", X"3E4", X"3E5", X"3E5", X"3E6", X"3E6", X"3E7", X"3E7", 
X"3E8", X"3E8", X"3E9", X"3E9", X"3EA", X"3EA", X"3EB", X"3EB", X"3EB", X"3EC", 
X"3EC", X"3ED", X"3ED", X"3EE", X"3EE", X"3EE", X"3EF", X"3EF", X"3F0", X"3F0", 
X"3F0", X"3F1", X"3F1", X"3F2", X"3F2", X"3F2", X"3F3", X"3F3", X"3F3", X"3F4", 
X"3F4", X"3F4", X"3F5", X"3F5", X"3F5", X"3F6", X"3F6", X"3F6", X"3F7", X"3F7", 
X"3F7", X"3F8", X"3F8", X"3F8", X"3F8", X"3F9", X"3F9", X"3F9", X"3F9", X"3FA", 
X"3FA", X"3FA", X"3FA", X"3FB", X"3FB", X"3FB", X"3FB", X"3FB", X"3FC", X"3FC", 
X"3FC", X"3FC", X"3FC", X"3FD", X"3FD", X"3FD", X"3FD", X"3FD", X"3FE", X"3FE", 
X"3FE", X"3FE", X"3FE", X"3FE", X"3FE", X"3FE", X"3FF", X"3FF", X"3FF", X"3FF", 
X"3FF", X"3FF", X"3FF", X"3FF", X"3FF", X"3FF", X"400", X"400", X"400", X"400", 
X"400", X"400", X"400", X"400", X"400", X"400", X"400", X"400", X"400", X"400", 
X"400", X"400", X"400", X"400", X"400", X"400", X"400", X"400", X"400", X"400", 
X"400", X"400", X"400", X"400", X"400", X"3FF", X"3FF", X"3FF", X"3FF", X"3FF", 
X"3FF", X"3FF", X"3FF", X"3FF", X"3FF", X"3FE", X"3FE", X"3FE", X"3FE", X"3FE", 
X"3FE", X"3FE", X"3FE", X"3FD", X"3FD", X"3FD", X"3FD", X"3FD", X"3FC", X"3FC", 
X"3FC", X"3FC", X"3FC", X"3FB", X"3FB", X"3FB", X"3FB", X"3FB", X"3FA", X"3FA", 
X"3FA", X"3FA", X"3F9", X"3F9", X"3F9", X"3F9", X"3F8", X"3F8", X"3F8", X"3F8", 
X"3F7", X"3F7", X"3F7", X"3F6", X"3F6", X"3F6", X"3F5", X"3F5", X"3F5", X"3F4", 
X"3F4", X"3F4", X"3F3", X"3F3", X"3F3", X"3F2", X"3F2", X"3F2", X"3F1", X"3F1", 
X"3F0", X"3F0", X"3F0", X"3EF", X"3EF", X"3EE", X"3EE", X"3EE", X"3ED", X"3ED", 
X"3EC", X"3EC", X"3EB", X"3EB", X"3EB", X"3EA", X"3EA", X"3E9", X"3E9", X"3E8", 
X"3E8", X"3E7", X"3E7", X"3E6", X"3E6", X"3E5", X"3E5", X"3E4", X"3E4", X"3E3", 
X"3E3", X"3E2", X"3E2", X"3E1", X"3E0", X"3E0", X"3DF", X"3DF", X"3DE", X"3DE", 
X"3DD", X"3DD", X"3DC", X"3DB", X"3DB", X"3DA", X"3DA", X"3D9", X"3D8", X"3D8", 
X"3D7", X"3D6", X"3D6", X"3D5", X"3D5", X"3D4", X"3D3", X"3D3", X"3D2", X"3D1", 
X"3D1", X"3D0", X"3CF", X"3CF", X"3CE", X"3CD", X"3CC", X"3CC", X"3CB", X"3CA", 
X"3CA", X"3C9", X"3C8", X"3C7", X"3C7", X"3C6", X"3C5", X"3C5", X"3C4", X"3C3", 
X"3C2", X"3C1", X"3C1", X"3C0", X"3BF", X"3BE", X"3BE", X"3BD", X"3BC", X"3BB", 
X"3BA", X"3BA", X"3B9", X"3B8", X"3B7", X"3B6", X"3B5", X"3B5", X"3B4", X"3B3", 
X"3B2", X"3B1", X"3B0", X"3AF", X"3AF", X"3AE", X"3AD", X"3AC", X"3AB", X"3AA", 
X"3A9", X"3A8", X"3A7", X"3A7", X"3A6", X"3A5", X"3A4", X"3A3", X"3A2", X"3A1", 
X"3A0", X"39F", X"39E", X"39D", X"39C", X"39B", X"39A", X"399", X"398", X"397", 
X"396", X"395", X"394", X"393", X"392", X"391", X"390", X"38F", X"38E", X"38D", 
X"38C", X"38B", X"38A", X"389", X"388", X"387", X"386", X"385", X"384", X"383", 
X"382", X"381", X"380", X"37F", X"37D", X"37C", X"37B", X"37A", X"379", X"378", 
X"377", X"376", X"375", X"373", X"372", X"371", X"370", X"36F", X"36E", X"36D", 
X"36B", X"36A", X"369", X"368", X"367", X"366", X"364", X"363", X"362", X"361", 
X"360", X"35E", X"35D", X"35C", X"35B", X"35A", X"358", X"357", X"356", X"355", 
X"353", X"352", X"351", X"350", X"34E", X"34D", X"34C", X"34B", X"349", X"348", 
X"347", X"346", X"344", X"343", X"342", X"340", X"33F", X"33E", X"33C", X"33B", 
X"33A", X"338", X"337", X"336", X"334", X"333", X"332", X"330", X"32F", X"32E", 
X"32C", X"32B", X"32A", X"328", X"327", X"326", X"324", X"323", X"321", X"320", 
X"31F", X"31D", X"31C", X"31A", X"319", X"318", X"316", X"315", X"313", X"312", 
X"310", X"30F", X"30E", X"30C", X"30B", X"309", X"308", X"306", X"305", X"303", 
X"302", X"300", X"2FF", X"2FD", X"2FC", X"2FA", X"2F9", X"2F7", X"2F6", X"2F4", 
X"2F3", X"2F1", X"2F0", X"2EE", X"2ED", X"2EB", X"2EA", X"2E8", X"2E7", X"2E5", 
X"2E4", X"2E2", X"2E1", X"2DF", X"2DD", X"2DC", X"2DA", X"2D9", X"2D7", X"2D6", 
X"2D4", X"2D2", X"2D1", X"2CF", X"2CE", X"2CC", X"2CB", X"2C9", X"2C7", X"2C6", 
X"2C4", X"2C2", X"2C1", X"2BF", X"2BE", X"2BC", X"2BA", X"2B9", X"2B7", X"2B5", 
X"2B4", X"2B2", X"2B1", X"2AF", X"2AD", X"2AC", X"2AA", X"2A8", X"2A7", X"2A5", 
X"2A3", X"2A1", X"2A0", X"29E", X"29C", X"29B", X"299", X"297", X"296", X"294", 
X"292", X"291", X"28F", X"28D", X"28B", X"28A", X"288", X"286", X"284", X"283", 
X"281", X"27F", X"27D", X"27C", X"27A", X"278", X"276", X"275", X"273", X"271", 
X"26F", X"26E", X"26C", X"26A", X"268", X"266", X"265", X"263", X"261", X"25F", 
X"25E", X"25C", X"25A", X"258", X"256", X"254", X"253", X"251", X"24F", X"24D", 
X"24B", X"24A", X"248", X"246", X"244", X"242", X"240", X"23E", X"23D", X"23B", 
X"239", X"237", X"235", X"233", X"231", X"230", X"22E", X"22C", X"22A", X"228", 
X"226", X"224", X"222", X"221", X"21F", X"21D", X"21B", X"219", X"217", X"215", 
X"213", X"211", X"20F", X"20D", X"20C", X"20A", X"208", X"206", X"204", X"202", 
X"200", X"1FE", X"1FC", X"1FA", X"1F8", X"1F6", X"1F4", X"1F2", X"1F0", X"1EE", 
X"1ED", X"1EB", X"1E9", X"1E7", X"1E5", X"1E3", X"1E1", X"1DF", X"1DD", X"1DB", 
X"1D9", X"1D7", X"1D5", X"1D3", X"1D1", X"1CF", X"1CD", X"1CB", X"1C9", X"1C7", 
X"1C5", X"1C3", X"1C1", X"1BF", X"1BD", X"1BB", X"1B9", X"1B7", X"1B5", X"1B3", 
X"1B1", X"1AF", X"1AD", X"1AB", X"1A9", X"1A7", X"1A5", X"1A3", X"1A0", X"19E", 
X"19C", X"19A", X"198", X"196", X"194", X"192", X"190", X"18E", X"18C", X"18A", 
X"188", X"186", X"184", X"182", X"180", X"17E", X"17B", X"179", X"177", X"175", 
X"173", X"171", X"16F", X"16D", X"16B", X"169", X"167", X"165", X"162", X"160", 
X"15E", X"15C", X"15A", X"158", X"156", X"154", X"152", X"14F", X"14D", X"14B", 
X"149", X"147", X"145", X"143", X"141", X"13F", X"13C", X"13A", X"138", X"136", 
X"134", X"132", X"130", X"12E", X"12B", X"129", X"127", X"125", X"123", X"121", 
X"11F", X"11C", X"11A", X"118", X"116", X"114", X"112", X"10F", X"10D", X"10B", 
X"109", X"107", X"105", X"103", X"100", X"0FE", X"0FC", X"0FA", X"0F8", X"0F6", 
X"0F3", X"0F1", X"0EF", X"0ED", X"0EB", X"0E9", X"0E6", X"0E4", X"0E2", X"0E0", 
X"0DE", X"0DB", X"0D9", X"0D7", X"0D5", X"0D3", X"0D1", X"0CE", X"0CC", X"0CA", 
X"0C8", X"0C6", X"0C3", X"0C1", X"0BF", X"0BD", X"0BB", X"0B8", X"0B6", X"0B4", 
X"0B2", X"0B0", X"0AD", X"0AB", X"0A9", X"0A7", X"0A5", X"0A2", X"0A0", X"09E", 
X"09C", X"09A", X"097", X"095", X"093", X"091", X"08F", X"08C", X"08A", X"088", 
X"086", X"083", X"081", X"07F", X"07D", X"07B", X"078", X"076", X"074", X"072", 
X"06F", X"06D", X"06B", X"069", X"067", X"064", X"062", X"060", X"05E", X"05B", 
X"059", X"057", X"055", X"053", X"050", X"04E", X"04C", X"04A", X"047", X"045", 
X"043", X"041", X"03F", X"03C", X"03A", X"038", X"036", X"033", X"031", X"02F", 
X"02D", X"02A", X"028", X"026", X"024", X"022", X"01F", X"01D", X"01B", X"019", 
X"016", X"014", X"012", X"010", X"00D", X"00B", X"009", X"007", X"004", X"002", 
X"000", X"802", X"804", X"807", X"809", X"80B", X"80D", X"810", X"812", X"814", 
X"816", X"819", X"81B", X"81D", X"81F", X"822", X"824", X"826", X"828", X"82A", 
X"82D", X"82F", X"831", X"833", X"836", X"838", X"83A", X"83C", X"83F", X"841", 
X"843", X"845", X"847", X"84A", X"84C", X"84E", X"850", X"853", X"855", X"857", 
X"859", X"85B", X"85E", X"860", X"862", X"864", X"867", X"869", X"86B", X"86D", 
X"86F", X"872", X"874", X"876", X"878", X"87B", X"87D", X"87F", X"881", X"883", 
X"886", X"888", X"88A", X"88C", X"88F", X"891", X"893", X"895", X"897", X"89A", 
X"89C", X"89E", X"8A0", X"8A2", X"8A5", X"8A7", X"8A9", X"8AB", X"8AD", X"8B0", 
X"8B2", X"8B4", X"8B6", X"8B8", X"8BB", X"8BD", X"8BF", X"8C1", X"8C3", X"8C6", 
X"8C8", X"8CA", X"8CC", X"8CE", X"8D1", X"8D3", X"8D5", X"8D7", X"8D9", X"8DB", 
X"8DE", X"8E0", X"8E2", X"8E4", X"8E6", X"8E9", X"8EB", X"8ED", X"8EF", X"8F1", 
X"8F3", X"8F6", X"8F8", X"8FA", X"8FC", X"8FE", X"900", X"903", X"905", X"907", 
X"909", X"90B", X"90D", X"90F", X"912", X"914", X"916", X"918", X"91A", X"91C", 
X"91F", X"921", X"923", X"925", X"927", X"929", X"92B", X"92E", X"930", X"932", 
X"934", X"936", X"938", X"93A", X"93C", X"93F", X"941", X"943", X"945", X"947", 
X"949", X"94B", X"94D", X"94F", X"952", X"954", X"956", X"958", X"95A", X"95C", 
X"95E", X"960", X"962", X"965", X"967", X"969", X"96B", X"96D", X"96F", X"971", 
X"973", X"975", X"977", X"979", X"97B", X"97E", X"980", X"982", X"984", X"986", 
X"988", X"98A", X"98C", X"98E", X"990", X"992", X"994", X"996", X"998", X"99A", 
X"99C", X"99E", X"9A0", X"9A3", X"9A5", X"9A7", X"9A9", X"9AB", X"9AD", X"9AF", 
X"9B1", X"9B3", X"9B5", X"9B7", X"9B9", X"9BB", X"9BD", X"9BF", X"9C1", X"9C3", 
X"9C5", X"9C7", X"9C9", X"9CB", X"9CD", X"9CF", X"9D1", X"9D3", X"9D5", X"9D7", 
X"9D9", X"9DB", X"9DD", X"9DF", X"9E1", X"9E3", X"9E5", X"9E7", X"9E9", X"9EB", 
X"9ED", X"9EE", X"9F0", X"9F2", X"9F4", X"9F6", X"9F8", X"9FA", X"9FC", X"9FE", 
X"A00", X"A02", X"A04", X"A06", X"A08", X"A0A", X"A0C", X"A0D", X"A0F", X"A11", 
X"A13", X"A15", X"A17", X"A19", X"A1B", X"A1D", X"A1F", X"A21", X"A22", X"A24", 
X"A26", X"A28", X"A2A", X"A2C", X"A2E", X"A30", X"A31", X"A33", X"A35", X"A37", 
X"A39", X"A3B", X"A3D", X"A3E", X"A40", X"A42", X"A44", X"A46", X"A48", X"A4A", 
X"A4B", X"A4D", X"A4F", X"A51", X"A53", X"A54", X"A56", X"A58", X"A5A", X"A5C", 
X"A5E", X"A5F", X"A61", X"A63", X"A65", X"A66", X"A68", X"A6A", X"A6C", X"A6E", 
X"A6F", X"A71", X"A73", X"A75", X"A76", X"A78", X"A7A", X"A7C", X"A7D", X"A7F", 
X"A81", X"A83", X"A84", X"A86", X"A88", X"A8A", X"A8B", X"A8D", X"A8F", X"A91", 
X"A92", X"A94", X"A96", X"A97", X"A99", X"A9B", X"A9C", X"A9E", X"AA0", X"AA1", 
X"AA3", X"AA5", X"AA7", X"AA8", X"AAA", X"AAC", X"AAD", X"AAF", X"AB1", X"AB2", 
X"AB4", X"AB5", X"AB7", X"AB9", X"ABA", X"ABC", X"ABE", X"ABF", X"AC1", X"AC2", 
X"AC4", X"AC6", X"AC7", X"AC9", X"ACB", X"ACC", X"ACE", X"ACF", X"AD1", X"AD2", 
X"AD4", X"AD6", X"AD7", X"AD9", X"ADA", X"ADC", X"ADD", X"ADF", X"AE1", X"AE2", 
X"AE4", X"AE5", X"AE7", X"AE8", X"AEA", X"AEB", X"AED", X"AEE", X"AF0", X"AF1", 
X"AF3", X"AF4", X"AF6", X"AF7", X"AF9", X"AFA", X"AFC", X"AFD", X"AFF", X"B00", 
X"B02", X"B03", X"B05", X"B06", X"B08", X"B09", X"B0B", X"B0C", X"B0E", X"B0F", 
X"B10", X"B12", X"B13", X"B15", X"B16", X"B18", X"B19", X"B1A", X"B1C", X"B1D", 
X"B1F", X"B20", X"B21", X"B23", X"B24", X"B26", X"B27", X"B28", X"B2A", X"B2B", 
X"B2C", X"B2E", X"B2F", X"B30", X"B32", X"B33", X"B34", X"B36", X"B37", X"B38", 
X"B3A", X"B3B", X"B3C", X"B3E", X"B3F", X"B40", X"B42", X"B43", X"B44", X"B46", 
X"B47", X"B48", X"B49", X"B4B", X"B4C", X"B4D", X"B4E", X"B50", X"B51", X"B52", 
X"B53", X"B55", X"B56", X"B57", X"B58", X"B5A", X"B5B", X"B5C", X"B5D", X"B5E", 
X"B60", X"B61", X"B62", X"B63", X"B64", X"B66", X"B67", X"B68", X"B69", X"B6A", 
X"B6B", X"B6D", X"B6E", X"B6F", X"B70", X"B71", X"B72", X"B73", X"B75", X"B76", 
X"B77", X"B78", X"B79", X"B7A", X"B7B", X"B7C", X"B7D", X"B7F", X"B80", X"B81", 
X"B82", X"B83", X"B84", X"B85", X"B86", X"B87", X"B88", X"B89", X"B8A", X"B8B", 
X"B8C", X"B8D", X"B8E", X"B8F", X"B90", X"B91", X"B92", X"B93", X"B94", X"B95", 
X"B96", X"B97", X"B98", X"B99", X"B9A", X"B9B", X"B9C", X"B9D", X"B9E", X"B9F", 
X"BA0", X"BA1", X"BA2", X"BA3", X"BA4", X"BA5", X"BA6", X"BA7", X"BA7", X"BA8", 
X"BA9", X"BAA", X"BAB", X"BAC", X"BAD", X"BAE", X"BAF", X"BAF", X"BB0", X"BB1", 
X"BB2", X"BB3", X"BB4", X"BB5", X"BB5", X"BB6", X"BB7", X"BB8", X"BB9", X"BBA", 
X"BBA", X"BBB", X"BBC", X"BBD", X"BBE", X"BBE", X"BBF", X"BC0", X"BC1", X"BC1", 
X"BC2", X"BC3", X"BC4", X"BC5", X"BC5", X"BC6", X"BC7", X"BC7", X"BC8", X"BC9", 
X"BCA", X"BCA", X"BCB", X"BCC", X"BCC", X"BCD", X"BCE", X"BCF", X"BCF", X"BD0", 
X"BD1", X"BD1", X"BD2", X"BD3", X"BD3", X"BD4", X"BD5", X"BD5", X"BD6", X"BD6", 
X"BD7", X"BD8", X"BD8", X"BD9", X"BDA", X"BDA", X"BDB", X"BDB", X"BDC", X"BDD", 
X"BDD", X"BDE", X"BDE", X"BDF", X"BDF", X"BE0", X"BE0", X"BE1", X"BE2", X"BE2", 
X"BE3", X"BE3", X"BE4", X"BE4", X"BE5", X"BE5", X"BE6", X"BE6", X"BE7", X"BE7", 
X"BE8", X"BE8", X"BE9", X"BE9", X"BEA", X"BEA", X"BEB", X"BEB", X"BEB", X"BEC", 
X"BEC", X"BED", X"BED", X"BEE", X"BEE", X"BEE", X"BEF", X"BEF", X"BF0", X"BF0", 
X"BF0", X"BF1", X"BF1", X"BF2", X"BF2", X"BF2", X"BF3", X"BF3", X"BF3", X"BF4", 
X"BF4", X"BF4", X"BF5", X"BF5", X"BF5", X"BF6", X"BF6", X"BF6", X"BF7", X"BF7", 
X"BF7", X"BF8", X"BF8", X"BF8", X"BF8", X"BF9", X"BF9", X"BF9", X"BF9", X"BFA", 
X"BFA", X"BFA", X"BFA", X"BFB", X"BFB", X"BFB", X"BFB", X"BFB", X"BFC", X"BFC", 
X"BFC", X"BFC", X"BFC", X"BFD", X"BFD", X"BFD", X"BFD", X"BFD", X"BFE", X"BFE", 
X"BFE", X"BFE", X"BFE", X"BFE", X"BFE", X"BFE", X"BFF", X"BFF", X"BFF", X"BFF", 
X"BFF", X"BFF", X"BFF", X"BFF", X"BFF", X"BFF", X"C00", X"C00", X"C00", X"C00", 
X"C00", X"C00", X"C00", X"C00", X"C00", X"C00", X"C00", X"C00", X"C00", X"C00", 
X"C00", X"C00", X"C00", X"C00", X"C00", X"C00", X"C00", X"C00", X"C00", X"C00", 
X"C00", X"C00", X"C00", X"C00", X"C00", X"BFF", X"BFF", X"BFF", X"BFF", X"BFF", 
X"BFF", X"BFF", X"BFF", X"BFF", X"BFF", X"BFE", X"BFE", X"BFE", X"BFE", X"BFE", 
X"BFE", X"BFE", X"BFE", X"BFD", X"BFD", X"BFD", X"BFD", X"BFD", X"BFC", X"BFC", 
X"BFC", X"BFC", X"BFC", X"BFB", X"BFB", X"BFB", X"BFB", X"BFB", X"BFA", X"BFA", 
X"BFA", X"BFA", X"BF9", X"BF9", X"BF9", X"BF9", X"BF8", X"BF8", X"BF8", X"BF8", 
X"BF7", X"BF7", X"BF7", X"BF6", X"BF6", X"BF6", X"BF5", X"BF5", X"BF5", X"BF4", 
X"BF4", X"BF4", X"BF3", X"BF3", X"BF3", X"BF2", X"BF2", X"BF2", X"BF1", X"BF1", 
X"BF0", X"BF0", X"BF0", X"BEF", X"BEF", X"BEE", X"BEE", X"BEE", X"BED", X"BED", 
X"BEC", X"BEC", X"BEB", X"BEB", X"BEB", X"BEA", X"BEA", X"BE9", X"BE9", X"BE8", 
X"BE8", X"BE7", X"BE7", X"BE6", X"BE6", X"BE5", X"BE5", X"BE4", X"BE4", X"BE3", 
X"BE3", X"BE2", X"BE2", X"BE1", X"BE0", X"BE0", X"BDF", X"BDF", X"BDE", X"BDE", 
X"BDD", X"BDD", X"BDC", X"BDB", X"BDB", X"BDA", X"BDA", X"BD9", X"BD8", X"BD8", 
X"BD7", X"BD6", X"BD6", X"BD5", X"BD5", X"BD4", X"BD3", X"BD3", X"BD2", X"BD1", 
X"BD1", X"BD0", X"BCF", X"BCF", X"BCE", X"BCD", X"BCC", X"BCC", X"BCB", X"BCA", 
X"BCA", X"BC9", X"BC8", X"BC7", X"BC7", X"BC6", X"BC5", X"BC5", X"BC4", X"BC3", 
X"BC2", X"BC1", X"BC1", X"BC0", X"BBF", X"BBE", X"BBE", X"BBD", X"BBC", X"BBB", 
X"BBA", X"BBA", X"BB9", X"BB8", X"BB7", X"BB6", X"BB5", X"BB5", X"BB4", X"BB3", 
X"BB2", X"BB1", X"BB0", X"BAF", X"BAF", X"BAE", X"BAD", X"BAC", X"BAB", X"BAA", 
X"BA9", X"BA8", X"BA7", X"BA7", X"BA6", X"BA5", X"BA4", X"BA3", X"BA2", X"BA1", 
X"BA0", X"B9F", X"B9E", X"B9D", X"B9C", X"B9B", X"B9A", X"B99", X"B98", X"B97", 
X"B96", X"B95", X"B94", X"B93", X"B92", X"B91", X"B90", X"B8F", X"B8E", X"B8D", 
X"B8C", X"B8B", X"B8A", X"B89", X"B88", X"B87", X"B86", X"B85", X"B84", X"B83", 
X"B82", X"B81", X"B80", X"B7F", X"B7D", X"B7C", X"B7B", X"B7A", X"B79", X"B78", 
X"B77", X"B76", X"B75", X"B73", X"B72", X"B71", X"B70", X"B6F", X"B6E", X"B6D", 
X"B6B", X"B6A", X"B69", X"B68", X"B67", X"B66", X"B64", X"B63", X"B62", X"B61", 
X"B60", X"B5E", X"B5D", X"B5C", X"B5B", X"B5A", X"B58", X"B57", X"B56", X"B55", 
X"B53", X"B52", X"B51", X"B50", X"B4E", X"B4D", X"B4C", X"B4B", X"B49", X"B48", 
X"B47", X"B46", X"B44", X"B43", X"B42", X"B40", X"B3F", X"B3E", X"B3C", X"B3B", 
X"B3A", X"B38", X"B37", X"B36", X"B34", X"B33", X"B32", X"B30", X"B2F", X"B2E", 
X"B2C", X"B2B", X"B2A", X"B28", X"B27", X"B26", X"B24", X"B23", X"B21", X"B20", 
X"B1F", X"B1D", X"B1C", X"B1A", X"B19", X"B18", X"B16", X"B15", X"B13", X"B12", 
X"B10", X"B0F", X"B0E", X"B0C", X"B0B", X"B09", X"B08", X"B06", X"B05", X"B03", 
X"B02", X"B00", X"AFF", X"AFD", X"AFC", X"AFA", X"AF9", X"AF7", X"AF6", X"AF4", 
X"AF3", X"AF1", X"AF0", X"AEE", X"AED", X"AEB", X"AEA", X"AE8", X"AE7", X"AE5", 
X"AE4", X"AE2", X"AE1", X"ADF", X"ADD", X"ADC", X"ADA", X"AD9", X"AD7", X"AD6", 
X"AD4", X"AD2", X"AD1", X"ACF", X"ACE", X"ACC", X"ACB", X"AC9", X"AC7", X"AC6", 
X"AC4", X"AC2", X"AC1", X"ABF", X"ABE", X"ABC", X"ABA", X"AB9", X"AB7", X"AB5", 
X"AB4", X"AB2", X"AB1", X"AAF", X"AAD", X"AAC", X"AAA", X"AA8", X"AA7", X"AA5", 
X"AA3", X"AA1", X"AA0", X"A9E", X"A9C", X"A9B", X"A99", X"A97", X"A96", X"A94", 
X"A92", X"A91", X"A8F", X"A8D", X"A8B", X"A8A", X"A88", X"A86", X"A84", X"A83", 
X"A81", X"A7F", X"A7D", X"A7C", X"A7A", X"A78", X"A76", X"A75", X"A73", X"A71", 
X"A6F", X"A6E", X"A6C", X"A6A", X"A68", X"A66", X"A65", X"A63", X"A61", X"A5F", 
X"A5E", X"A5C", X"A5A", X"A58", X"A56", X"A54", X"A53", X"A51", X"A4F", X"A4D", 
X"A4B", X"A4A", X"A48", X"A46", X"A44", X"A42", X"A40", X"A3E", X"A3D", X"A3B", 
X"A39", X"A37", X"A35", X"A33", X"A31", X"A30", X"A2E", X"A2C", X"A2A", X"A28", 
X"A26", X"A24", X"A22", X"A21", X"A1F", X"A1D", X"A1B", X"A19", X"A17", X"A15", 
X"A13", X"A11", X"A0F", X"A0D", X"A0C", X"A0A", X"A08", X"A06", X"A04", X"A02", 
X"A00", X"9FE", X"9FC", X"9FA", X"9F8", X"9F6", X"9F4", X"9F2", X"9F0", X"9EE", 
X"9ED", X"9EB", X"9E9", X"9E7", X"9E5", X"9E3", X"9E1", X"9DF", X"9DD", X"9DB", 
X"9D9", X"9D7", X"9D5", X"9D3", X"9D1", X"9CF", X"9CD", X"9CB", X"9C9", X"9C7", 
X"9C5", X"9C3", X"9C1", X"9BF", X"9BD", X"9BB", X"9B9", X"9B7", X"9B5", X"9B3", 
X"9B1", X"9AF", X"9AD", X"9AB", X"9A9", X"9A7", X"9A5", X"9A3", X"9A0", X"99E", 
X"99C", X"99A", X"998", X"996", X"994", X"992", X"990", X"98E", X"98C", X"98A", 
X"988", X"986", X"984", X"982", X"980", X"97E", X"97B", X"979", X"977", X"975", 
X"973", X"971", X"96F", X"96D", X"96B", X"969", X"967", X"965", X"962", X"960", 
X"95E", X"95C", X"95A", X"958", X"956", X"954", X"952", X"94F", X"94D", X"94B", 
X"949", X"947", X"945", X"943", X"941", X"93F", X"93C", X"93A", X"938", X"936", 
X"934", X"932", X"930", X"92E", X"92B", X"929", X"927", X"925", X"923", X"921", 
X"91F", X"91C", X"91A", X"918", X"916", X"914", X"912", X"90F", X"90D", X"90B", 
X"909", X"907", X"905", X"903", X"900", X"8FE", X"8FC", X"8FA", X"8F8", X"8F6", 
X"8F3", X"8F1", X"8EF", X"8ED", X"8EB", X"8E9", X"8E6", X"8E4", X"8E2", X"8E0", 
X"8DE", X"8DB", X"8D9", X"8D7", X"8D5", X"8D3", X"8D1", X"8CE", X"8CC", X"8CA", 
X"8C8", X"8C6", X"8C3", X"8C1", X"8BF", X"8BD", X"8BB", X"8B8", X"8B6", X"8B4", 
X"8B2", X"8B0", X"8AD", X"8AB", X"8A9", X"8A7", X"8A5", X"8A2", X"8A0", X"89E", 
X"89C", X"89A", X"897", X"895", X"893", X"891", X"88F", X"88C", X"88A", X"888", 
X"886", X"883", X"881", X"87F", X"87D", X"87B", X"878", X"876", X"874", X"872", 
X"86F", X"86D", X"86B", X"869", X"867", X"864", X"862", X"860", X"85E", X"85B", 
X"859", X"857", X"855", X"853", X"850", X"84E", X"84C", X"84A", X"847", X"845", 
X"843", X"841", X"83F", X"83C", X"83A", X"838", X"836", X"833", X"831", X"82F", 
X"82D", X"82A", X"828", X"826", X"824", X"822", X"81F", X"81D", X"81B", X"819", 
X"816", X"814", X"812", X"810", X"80D", X"80B", X"809", X"807", X"804", X"802", 
X"000", X"002", X"004", X"007", X"009", X"00B", X"00D", X"010", X"012", X"014", 
X"016", X"019", X"01B", X"01D", X"01F", X"022", X"024", X"026", X"028", X"02A", 
X"02D", X"02F", X"031", X"033", X"036", X"038", X"03A", X"03C", X"03F", X"041", 
X"043", X"045", X"047", X"04A", X"04C", X"04E", X"050", X"053", X"055", X"057", 
X"059", X"05B", X"05E", X"060", X"062", X"064", X"067", X"069", X"06B", X"06D", 
X"06F", X"072", X"074", X"076", X"078", X"07B", X"07D", X"07F", X"081", X"083", 
X"086", X"088", X"08A", X"08C", X"08F", X"091", X"093", X"095", X"097", X"09A", 
X"09C", X"09E", X"0A0", X"0A2", X"0A5", X"0A7", X"0A9", X"0AB", X"0AD", X"0B0", 
X"0B2", X"0B4", X"0B6", X"0B8", X"0BB", X"0BD", X"0BF", X"0C1", X"0C3", X"0C6", 
X"0C8", X"0CA", X"0CC", X"0CE", X"0D1", X"0D3", X"0D5", X"0D7", X"0D9", X"0DB", 
X"0DE", X"0E0", X"0E2", X"0E4", X"0E6", X"0E9", X"0EB", X"0ED", X"0EF", X"0F1", 
X"0F3", X"0F6", X"0F8", X"0FA", X"0FC", X"0FE", X"100", X"103", X"105", X"107", 
X"109", X"10B", X"10D", X"10F", X"112", X"114", X"116", X"118", X"11A", X"11C", 
X"11F", X"121", X"123", X"125", X"127", X"129", X"12B", X"12E", X"130", X"132", 
X"134", X"136", X"138", X"13A", X"13C", X"13F", X"141", X"143", X"145", X"147", 
X"149", X"14B", X"14D", X"14F", X"152", X"154", X"156", X"158", X"15A", X"15C", 
X"15E", X"160", X"162", X"165", X"167", X"169", X"16B", X"16D", X"16F", X"171", 
X"173", X"175", X"177", X"179", X"17B", X"17E", X"180", X"182", X"184", X"186", 
X"188", X"18A", X"18C", X"18E", X"190", X"192", X"194", X"196", X"198", X"19A", 
X"19C", X"19E", X"1A0", X"1A3", X"1A5", X"1A7", X"1A9", X"1AB", X"1AD", X"1AF", 
X"1B1", X"1B3", X"1B5", X"1B7", X"1B9", X"1BB", X"1BD", X"1BF", X"1C1", X"1C3", 
X"1C5", X"1C7", X"1C9", X"1CB", X"1CD", X"1CF", X"1D1", X"1D3", X"1D5", X"1D7", 
X"1D9", X"1DB", X"1DD", X"1DF", X"1E1", X"1E3", X"1E5", X"1E7", X"1E9", X"1EB", 
X"1ED", X"1EE", X"1F0", X"1F2", X"1F4", X"1F6", X"1F8", X"1FA", X"1FC", X"1FE", 
X"200", X"202", X"204", X"206", X"208", X"20A", X"20C", X"20D", X"20F", X"211", 
X"213", X"215", X"217", X"219", X"21B", X"21D", X"21F", X"221", X"222", X"224", 
X"226", X"228", X"22A", X"22C", X"22E", X"230", X"231", X"233", X"235", X"237", 
X"239", X"23B", X"23D", X"23E", X"240", X"242", X"244", X"246", X"248", X"24A", 
X"24B", X"24D", X"24F", X"251", X"253", X"254", X"256", X"258", X"25A", X"25C", 
X"25E", X"25F", X"261", X"263", X"265", X"266", X"268", X"26A", X"26C", X"26E", 
X"26F", X"271", X"273", X"275", X"276", X"278", X"27A", X"27C", X"27D", X"27F", 
X"281", X"283", X"284", X"286", X"288", X"28A", X"28B", X"28D", X"28F", X"291", 
X"292", X"294", X"296", X"297", X"299", X"29B", X"29C", X"29E", X"2A0", X"2A1", 
X"2A3", X"2A5", X"2A7", X"2A8", X"2AA", X"2AC", X"2AD", X"2AF", X"2B1", X"2B2", 
X"2B4", X"2B5", X"2B7", X"2B9", X"2BA", X"2BC", X"2BE", X"2BF", X"2C1", X"2C2", 
X"2C4", X"2C6", X"2C7", X"2C9", X"2CB", X"2CC", X"2CE", X"2CF", X"2D1", X"2D2", 
X"2D4", X"2D6", X"2D7", X"2D9", X"2DA", X"2DC", X"2DD", X"2DF", X"2E1", X"2E2", 
X"2E4", X"2E5", X"2E7", X"2E8", X"2EA", X"2EB", X"2ED", X"2EE", X"2F0", X"2F1", 
X"2F3", X"2F4", X"2F6", X"2F7", X"2F9", X"2FA", X"2FC", X"2FD", X"2FF", X"300", 
X"302", X"303", X"305", X"306", X"308", X"309", X"30B", X"30C", X"30E", X"30F", 
X"310", X"312", X"313", X"315", X"316", X"318", X"319", X"31A", X"31C", X"31D", 
X"31F", X"320", X"321", X"323", X"324", X"326", X"327", X"328", X"32A", X"32B", 
X"32C", X"32E", X"32F", X"330", X"332", X"333", X"334", X"336", X"337", X"338", 
X"33A", X"33B", X"33C", X"33E", X"33F", X"340", X"342", X"343", X"344", X"346", 
X"347", X"348", X"349", X"34B", X"34C", X"34D", X"34E", X"350", X"351", X"352", 
X"353", X"355", X"356", X"357", X"358", X"35A", X"35B", X"35C", X"35D", X"35E", 
X"360", X"361", X"362", X"363", X"364", X"366", X"367", X"368", X"369", X"36A", 
X"36B", X"36D", X"36E", X"36F", X"370", X"371", X"372", X"373", X"375", X"376", 
X"377", X"378", X"379", X"37A", X"37B", X"37C", X"37D", X"37F", X"380", X"381", 
X"382", X"383", X"384", X"385", X"386", X"387", X"388", X"389", X"38A", X"38B", 
X"38C", X"38D", X"38E", X"38F", X"390", X"391", X"392", X"393", X"394", X"395", 
X"396", X"397", X"398", X"399", X"39A", X"39B", X"39C", X"39D", X"39E", X"39F", 
X"3A0", X"3A1", X"3A2", X"3A3", X"3A4", X"3A5", X"3A6", X"3A7", X"3A7", X"3A8", 
X"3A9", X"3AA", X"3AB", X"3AC", X"3AD", X"3AE", X"3AF", X"3AF", X"3B0", X"3B1", 
X"3B2", X"3B3", X"3B4", X"3B5", X"3B5", X"3B6", X"3B7", X"3B8", X"3B9", X"3BA", 
X"3BA", X"3BB", X"3BC", X"3BD", X"3BE", X"3BE", X"3BF", X"3C0", X"3C1", X"3C1", 
X"3C2", X"3C3", X"3C4", X"3C5", X"3C5", X"3C6", X"3C7", X"3C7", X"3C8", X"3C9", 
X"3CA", X"3CA", X"3CB", X"3CC", X"3CC", X"3CD", X"3CE", X"3CF", X"3CF", X"3D0", 
X"3D1", X"3D1", X"3D2", X"3D3", X"3D3", X"3D4", X"3D5", X"3D5", X"3D6", X"3D6", 
X"3D7", X"3D8", X"3D8", X"3D9", X"3DA", X"3DA", X"3DB", X"3DB", X"3DC", X"3DD", 
X"3DD", X"3DE", X"3DE", X"3DF", X"3DF", X"3E0", X"3E0", X"3E1", X"3E2", X"3E2", 
X"3E3", X"3E3", X"3E4", X"3E4", X"3E5", X"3E5", X"3E6", X"3E6", X"3E7", X"3E7", 
X"3E8", X"3E8", X"3E9", X"3E9", X"3EA", X"3EA", X"3EB", X"3EB", X"3EB", X"3EC", 
X"3EC", X"3ED", X"3ED", X"3EE", X"3EE", X"3EE", X"3EF", X"3EF", X"3F0", X"3F0", 
X"3F0", X"3F1", X"3F1", X"3F2", X"3F2", X"3F2", X"3F3", X"3F3", X"3F3", X"3F4", 
X"3F4", X"3F4", X"3F5", X"3F5", X"3F5", X"3F6", X"3F6", X"3F6", X"3F7", X"3F7", 
X"3F7", X"3F8", X"3F8", X"3F8", X"3F8", X"3F9", X"3F9", X"3F9", X"3F9", X"3FA", 
X"3FA", X"3FA", X"3FA", X"3FB", X"3FB", X"3FB", X"3FB", X"3FB", X"3FC", X"3FC", 
X"3FC", X"3FC", X"3FC", X"3FD", X"3FD", X"3FD", X"3FD", X"3FD", X"3FE", X"3FE", 
X"3FE", X"3FE", X"3FE", X"3FE", X"3FE", X"3FE", X"3FF", X"3FF", X"3FF", X"3FF", 
X"3FF", X"3FF", X"3FF", X"3FF", X"3FF", X"3FF", X"400", X"400", X"400", X"400", 
X"400", X"400", X"400", X"400", X"400", X"400", X"400", X"400", X"400", X"400"
);
begin
	process(H)
	begin
		if(H'event and H='1')then
			SINUS <= TABLE(TO_INTEGER(UNSIGNED(ANGLE(15 downto 4))))&"0000";
			COSINUS <= TABLE(TO_INTEGER(UNSIGNED(ANGLE(15 downto 4)))+90*8)&"0000";
		end if;
	end process;
end architecture;