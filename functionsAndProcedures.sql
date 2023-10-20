CREATE OR REPLACE FUNCTION get_employee_count() RETURNS INTEGER AS $$
DECLARE
    total_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_count FROM employees;
    RETURN total_count;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_employee_by_company(id_company_param INTEGER) RETURNS SETOF employees AS $$
BEGIN
    RETURN QUERY SELECT * FROM employees WHERE id_company = id_company_param;
END;
$$ LANGUAGE plpgsql;

SELECT get_employee_count();
SELECT get_employee_by_company(1);

CREATE OR REPLACE PROCEDURE list_companies() AS $$
DECLARE
    company_record companies;
BEGIN
    FOR company_record IN (SELECT * FROM companies)
    LOOP
        RAISE NOTICE 'Company: %', company_record;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

CALL list_companies();