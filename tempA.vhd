-- temporizador a partir de contador decrescente de 4 bits
ENTITY tempA IS
PORT(
clk: IN BIT; --entrada de clock
rst: IN BIT;
q: OUT BIT;
q2 : out integer range 5 downto 0);
END tempA;

ARCHITECTURE comportamento OF tempA IS
	BEGIN PROCESS(clk)
		VARIABLE qv: INTEGER RANGE 5 DOWNTO 0; --variável para a saida
		VARIABLE tc: INTEGER RANGE 5 DOWNTO 0; --variável para a saida
		BEGIN
			IF (rst = '1') THEN
				tc:=0;
			ELSIF(tc <= 1) THEN
				qv := 5;
				tc := 5;
			ELSIF(clk ' event and clk = '1') THEN
				IF(qv <= 0) THEN
					tc:= 0;
					q <= '1';
				ELSE
					q <= '0';	
					qv := qv - 1;
				END IF;
			END IF;
			q2 <= qv;
	END PROCESS;
END;