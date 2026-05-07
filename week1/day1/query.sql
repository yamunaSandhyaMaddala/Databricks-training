1.	Select all columns from the Employee table.
A.  select * from Employee

2.	Select only the  name  and  salary  columns from the Employee table.
A.  select name, salary from Employee

3.	Select employees who are older than 30.
A.  select * from Employee where age>30

4.	Select the names of all departments.
A.  select name from Department

5.	Select employees who work in the IT department.
A.  select e.name from Employee e 
    where(e.department_id=(select department_id from Department d where name = 'IT' ))

6.	Select employees whose names start with 'J'.
A.  select name from Employee where(name like 'J%')

7.	Select employees whose names end with 'e'.
A.  select name from Employee where(name like '%e')

8.	Select employees whose names contain 'a'.
A.  select name from Employee where(name like '%a%')

9.	Select employees whose names are exactly 9 characters long.
A.  select name from Employee where length(name)=9   
    

10.	Select employees whose names have 'o' as the second character.
A.  select name from Employee where name like '_o%'

11.	Select employees hired in the year 2020.
A.  select name from Employee where year(hire_date)=2020

12.	Select employees hired in January of any year.
A.  select name from Employee where month(hire_date)=01

13.	Select employees hired before 2019.
A.  select name from Employee where year(hire_date)<2019

14.	Select employees hired on or after March 1, 2021.
A.  select name from Employee where hire_date >= '2021-03-01'

15.	Select employees hired in the last 2 years.
A.  select name from Employee where hire_date>=  CURDATE() - INTERVAL 2 YEAR;

16.	Select the total salary of all employees.
A.  select sum(salary) from Employee

17.	Select the average salary of employees.
A.  select avg(salary) from Employee

18.	Select the minimum salary in the Employee table.
A.  select min(salary) from Employee

19.	Select the number of employees in each department.
A.  SELECT d.name, COUNT(e.emp_id) AS employee_count
    FROM Department d
    LEFT JOIN Employee e
    ON d.department_id = e.department_id
    GROUP BY d.name;

20.	Select the average salary of employees in each department.
A.  SELECT d.name, avg(salary) AS employee_avg_salary
    FROM Department d
    LEFT JOIN Employee e
    ON d.department_id = e.department_id
    GROUP BY d.name;

21.	Select the total salary for each department.
A.  select d.name, sum(e.salary) from Department d
    left join Employee e
    on e.department_id = d.department_id
    group by d.name

22.	Select the average age of employees in each department.
A.  select d.name, avg(e.age) from Department d
    left join Employee e
    on e.department_id = d.department_id
    group by d.name

23.	Select the number of employees hired in each year.
A.  select year(hire_date) as years_hired, count(*) as count_emp from Employee
    group by year(hire_date)

24.	Select the highest salary in each department.
A.  select d.name,max(e.salary) as highest_salary from Department d
    left join Employee e
    on e.department_id = d.department_id
    group by d.name;

25.	Select the department with the highest average salary.
A.  select d.name, max(e.salary) as highest_salary
    from Department d
    left join Employee e
    on e.department_id = d.department_id
    group by d.name
    having max(e.salary) = (
        select max(salary)
        from Employee
    )

26.	Select departments with more than 2 employees.
A.  SELECT d.name from Department d
    left join Employee e
    on e.department_id = d.department_id
    group by d.name
    having count(e.emp_id)>2

27.	Select departments with an average salary greater than 55000.
A.  SELECT d.name from Department d
    left join Employee e
    on e.department_id = d.department_id
    group by d.name
    having avg(e.salary)>55000

28.	Select years with more than 1 employee hired.
A.  select year(hire_date) as hired from Employee
    group by hired
    having count(hired)>1

29.	Select departments with a total salary expense less than 100000.
A.  select d.name from Department d
    left join Employee e
    on e.department_id = d.department_id
    group by d.name
    having sum(e.salary)<100000

30.	Select departments with the maximum salary above 75000.
A.  select d.name from Department d
    left join Employee e
    on e.department_id = d.department_id
    group by d.name
    having max(e.salary)>75000

31.	Select all employees ordered by their salary in ascending order.
A.  select * from Employee order by salary

32.	Select all employees ordered by their age in descending order.
A.  select * from Employee order by age desc

33.	Select all employees ordered by their hire date in ascending order.
A.  select * from Employee order by hire_date

34.	Select employees ordered by their department and then by their salary.
A.  select * from Employee order by department_id, salary

35.	Select departments ordered by the total salary of their employees.
A.  select d.name,sum(e.salary) as total_salary 
    from Department d
    join Employee e
    on e.department_id = d.department_id
    group by d.name
    order by total_salary

36.	Select employee names along with their department names.
A.  select e.name as Employee_name,d.name as Department_name
    from Department d
    join Employee e
    on e.department_id = d.department_id

37.	Select project names along with the department names they belong to.
A.  select p.name as Project_name,d.name as Department_name
    from Department d
    join Project p
    on p.department_id = d.department_id

38.	Select employee names and their corresponding project names.
A.  select e.name as Employee_name,p.name as Project_name
    from Project p
    join Employee e
    on e.department_id = p.department_id

39.	Select all employees and their departments, including those without a department.
A.  select e.name as Employee_name,d.name as Department_name
    from Employee e
    Left join Department d 
    on e.department_id = d.department_id

40.	Select all departments and their employees, including departments without employees.
A.  select d.name as Department_name,e.name as Employee_name
  from Department d
  Left join Employee e 
  on e.department_id = d.department_id

