# 2. Rank departments with the lowest total spend on managers in the 1985 - 1995 period.
# Print: department, manager salaries paid

select d.dept_name as dept, sum(s.salary) as manager_salary_paid
from departments as d join dept_manager as dm
on d.dept_no = dm.dept_no
join salaries as s on dm.emp_no = s.emp_no
where year(s.from_date) >= 1985 and year(s.to_date) <= 1995
group by dept_name
order by 2 ;