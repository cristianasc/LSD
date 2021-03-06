library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity MYROM is
	port (	address_in	: in std_logic_vector(4 downto 0);
			id 			: in std_logic_vector(3 downto 0);
			output	: out std_logic_vector(7 downto 0));
end MYROM;

architecture behav of MYROM is
	subtype data_byte is std_logic_vector(7 downto 0);
	type bolacha_array is array (0 to 31) of data_byte;
	type chocolate_array is array (0 to 31) of data_byte;
	type agua_array is array (0 to 31) of data_byte;
	type vazio_array is array (0 to 31) of data_byte;
	constant bolacha : bolacha_array := ( X"42", X"6f", x"6c", X"61",
											  X"63", X"68", X"61", X"73",
									        X"20", X"2D", X"20", X"30", 
											  X"2E", X"36", X"30", "11100011", 
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20");
	constant chocolate : chocolate_array := ( X"43", X"68", X"6f", X"63", 
											  X"6f", X"6c", X"61", X"74", 
											  X"65", X"20", X"2D", X"20", 
											  X"31", "11100011", 
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20", X"20", X"20");
											  
											  
	constant agua : agua_array := ( X"41", X"67", x"75", X"61",
									        X"20", X"2D", X"20", X"30", 
											  X"2E", X"35", X"30", "11100011", 
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20");
											  
											  
	constant vazio : vazio_array :=(X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20",
											  X"20", X"20", X"20", X"20");

begin
	process(id, address_in)
	begin 
	if (id= "0001") then 
	output <= chocolate(to_integer(UNSIGNED(address_in)));
	elsif (id= "0010") then 
	output <= agua(to_integer(UNSIGNED(address_in)));
	elsif (id= "0011") then 
	output <= bolacha(to_integer(UNSIGNED(address_in)));
	else
	output <= vazio(to_integer(UNSIGNED(address_in)));
	end if;
	end process;
end behav;
