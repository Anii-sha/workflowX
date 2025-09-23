/*Problem Statement:

You are given an emp table containing employee details: emp_id, emp_name, salary, and manager_id. Each employee may have a manager, who is also listed in the same table.

Write a SQL query to display the following for each employee whose salary is greater than their manager's salary:

Employee ID
Employee Name
Manager Name
Employee Salary
Manager Salary
The output should list only those employees whose salary exceeds that of their manager.
*/

create table emp(emp_id int,
emp_name varchar(10),salary int ,
manager_id int);

insert into emp values(1,'Ankit',10000,4);
insert into emp values(2,'Mohit',15000,5);
insert into emp values(3,'Vikas',10000,4);
insert into emp values(4,'Rohit',5000,2);
insert into emp values(5,'Mudit',12000,6);
insert into emp values(6,'Agam',12000,2);
insert into emp values(7,'Sanjay',9000,2);
insert into emp values(8,'Ashish',5000,2);

select * from emp;

select a.emp_id, a.emp_name, 
a.salary as emp_salary, 
a.manager_id, 
b.salary as manger_salary,
b.emp_name
from emp a
inner join emp b
on a.manager_id = b.emp_id
where a.salary > b.salary
;
