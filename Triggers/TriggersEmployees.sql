USE employees;

SELECT * FROM employees_list_of_changes;

SELECT * FROM employees;

-- Create table employees_list_inserts first

DROP TABLE employees_list_of_changes;

-- AFTER INSERT TRIGGER
CREATE TRIGGER after_employees_insert
AFTER INSERT
ON employees FOR EACH ROW
INSERT INTO employees_list_of_changes(emp_no, birth_date, first_name, last_name, gender, hire_date, date_of_change, type_of_change, user)
VALUES(NEW.emp_no, NEW.birth_date, NEW.first_name, NEW.last_name, NEW.gender, NEW.hire_date,  NOW(), 'Insert', 'Jazmin');

DROP TRIGGER after_employees_insert;

SELECT NOW();

INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES
('20023', '1995-09-02', 'Georgina', 'Lopez', 'F', '1986-06-26');

INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES
('222', '1995-09-02', 'Georgina', 'Lopez', 'F', '1986-06-26');

DELETE FROM employees
WHERE emp_no = 222;
-- Cuando estos delete, solo afecta a la tabla employees, no a la otra con el historial
-- Crear historial para los delete tambien

INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES
('23234', '1995-09-02', 'Georgina', 'Lopez', 'F', '1986-06-26');
-- No puedo volver a insertar algo que ya inserté con el = id porque no lo borré en la tabla del historial 
-- Cuando creo otra fila con el mismo id --> NO me deja --> porque NO puedo ponerle = id a dos filas en la tabla del historial 

INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES 
(234, '1995-09-02', 'Jorge', 'Lopez', 'F', '1987-06-26');

INSERT INTO employees
(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES
('44', '1995-09-02', 'Georgina', 'Lopez', 'F', '1986-06-26');

INSERT INTO employees_list_of_changes
(emp_no, birth_date, first_name, last_name, gender, hire_date, date_of_change, type_of_change, user, pk_list)
VALUES
('222', '1995-09-02', 'Georgina', 'Lopez', 'F', '1986-06-26', '2021-10-5', 'Insert', 'Jazmin', '1');
-- no podia usar la tabla porque no habia ninguna pk
-- la pk tiene que ser un int para que sea autoincremental, no varchar

ALTER TABLE employees_list_of_changes
ADD type_of_change VARCHAR(45);

ALTER TABLE employees_list_of_changes
MODIFY date_of_change DATETIME;

UPDATE employees_list_of_changes                 
SET type_of_change = 'Insert'  
WHERE emp_no = 23; 

UPDATE employees_list_of_changes                 
SET user = 'Jazmin'  
WHERE emp_no = 222; 


-- BEFORE UPDATE TRIGGER
CREATE TRIGGER before_update BEFORE UPDATE
ON employees FOR EACH ROW
INSERT INTO employees_list_of_changes(emp_no, birth_date, first_name, last_name, gender, hire_date, date_of_change, type_of_change, user)
VALUES(NEW.emp_no, NEW.birth_date, NEW.first_name, NEW.last_name, NEW.gender, NEW.hire_date,  NOW(), 'Before Update', 'Jazmin');

DROP TRIGGER before_update;


DELIMITER $$

CREATE TRIGGER before_update_employees
BEFORE UPDATE
ON employees FOR EACH ROW
BEGIN
    DECLARE errorMessage VARCHAR(255);
    IF new.first_name is NULL THEN
	    SET errorMessage = CONCAT('You must enter your first name');
    END IF;
END $$

DELIMITER ;
-- !!! TODO
-- NO FUNCIONA ESTE BEFORE UPDATE

UPDATE employees               
SET first_name = null  
WHERE emp_no = 222; 
-- No me permite modificar la tabla que cargue, solo los datos nuevos que inserte
-- No me permite hacer mas de un update



DELETE FROM employees_list_of_changes
WHERE emp_no = 23 OR 44 OR 222 OR 234 OR 23234;

DELETE FROM employees
WHERE emp_no = 23 OR 44 OR 222 OR 234 OR 23234;
-- NO eliminar asi jamas, elimina todas las que tienen en su id alguno de esos numeros
-- Eliminé todas las filas agregadas porque me olvidé de agregarle una pk a la tabla


-- AFTER UPDATE TRIGGER
CREATE TRIGGER after_update 
AFTER UPDATE
ON employees FOR EACH ROW
INSERT INTO employees_list_of_changes(emp_no, birth_date, first_name, last_name, gender, hire_date, date_of_change, type_of_change, user)
VALUES(NEW.emp_no, NEW.birth_date, NEW.first_name, NEW.last_name, NEW.gender, NEW.hire_date,  NOW(), 'After Update', 'Jazmin');

DROP TRIGGER after_update;



-- DELETE TRIGGER
CREATE TRIGGER after_delete
AFTER DELETE
ON employees FOR EACH ROW
INSERT INTO employees_list_of_changes(emp_no, birth_date, first_name, last_name, gender, hire_date, date_of_change, type_of_change, user)
VALUES(OLD.emp_no, OLD.birth_date, OLD.first_name, OLD.last_name, OLD.gender, OLD.hire_date, OLD.hire_date, 'After Delete', 'Jazmin');


DELETE FROM employees
WHERE emp_no = 44;

-- !!! TODO
-- MIRAR EL CURSO DE TRIGGERS
-- FIJARME BIEN COMO HACERLOS CON CONDICIONES
