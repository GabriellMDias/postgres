CREATE TABLE employees (
	id serial Primary KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	date_of_birth DATE,
	salary DECIMAL(10, 2)
)

CREATE TABLE companies (
    id serial PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    founding_date DATE NOT NULL,
    revenue DECIMAL(15, 2)  NOT NULL
);

ALTER TABLE employees
ADD COLUMN id_company INTEGER REFERENCES companies(id);

ALTER TABLE companies
ADD COLUMN city VARCHAR(50) NOT NULL;