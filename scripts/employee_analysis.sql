--1. listing employee #, name, sex, salary

SELECT employees.emo_no, 
    employees.first_name, 
    employees.last_name, 
    employees.sex 

FROM employees
--also need to get 

--2. list first name, last name, hire data for employees in 1986
SELECT first_name, last_name, hire_data 
FROM employees
WHERE hire_data = --[insert regex] 1986

--3. manager name for each dept, dept no, dep name, employee #, last name, first name

--4. List the manager of each department along with their department number, department name, employee number,last name, first name, dpt name