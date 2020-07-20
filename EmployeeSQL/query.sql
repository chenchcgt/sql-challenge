-- #### Data Analysis

-- Once you have a complete database, do the following:

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select emp_no, last_name, first_name, sex, 
	(select salary from salaries as s
	 where e.emp_no = s.emp_no
 	 group by emp_no
	 )
from employees as e
order by emp_no asc;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date from employees
where hire_date >= '1986-01-01' and hire_date <='1986-12-31'
order by hire_date;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select  d.dept_no as "department number", d.dept_name as "department name", m.emp_no as "manager employee number", last_name, first_name from employees as e
join dept_manager as m
on m.emp_no = e.emp_no
join departments as d
on d.dept_no = m.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no as "employee number", last_name as "last name", first_name as "first name", dept_name as "department name" from employees as e
join dept_emp as de
on de.emp_no = e.emp_no
join departments as d
on d.dept_no = de.dept_no
order by e.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no as "employee number", last_name as "last name", first_name as "first name", dept_name as "department name" from employees as e
join dept_emp as de
on de.emp_no = e.emp_no
join departments as d
on d.dept_no = de.dept_no
where d.dept_no = 'd007'
order by e.emp_no;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no as "employee number", last_name as "last name", first_name as "first name", dept_name as "department name" from employees as e
join dept_emp as de
on de.emp_no = e.emp_no
join departments as d
on d.dept_no = de.dept_no
where d.dept_no = 'd007' or d.dept_no = 'd005'
order by e.emp_no;


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select count(last_name), last_name from employees
group by last_name
order by count(last_name) desc;
