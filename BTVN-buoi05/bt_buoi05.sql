-- Cau 1 :
select Employee.name , Bonus.bonus
from Employee
left join Bonus on Bonus.empID = Employee.empId
where Bonus.bonus < 1000 or Bonus.bonus is null;

-- Cau 2 :
select e.employee_id
from Employees e
left join Salaries s on s.employee_id = e.employee_id
where s.salary is null
union
select s.employee_id
from Employees e
right join Salaries s on s.employee_id = e.employee_id
where e.name is null
order by employee_id;