# 1. Rank departments in running cost for a 5 year period from the year 1990 to 1995.
# Print: department, running cost

select d.dept_name as dept, sum(s.salary) as runningcost
from departments as d join dept_emp as dm
on d.dept_no = dm.dept_no
join salaries as s on dm.emp_no = s.emp_no
where year(s.from_date) >= 1990 and year(s.to_date) <= 1995
group by dept_name
order by 2 desc;
#---------------------------------------------------------------------------

