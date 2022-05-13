# 3. Rank employees with the highest growth in salary.
# Print: employee name, year of growth,department, salary growth, title during the growth
# note: if the salary for a person grew starting 1995 then the year growth is 1994.


select concat(e.first_name, ' ', e.last_name) as employee_name,e.emp_no,
       year(s.from_date) as year_of_growth,
	   d.dept_name as department,
	   #diff(lead(s.salary,1), s.salary) over (order by year(s.from_dt)) as salary_growth,
       s.salary - lag(s.salary) over (partition by year(s.from_date) order by year(s.from_date)) as salary_growth,
       t.title #over (order by t.from_date) as title
from employees as e join dept_emp as ed	on e.emp_no = ed.emp_no
     join departments as d on ed.dept_no = d.dept_no
	 join salaries as s on e.emp_no = s.emp_no 
	 join titles as t on s.emp_no = t.emp_no
	 where year(t.from_date) = year(s.from_date) 
group by emp_no;