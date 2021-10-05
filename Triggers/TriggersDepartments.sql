USE employees;

CREATE TRIGGER after_department_insert
AFTER INSERT
ON departments FOR EACH ROW
INSERT INTO dept_list_changes(dept_no, dept_name, first_name, last_name, gender, hire_date, insert_date)
VALUES(NEW.emp_no, NEW.birth_date, NEW.first_name, NEW.last_name, NEW.gender, NEW.hire_date, 'Jazmin', 'Insert', NOW());