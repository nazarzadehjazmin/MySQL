USE employees;

-- Create table employees_list_inserts first

DROP TABLE employees_list_of_changes;

-- AFTER INSERT TRIGGER
CREATE TRIGGER after_employees_insert
AFTER INSERT
ON employees FOR EACH ROW
INSERT INTO employees_list_of_changes(emp_no, birth_date, first_name, last_name, gender, hire_date, insert_date)
VALUES(NEW.emp_no, NEW.birth_date, NEW.first_name, NEW.last_name, NEW.gender, NEW.hire_date, 'Jazmin', 'Insert', NOW());

DROP TRIGGER after_employees_insert;

SELECT NOW();

INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES
('20023', '1995-09-02', 'Georgina', 'Lopez', 'F', '1986-06-26');

INSERT INTO employees.employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES
('222', '1995-09-02', 'Georgina', 'Lopez', 'F', '1986-06-26');

DELETE FROM employees
WHERE emp_no = 222;

INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES
('23234', '1995-09-02', 'Georgina', 'Lopez', 'F', '1986-06-26');

INSERT INTO employees
(emp_no,
birth_date,
first_name,
last_name,
gender,
hire_date)
VALUES
(234, '1995-09-02', 'Jorge', 'Lopez', 'F', '1987-06-26');
-- TODO
-- 11:34:42	INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) 
-- VALUES (234, '1995-09-02', 'Jorge', 'Lopez', 'F', '1987-06-26')	Error Code: 1054. 
-- Unknown column 'insert_date' in 'field list'	0.031 sec


SELECT * FROM employees_list_of_changes;
SELECT * FROM employees;

ALTER TABLE employees_list_of_changes
ADD type_of_change VARCHAR(45);


UPDATE employees_list_of_changes                 
SET type_of_change = 'Insert'  
WHERE emp_no = 23 OR 222; 

UPDATE employees_list_of_changes                 
SET user = 'Jazmin'  
WHERE emp_no = 23 OR 222; 

SELECT * FROM employees_list_of_changes;

-- BEFORE UPDATE TRIGGER
-- CREATE TRIGGER before_update BEFORE UPDATE
-- ON employees FOR EACH ROW
-- INSERT INTO 


-- AFTER UPDATE TRIGGER
CREATE TRIGGER after_update 
AFTER UPDATE
ON employees FOR EACH ROW
INSERT INTO employees_list_of_changes(emp_no, birth_date, first_name, last_name, gender, hire_date, insert_date)
VALUES(NEW.emp_no, NEW.birth_date, NEW.first_name, NEW.last_name, NEW.gender, NEW.hire_date, NOW(), 'Insert', 'Jazmin');

UPDATE employees               
SET first_name = 'Ron'  
WHERE emp_no = 222; 


-- DELETE TRIGGER

