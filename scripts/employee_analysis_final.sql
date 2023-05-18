--1. list employee #, last name, first name, sex, and salary of each employee

SELECT employees.emp_no, 
    employees.first_name, 
    employees.last_name, 
    employees.sex,
	salaries.salary

FROM employees
LEFT JOIN salaries ON
salaries.emp_no = employees.emp_no

;

--2. list first name, last name, hire data for employees hired in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date 
FROM employees
WHERE (hire_date > '1985-12-31') AND (hire_date < '1987-01-01') ;


--3. List the manager of each department along with their department number, department name, employee number,last name, first name, dpt name
SELECT dept_manager.dept_no, 
	departments.dept_name,
    dept_manager.emp_no, 
	,employees.first_name, employees.last_name
FROM dept_manager
LEFT JOIN departments ON
dept_manager.dept_no = departments.dept_no
LEFT JOIN employees ON
dept_manager.emp_no = employees.emp_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT dept_emp.dept_no 
	, dept_emp.emp_no
	, employees.first_name, employees.last_name
	, departments.dept_name
	
FROM dept_emp
LEFT JOIN departments ON 
dept_emp.dept_no = departments.dept_no
LEFT JOIN employees ON
dept_emp.emp_no = employees.emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT employees.first_name
	, employees.last_name
	, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND
	employees.last_name LIKE 'B%'
--6. List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT --departments.dept_no
--	 departments.dept_name
	 dept_emp.emp_no
--    , employees.emp_no
	, employees.first_name
	, employees.last_name

FROM departments
LEFT JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
LEFT JOIN employees ON 
dept_emp.emp_no = employees.emp_no

WHERE departments.dept_name = 'Sales'
;

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)

SELECT --departments.dept_no
	 departments.dept_name
	 , dept_emp.emp_no
--    , employees.emp_no
	, employees.first_name
	, employees.last_name

FROM departments
LEFT JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
LEFT JOIN employees ON 
dept_emp.emp_no = employees.emp_no

WHERE departments.dept_name = 'Sales' OR
	departments.dept_name = 'Development'
;

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT employees.last_name ,
	COUNT(employees.last_name) as "lastname_count"

FROM employees
GROUP BY employees.last_name
ORDER BY "lastname_count" DESC
;

