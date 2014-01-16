--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: SERVO_SERIAL
-- But: Gerer jus'que à 16 servo-moteurs, avec une precision de 8 bits, par un CI LM4015
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SERVO_SERIAL is Port ( 
	H     : in  STD_LOGIC;
	RESET : in  STD_LOGIC;
	VAL0  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL1  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL2  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL3  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL4  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL5  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL6  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL7  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL8  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL9  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL10 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL11 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL12 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL13 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL14 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL15 : in  STD_LOGIC_VECTOR (15 downto 0);
	DATA_OUT: out STD_LOGIC;
	CLK0_OUT: out STD_LOGIC;
	CLK1_OUT: out STD_LOGIC;
	CLK2_OUT: out STD_LOGIC;
	CLK3_OUT: out STD_LOGIC
);
end SERVO_SERIAL;

architecture Behavioral of SERVO_SERIAL is
CONSTANT H_FREQ : Integer := 50000000;
CONSTANT SERVO_FREQ : Integer := 2000000;
SIGNAL diviseur: INTEGER;
SIGNAL compteur: INTEGER;
SIGNAL com0, com1, com2, com3: INTEGER;
SIGNAL vec0, vec1, vec2, vec3: STD_LOGIC_VECTOR(12 downto 0);
SIGNAL copy0, copy1, copy2, copy3, copy4, copy5, copy6, copy7 :STD_LOGIC_VECTOR(11 downto 0);
SIGNAL copy8, copy9, copy10, copy11, copy12, copy13, copy14, copy15: STD_LOGIC_VECTOR(11 downto 0);
SIGNAL etats: STD_LOGIC_VECTOR(11 downto 0);
begin
	vec0 <= STD_LOGIC_VECTOR(TO_UNSIGNED(com0,13));
	vec1 <= STD_LOGIC_VECTOR(TO_UNSIGNED(com1,13));
	vec2 <= STD_LOGIC_VECTOR(TO_UNSIGNED(com2,13));
	vec3 <= STD_LOGIC_VECTOR(TO_UNSIGNED(com3,13));
	
	onHorloge : process (H)
	begin
		if(H'event and H='1')then
			if(RESET = '1')then
				diviseur <= 0;
				compteur <= 19998*2;
				DATA_OUT <= '0';
				CLK0_OUT <= '0';
				CLK1_OUT <= '0';
				CLK2_OUT <= '0';
				CLK3_OUT <= '0';
				com0 <= 0;
				com1 <= 0;
				com2 <= 0;
				com3 <= 0;
				etats <= "000000000000";
			else
				diviseur <= diviseur + 1;
				if(diviseur = (H_FREQ/SERVO_FREQ) )then
					diviseur <= 0;
					compteur <= compteur + 1;
					if(compteur=39998)then
						DATA_OUT <= '1';
					elsif(compteur=39999)then
						CLK0_OUT <= '1';
						CLK1_OUT <= '1';
						CLK2_OUT <= '1';
						CLK3_OUT <= '1';
				    etats <= "000000000000";
				    com0 <= 0;
				    com1 <= 0;
				    com2 <= 0;
				    com3 <= 0;
					elsif(compteur=40000)then
						DATA_OUT <= '0';
						CLK0_OUT <= '0';
						CLK1_OUT <= '0';
						CLK2_OUT <= '0';
						CLK3_OUT <= '0';
						compteur <= 0;
						copy0 <= VAL0(11 downto 0);
						copy1 <= VAL1(11 downto 0);
						copy2 <= VAL2(11 downto 0);
						copy3 <= VAL3(11 downto 0);
						copy4 <= VAL4(11 downto 0);
						copy5 <= VAL5(11 downto 0);
						copy6 <= VAL6(11 downto 0);
						copy7 <= VAL7(11 downto 0);
						copy8 <= VAL8(11 downto 0);
						copy9 <= VAL9(11 downto 0);
						copy10 <= VAL10(11 downto 0);
						copy11 <= VAL11(11 downto 0);
						copy12 <= VAL12(11 downto 0);
						copy13 <= VAL13(11 downto 0);
						copy14 <= VAL14(11 downto 0);
						copy15 <= VAL15(11 downto 0);
					else
						--------------------------------------------------0
						if(etats(2)='0')then
							com0 <= com0 + 1;
							case etats(1 downto 0) is
								when "00" =>
									if(copy0=vec0(12 downto 1))then
										if(vec0(0)='0')then
											CLK0_OUT <='1';
										else
											CLK0_OUT <= '0';
											etats(1 downto 0) <= "01";
											com0 <= 0;
										end if;
									end if;
								when "01" =>
									if(copy1=vec0(12 downto 1))then
										if(vec0(0)='0')then
											CLK0_OUT <='1';
										else
											CLK0_OUT <= '0';
											etats(1 downto 0) <= "10";
											com0 <= 0;
										end if;
									end if;
								when "10" =>
									if(copy2=vec0(12 downto 1))then
										if(vec0(0)='0')then
											CLK0_OUT <='1';
										else
											CLK0_OUT <= '0';
											etats(1 downto 0) <= "11";
											com0 <= 0;
										end if;
									end if;
								when others =>
									if(copy3=vec0(12 downto 1))then
										if(vec0(0)='0')then
											CLK0_OUT <='1';
										else
											CLK0_OUT <= '0';
											etats(2 downto 0) <= "100";
											com0 <= 0;
										end if;
									end if;
							end case;
						end if;
						-------------------------------------------------1
						if(etats(5)='0')then
							com1 <= com1 + 1;
							case etats(4 downto 3) is
								when "00" =>
									if(copy4=vec1(12 downto 1))then
										if(vec1(0)='0')then
											CLK1_OUT <='1';
										else
											CLK1_OUT <= '0';
											etats(4 downto 3) <= "01";
											com1 <= 0;
										end if;
									end if;
								when "01" =>
									if(copy5=vec1(12 downto 1))then
										if(vec1(0)='0')then
											CLK1_OUT <='1';
										else
											CLK1_OUT <= '0';
											etats(4 downto 3) <= "10";
											com1 <= 0;
										end if;
									end if;
								when "10" =>
									if(copy6=vec1(12 downto 1))then
										if(vec1(0)='0')then
											CLK1_OUT <='1';
										else
											CLK1_OUT <= '0';
											etats(4 downto 3) <= "11";
											com1 <= 0;
										end if;
									end if;
								when others =>
									if(copy7=vec1(12 downto 1))then
										if(vec1(0)='0')then
											CLK1_OUT <='1';
										else
											CLK1_OUT <= '0';
											etats(5 downto 3) <= "100";
											com1 <= 0;
										end if;
									end if;
							end case;
						end if;
						-----------------------------------------------------2
						if(etats(8)='0')then
							com2 <= com2 + 1;
							case etats(7 downto 6) is
								when "00" =>
									if(copy8=vec2(12 downto 1))then
										if(vec2(0)='0')then
											CLK2_OUT <='1';
										else
											CLK2_OUT <= '0';
											etats(7 downto 6) <= "01";
											com2 <= 0;
										end if;
									end if;
								when "01" =>
									if(copy9=vec2(12 downto 1))then
										if(vec2(0)='0')then
											CLK2_OUT <='1';
										else
											CLK2_OUT <= '0';
											etats(7 downto 6) <= "10";
											com2 <= 0;
										end if;
									end if;
								when "10" =>
									if(copy10=vec2(12 downto 1))then
										if(vec2(0)='0')then
											CLK2_OUT <='1';
										else
											CLK2_OUT <= '0';
											etats(7 downto 6) <= "11";
											com2 <= 0;
										end if;
									end if;
								when others =>
									if(copy11=vec2(12 downto 1))then
										if(vec2(0)='0')then
											CLK2_OUT <='1';
										else
											CLK2_OUT <= '0';
											etats(8 downto 6) <= "100";
											com2 <= 0;
										end if;
									end if;
							end case;
						end if;
						--------------------------------------------------------3
						if(etats(11)='0')then
							com3 <= com3 + 1;
							case etats(10 downto 9) is
								when "00" =>
									if(copy12=vec3(12 downto 1))then
										if(vec3(0)='0')then
											CLK3_OUT <='1';
										else
											CLK3_OUT <= '0';
											etats(10 downto 9) <= "01";
											com3 <= 0;
										end if;
									end if;
								when "01" =>
									if(copy13=vec3(12 downto 1))then
										if(vec3(0)='0')then
											CLK3_OUT <='1';
										else
											CLK3_OUT <= '0';
											etats(10 downto 9) <= "10";
											com3 <= 0;
										end if;
									end if;
								when "10" =>
									if(copy14=vec3(12 downto 1))then
										if(vec3(0)='0')then
											CLK3_OUT <='1';
										else
											CLK3_OUT <= '0';
											etats(10 downto 9) <= "11";
											com3 <= 0;
										end if;
									end if;
								when others =>
									if(copy15=vec3(12 downto 1))then
										if(vec3(0)='0')then
											CLK3_OUT <='1';
										else
											CLK3_OUT <= '0';
											etats(11 downto 9) <= "100";
											com3 <= 0;
										end if;
									end if;
							end case;
						end if;
						---------------------fin
					end if;
				end if;
			end if;
		end if;
	end process;					
end Behavioral;
