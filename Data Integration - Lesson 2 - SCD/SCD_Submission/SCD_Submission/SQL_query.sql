/*List count of total number of unique employees tracked in EmployeePayHistorySCD? */
select count(distinct(EmployeeID)) as unique_Employee
from EmployeePayHistorySCD

/*What employee had the most pay changes? */
select EmployeeID,Emp_Name,total_change
from 
(select EmployeeID,concat(FirstName,' ',MiddleName,' ',LastName) as Emp_Name,count(EmployeeID) as total_change,
DENSE_RANK() over (order by count(EmployeeID) desc)  as rnk
from EmployeePayHistorySCD
group by EmployeeID,FirstName,MiddleName,LastName
)base
where base.rnk=1

/*How many rows in EmployeePayHistorySCD? */

select count(*)
from EmployeePayHistorySCD


/*What was the employee(s) with the first pay rate recorded?*/
select EmployeeID,Emp_Name,rate
from 
(select EmployeeID,concat(FirstName,' ',MiddleName,' ',LastName) as Emp_Name,rate,min ([scd_effective_date]) as min_date,
DENSE_RANK() over (order by min ([scd_effective_date]) asc)  as rnk
from EmployeePayHistorySCD
group by EmployeeID,FirstName,MiddleName,LastName,rate
)base
where base.rnk=1

/*What was the employee(s) with the last recorder pay rate recorded?*/
select EmployeeID,Emp_Name,rate
from 
(select EmployeeID,concat(FirstName,' ',MiddleName,' ',LastName) as Emp_Name,rate,max ([scd_effective_date]) as min_date,
DENSE_RANK() over (order by max ([scd_effective_date]) asc)  as rnk
from EmployeePayHistorySCD
group by EmployeeID,FirstName,MiddleName,LastName,rate
)base
where base.rnk=1

/*total number of pay increases including original pay*/
select EmployeeID,concat(FirstName,' ',MiddleName,' ',LastName) as Emp_Name, count(EmployeeID) as Total_Change
from EmployeePayHistorySCD
group by EmployeeID,FirstName,MiddleName,LastName

/*a detailed listing employee, pay and scd start and scd end date*/
select EmployeeID,concat(FirstName,' ',MiddleName,' ',LastName) as Emp_Name,[Rate]
      ,[scd_effective_date]
      ,[scd_ineffective_date]
	  from EmployeePayHistorySCD