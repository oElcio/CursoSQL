CREATE OR REPLACE FUNCTION fnc_retorna_faixa_salarial (
    p_cod_funcionario IN NUMBER
) RETURN NUMBER
IS
    v_salario    NUMBER;
    v_cod_faixa  NUMBER;
BEGIN
    
    SELECT salario
    INTO v_salario
    FROM funcionario
    WHERE cod_funcionario = p_cod_funcionario;

    IF v_salario <= 3000 THEN
        v_cod_faixa := 1;
    ELSIF v_salario > 3000 AND v_salario <= 6000 THEN
        v_cod_faixa := 2;
    ELSE
        v_cod_faixa := 3;
    END IF;

    RETURN v_cod_faixa;

END;
/

BEGIN
   DBMS_OUTPUT.PUT_LINE('Faixa Salarial: ' || fnc_retorna_faixa_salarial(101));
END;
/

BEGIN
   DBMS_OUTPUT.PUT_LINE('Faixa Salarial: ' || fnc_retorna_faixa_salarial(142));
END;
/

BEGIN
   DBMS_OUTPUT.PUT_LINE('Faixa Salarial: ' || fnc_retorna_faixa_salarial(205));
END;
/



