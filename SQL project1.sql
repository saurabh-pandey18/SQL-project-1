use employees;
select * from employees;


-- 1 list of employees by department
-- Question: Write a query to list all employees along with their respective department names. Include employee number, first name, last name, department number, and department name.
select  e.emp_no, e.first_name, e.last_name, d.dept_no, d.dept_name from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no;


-- 2. Current and Past Salaries of an Employee
-- Write a query to retrieve all the salary records of a given employee (by employee number). Include employee number, salary, from_date, and to_date.select 

select max(salary) from salaries
where emp_no = '10044';



use employees;
-- 3. Employees with Specific Titles
-- Question: Write a query to find all employees who have held a specific title (e.g., ‘Engineer’). Include employee number, first name, last name, and title.
select e.emp_no,e.first_name,e.last_name,title from employees as e
join titles as t
 on e.emp_no = t.emp_no ;
 
 -- 4.  Departments with Their Managers
 -- Question: Write a query to list all departments along with their current managers. Include department number, department name, manager’s employee 
--            number, first name, and last name.
select d.dept_no,d.dept_name,e.emp_no,e.first_name , e.last_name from departments as d
join
dept_manager as dm
on  d.dept_no = dm.dept_no
join employees as e on 
dm.emp_no = e.emp_no; 

-- 5.   Employee Count by Department
-- Question:  Write a query to count the number of employees in each department. Include department number, department name, and employee count.
select d.dept_no,dept_name,count(*) as emp_count from departments as d
join dept_emp as de 
on d.dept_no = de.dept_no
group by dept_no, dept_name ;

-- 6. Employees’ Birthdates in a Given Year
-- Question: Write a query to find all employees born in a specific year (e.g., 1953). Include employee number, first name, last name, and birth date.

select emp_no, first_name,last_name,birth_date from employees
where year(birth_date) = 1953;


-- 7. Employees Hired in the Last 5 Years
-- Question: Write a query to find all employees hired in the last 5 years. Include employee number, first name, last name, and hire date.

select emp_no,first_name,last_name,year(hire_date) from employees
where year(hire_date) > 1995;

-- 8. Average Salary by Department
-- Question: Write a query to calculate the average salary for each department. Include department number, department name, and average salary.

select d.dept_no,dept_name, avg(s.salary) as avg_salary from  departments as d
join dept_emp as de
on de.dept_no = d.dept_no
join salaries as s
on s.emp_no= de.emp_no
group by  d.dept_no,dept_name;


-- 9. Gender Distribution in Each Department
-- Question: Write a query to find the gender distribution (number of males and females) in each department. Include department number, department name, count of males, and count of females.

select d.dept_no, d.dept_name,
sum(case when e.gender = 'M' then 1 else 0 end) as male_count,
sum(case when e.gender = 'F' then 1 else 0 end) as female_count
from departments as d
join dept_emp as de 
on de.dept_no = d.dept_no
join employees as e on de.emp_no = e.emp_no
group by d.dept_no, d.dept_name ;

-- 10. Longest Serving Employees
-- Question: Write a query to find the employees who have served the longest in the company. Include employee number, first name, last name, and number of years served.

select emp_no, first_name last_name,
timestampdiff(year,hire_date,curdate()) as year_served
from employees
order by year_served desc 
limit 10;
