library ieee;
use ieee.std_logic_1164.all;

entity circ_comb is
port(sa1, za1, sv1, zv1, c, current2, current1, current0 : in bit;
			next2, next1, next0, pa1, ta1, pv1, tv1 : out bit);
end circ_comb;

architecture behav of circ_comb is
	begin
		next2 <= (NOT(current2) AND current1 AND current0) OR (current2 AND NOT(current1) AND NOT(current0) AND NOT(sv1));
		next1 <= (NOT(current2) AND NOT(current1) AND current0 AND NOT(sa1) AND za1) OR (NOT(current2) AND NOT(current1) AND current0 AND sa1) OR (NOT(current2) AND current1 AND NOT(current0));
		next0 <= (NOT(current2) AND NOT(current1) AND NOT(current0)) OR (NOT(current2) AND NOT(current1) AND current0 AND NOT(sa1) AND NOT(za1)) OR (NOT(current2) AND NOT(current1) AND current0 AND sa1) OR (NOT(current2) AND current1 AND NOT(current0)) OR (current2 AND NOT(current1) AND NOT(current0) AND NOT(sv1) AND zv1);
		
		pa1 <= NOT(current2) AND current1 AND NOT(current0);
		ta1 <= NOT(current2) AND NOT(current1) AND NOT(current0);
		pv1 <= current2 AND NOT(current1) AND current0;
		tv1 <= NOT(current2) AND current1 AND current0;
end architecture behav;