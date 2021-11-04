/* 1. Report */
SELECT COUNT(*) FROM departments;
SELECT COUNT(*) FROM dept_emp;
SELECT COUNT(*) FROM dept_manager;
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM salaries;
SELECT COUNT(*) FROM titles;

/* 2. Report */
SELECT count(employees.first_name) FROM employees where employees.first_name = "Mark";

/* 3.Report */
select count(*) from employees WHERE employees.first_name ="Eric" AND employees.last_name LIKE"A%";

/* 4. Report */
SELECT COUNT(*) FROM employees where employees.hire_date < '1986-01-01';
SELECT employees.first_name, employees.last_name  from employees WHERE employees.hire_date < '1986-01-01' 

/* 5. Report */
SELECT COUNT(*) FROM employees where employees.hire_date > '1989-12-31' AND employees.hire_date <'1997-12-31';
SELECT employees.first_name, employees.last_name  from employees WHERE employees.hire_date > '1989-12-31' AND employees.hire_date <'1997-12-31';



/* 6. Report */
SELECT DISTINCT COUNT(salaries.emp_no) FROM salaries JOIN employees ON employees.emp_no = salaries.emp_no WHERE salary > 70000;
SELECT salaries.salary, employees.last_name FROM salaries JOIN employees ON employees.emp_no = salaries.emp_no WHERE salary > 70000 GROUP BY salaries.emp_no;

/* 7.Report */
select DISTINCT employees.first_name, employees.last_name, dept_emp.dept_no from employees join dept_emp on dept_emp.emp_no = employees.emp_no where dept_emp.dept_no ='d008' 
AND employees.hire_date BETWEEN '1991/12/31' and CURRENT_DATE()

/* 8. Report */
select DISTINCT employees.first_name, employees.last_name from employees
join dept_emp on dept_emp.emp_no = employees.emp_no 
JOIN salaries ON salaries.emp_no = employees.emp_no
where dept_emp.dept_no ='d002' 
AND employees.hire_date BETWEEN '1985/01/01' 
and CURRENT_DATE()
AND salaries.salary > 75000
GROUP by salaries.emp_no

/* 9. Report */
SELECT DISTINCT employees.first_name, employees.last_name, employees.birth_date, employees.gender, employees.hire_date, titles.title, salaries.salary, salaries.to_date FROM employees 
JOIN titles ON titles.emp_no = employees.emp_no 
JOIN salaries ON salaries.emp_no = employees.emp_no 
WHERE salaries.to_date = (SELECT MAX(salaries.to_date) FROM salaries) 
ORDER BY `salaries`.`to_date` DESC;

