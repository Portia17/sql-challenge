--List the employee number, last name, first name, sex,
--and salary of each employee.

CREATE VIEW analysis_1 AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" e
JOIN "Salaries" s
ON (e.emp_no = s.emp_no);

--List the first name, last name, and hire date for the employees 
--who were hired in 1986.

CREATE VIEW analysis_2 AS
SELECT first_name, last_name, hire_date
From "Employees"
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department along with their department number,
--department name, employee number, last name, and first name.

CREATE VIEW analysis_3 AS
SELECT  dm.dept, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM "Dept_Manager" dm
JOIN "Employees" e
ON (dm.emp_no = e.emp_no)
	JOIN "Departments" d
	ON (dm.dept = d.dept_no);

--List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name.

CREATE VIEW analysis_4 AS
SELECT  de.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM "Dept_Emp" de
JOIN "Employees" e
ON (de.emp_no = e.emp_no)
	JOIN "Departments" d
	ON (de.dept_no = d.dept_no);

--List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B.

CREATE VIEW analysis_5 AS
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including 
-- their employee number, last name, and first name.

CREATE VIEW analysis_6 AS
SELECT emp_no, last_name, first_name
FROM "Employees"
WHERE emp_no IN
(
	SELECT emp_no
	FROM "Dept_Emp"
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM "Departments"
		WHERE dept_name = 'Sales'
	)
);

-- List each employee in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.

CREATE VIEW analysis_7 AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Departments" d
JOIN "Dept_Emp" de
ON (d.dept_no = de.dept_no)
JOIN "Employees" e
ON (de.emp_no = e.emp_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee 
--last names (that is, how many employees share each last name).

CREATE VIEW analysis_8 AS
SELECT last_name, COUNT(last_name)
FROM "Employees"
GROUP BY last_name
ORDER BY count DESC;
