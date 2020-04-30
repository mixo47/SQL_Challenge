--1. List the following details of each employee: employee number, 
--last name, first name, gender, and salary.

select e.emp_no,e.last_name,e.first_name,e.gender,s.salary 
from employess as e 
inner join 
salaray as s 
on e.emp_no=s.emp_no;
--2. List employees  were hired in 1986.

select * from employess where to_char(hire_date,'YYYY')='1986';

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
select d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name,de.from_date,de.to_date from title as t
inner join employess as e on e.emp_no = t.emp_no
inner join dept_manager de ON de.emp_no = e.emp_no
inner join department as d on d.dept_no = de.dept_no;
select * from title
alter table title add column title varchar 
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select dept_emp.emp_no, employess.last_name, employess.first_name, department.dept_name
from dept_emp
inner join employess
on dept_emp.emp_no = employess.emp_no
inner join department
on dept_emp.dept_no = department.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
 select first_name,last_name 
 from employess
 where first_name ='Hercules'
 and last_name like'B%';
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employess.last_name, employess.first_name, department.dept_name
from dept_emp
inner join employess
on dept_emp.emp_no = employess.emp_no
inner join department
on department.dept_no = dept_emp.dept_no
where department.dept_name='Sales';
7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employess.last_name, employess.first_name, department.dept_name
 from dept_emp
 inner join employess
 on dept_emp.emp_no=employess.emp_no
 inner join department
 on dept_emp.dept_no = department.dept_no
 where department.dept_name = 'Sales' 
 or department.dept_name = 'Development';
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, 
count(last_name) as "freguency"
from employess
group by(last_name) 
order by 
count(last_name) desc