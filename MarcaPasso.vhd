library ieee;
use ieee.std_logic_1164.all;

entity MarcaPasso is
port(sa, sv, clk : in bit;
			pa, pv: out bit);
end MarcaPasso;

architecture behavior of MarcaPasso is
	signal n2, n1, n0: bit; -- Proximo estado
	signal s2, s1, s0: bit; -- Estado atual
	signal ta, za, tv, zv: bit; -- comunicadores entre os circuitos
	
		component reg3 is
			port(c, i2, i1, i0 : in bit;
						q2, q1, q0 : out bit);
		end component;
		component circ_comb is
				port(sa1, za1, sv1, zv1, c, current2, current1, current0 : in bit;
							next2, next1, next0, pa1, ta1, pv1, tv1 : out bit);
		end component;
		component tempA is
			port(clk, rst : in bit;
						q : out bit);
		end component;
		component tempV is
			port(clk, rst : in bit;
						q : out bit);
		end component;
begin
		u1 : reg3 port map(c => clk, i2 => n2, i1 => n1, i0 => n0, q2 => s2, q1 => s1, q0 => s0);
		u2 : circ_comb port map(sa1 => sa, za1 => za, sv1 => sv, zv1 => zv, c => clk, current2 => s2, current1 => s1, current0 => s0, next2 => n2, next1 => n1, next0 => n0, pa1 => pa, ta1 => ta, pv1 => pv, tv1 => tv);
		u3 : tempA port map (clk=> clk, rst => ta, q => za);
		u4 : tempV port map (clk=> clk, rst => tv, q => zv);
		
		
end architecture behavior;

-- deveria ter so s e p na entidade topo do MP
-- 