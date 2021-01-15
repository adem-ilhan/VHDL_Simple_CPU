
library ieee;
use ieee.std_logic_1164.all;
use  ieee.numeric_std.all ;



entity ALU is
port(
clk       :in  std_logic;                     -- CLK
OPCODE    :in  std_logic_vector(9 downto 0);   --Opcode
A         :in  std_logic_vector(7 downto 0);   -- A input
Q         :out std_logic_vector(7 downto 0)    -- output   

);

end ALU;

architecture behavioral of ALU is
signal QA,Aa : std_logic_vector(7 downto 0);
signal komut :std_logic_vector(3 downto 0);
signal adres1,adres2 :std_logic_vector(2 downto 0);
type regester is array (7 downto 0) 
	of std_logic_vector (7 downto 0);
type ram_type is array (7 downto 0)
	of std_logic_vector (7 downto 0);
signal REG : regester :=(x"00",x"00",x"00",x"00",
   		         x"00",x"00",x"00",x"00");
signal RAM : ram_type :=(x"00",x"00",x"00",x"00",
                         x"00",x"00",x"00",x"00");

begin
komut <= OPCODE(9 downto 6);--OPCODE decode edildi 
adres1 <= OPCODE(5 downto 3);--adresler duruma gore bir int degere hitap edebilir
adres1 <=OPCODE(2 downto 0); -- LOAD ve LOADX komutlari disinda rame erisim yoktur

process(clk)
begin


  
if rising_edge(clk) then
	case komut is
		when "0000" =>--MOV
			REG(to_integer(unsigned(adres1)))<=REG(to_integer(unsigned(adres2)));
		when "0001" =>--INC
			REG(to_integer(unsigned(adres1)))<= std_logic_vector( unsigned(REG(to_integer(unsigned(adres1)))) + 1 );
		when "0010" =>--IN
			REG(to_integer(unsigned(adres1)))<=A;
		when "0011" =>--OUT
			Q<=REG(to_integer(unsigned(adres1)));
		when "0100" =>--LOAD
			REG(to_integer(unsigned(adres1)))<=RAM(to_integer(unsigned(adres2)));	
		when "0101" =>--LOADX
			RAM(to_integer(unsigned(adres1)))<=REG(to_integer(unsigned(adres2)));	
		when "0110" =>--MUL
			REG(to_integer(unsigned(adres1)))<=std_logic_vector(unsigned(REG(to_integer(unsigned(adres1))))*2);
		when "0111" =>--DIV
			REG(to_integer(unsigned(adres1)))<=std_logic_vector(unsigned(REG(to_integer(unsigned(adres1))))*2);
		when "1000" =>--AND
			REG(to_integer(unsigned(adres1)))<=REG(to_integer(unsigned(adres1))) and REG(to_integer(unsigned(adres2)));
		when "1001" =>--NAND
			REG(to_integer(unsigned(adres1)))<=not(REG(to_integer(unsigned(adres1))) and REG(to_integer(unsigned(adres2))));
		when "1010" =>--OR
			REG(to_integer(unsigned(adres1)))<=REG(to_integer(unsigned(adres1))) or REG(to_integer(unsigned(adres2)));
		when "1011" =>--NOR
			REG(to_integer(unsigned(adres1)))<=not(REG(to_integer(unsigned(adres1))) or REG(to_integer(unsigned(adres2))));
		when "1100" =>--XOR
			REG(to_integer(unsigned(adres1)))<=REG(to_integer(unsigned(adres1))) xor REG(to_integer(unsigned(adres2)));
		when "1101" =>--SUB
			REG(to_integer(unsigned(adres1)))<= std_logic_vector( unsigned(REG(to_integer(unsigned(adres1)))) - unsigned(REG(to_integer(unsigned(adres2)))) );
		when "1110" =>--DEC
			REG(to_integer(unsigned(adres1)))<= std_logic_vector( unsigned(REG(to_integer(unsigned(adres1)))) - 1 );
		when "1111" =>--ADD
			REG(to_integer(unsigned(adres1)))<= std_logic_vector( unsigned(REG(to_integer(unsigned(adres1)))) + unsigned(REG(to_integer(unsigned(adres2)))) );
 		when others =>
			Q<="ZZZZZZZZ";
	end case; 
 end if ;
 end process ;
 end behavioral;