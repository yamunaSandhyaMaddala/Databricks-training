41.	Select employees who are not assigned to any project.
a:-select *
   from Employees e
   where not exists (
    select 1
    from employee_project ep
    where ep.employee_id = e.employee_id
);

42.	Select employees and the number of projects their department is working on.
A.  select e.name as Employee_name, count(p.project_id) as total_projects
    from Employee e
    Left join Project p 
    on e.department_id = p.department_id
    group by e.emp_id,e.name

43.	Select the departments that have no employees.
A.  select d.name as Department_name
    from Department d
    Left join Employee e
    on d.department_id = e.department_id
    where e.emp_id =null

44.	Select employee names who share the same department with 'John Doe'.
A.  select name from Employee
    where department_id = (
      	select department_id
      	from Employee
      	where name = 'john doe'
    )

45.	Select the department name with the highest average salary.
A.  select d.name, AVG(e.salary) AS avg_salary
    from Department d
    join Employee e
    on d.department_id = e.department_id
    group BY d.name
    order BY avg_salary desc
    limit 1

46.	Select the employee with the highest salary.
A.  select name, salary from Employee
    where salary = (
      select max(salary) from Employee
    )

47.	Select employees whose salary is above the average salary.
A.  select name, salary from Employee
    where salary > (
      select avg(salary) from Employee
      )

48.	Select the second highest salary from the Employee table.
A.  select max(salary) from Employee
    where salary < (
      select max(salary) from Employee
      )

49.	Select the department with the most employees.
A.  

50.	Select employees who earn more than the average salary of their department.
A.  select e.name
    from Employee e
    where e.salary > (
        select avg(salary)
        from Employee
        where department_id = e.department_id
    )

51.	Select the nth highest salary (for example, 3rd highest).
A.  select max(salary) from Employee
    where salary<(
      select max(salary) from Employee
      where salary<(
        select max(salary) from Employee
      )
    )

52.	Select employees who are older than all employees in the HR department.
A.  select name from Employee
    where age >(
      select max(age) from Employee
      where department_id = (
        select department_id from Department
        where name = 'HR'
      )
    )

53.	Select departments where the average salary is greater than 55000.
A.  select d.name from Department d
    join Employee e
    on e.department_id = d.department_id
    group by d.name
    having avg(e.salary)>55000

54.	Select employees who work in a department with at least 2 projects.
A.  select e.name from Employee e
    where e.department_id in (
        select department_id from Project
        group by department_id
        having count(project_id) >= 2
    )

55.	Select employees who were hired on the same date as 'Jane Smith'.
A.  select name from Employee
    where hire_date = (
      select hire_date from Employee
      where name = 'Jane Smith'
    )

56.	Select the total salary of employees hired in the year 2020.
A.  select sum(salary) from Employee
    where year(hire_date)=2020

57.	Select the average salary of employees in each department, ordered by the average salary in descending order.
A.  select d.name, avg(e.salary) from Department d
    join Employee e
    on e.department_id = d.department_id
    group by d.name
    order by avg(e.salary) desc

58.	Select departments with more than 1 employee and an average salary greater than 55000.
A.  select d.name from Department d
    join Employee e
    on e.department_id = d.department_id
    group by d.name
    having avg(e.salary) >55000 and count(e.emp_id)>1

59.	Select employees hired in the last 2 years, ordered by their hire date.
A.  select * from Employee
    where hire_date = curdate() - interval 2 year
    order by hire_date

60.	Select the total number of employees and the average salary for departments with more than 2 employees.
A.  select d.name, count(e.emp_id), avg(e.salary) from Department d
    join Employee e
    on d.department_id = e.department_id
    group by d.name
    having count(e.emp_id)>2

61.	Select the name and salary of employees whose salary is above the average salary of their department.
A.  select name,salary from Employee e
    where salary > (
      select avg(salary) from Employee
      where department_id = e.department_id
      )

62.	Select the names of employees who are hired on the same date as the oldest employee in the company.
A.  select name from Employee
    where hire_date = (
      select hire_date from Employee
      where age = (
        select max(age) from Employee
        )
      )

63.	Select the department names along with the total number of projects they are working on, ordered by the number of projects.
A.  select d.name, count(p.project_id) from Department d
    join Project p
    on d.department_id = p.department_id
    group by d.name
    order by count(p.project_id)

64.	Select the employee name with the highest salary in each department.
A.  select d.name as Department_name,e.name as Employee_name, e.salary 
    from Employee e
    join Department d
    on e.department_id = d.department_id
    where (e.department_id,e.salary) in (
      select department_id,max(salary) from Employee
      group by department_id
      )

65.	Select the names and salaries of employees who are older than the average age of employees in their department.
A.  select name, salary from Employee e
    where age > (
      select avg(age) from Employee
      where department_id = e.department_id
      )
