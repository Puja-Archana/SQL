# 4. Rank titles that have attracted the most salary over all the years.
# Print: title, salary, year, employee name who got this salary


select t.title,
       max(s.salary) over (partition by t.title order by s.salary) as Salary,
	   year(s.from_date) as Year, concat(e.first_name,' ',e.last_name) as Emplyee_name
from salaries as s join employees as e
on s.emp_no = e.emp_no
join titles as t on e.emp_no = t.emp_no;	   
	   