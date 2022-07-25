--1.Find all persons with their department name & code. 
	Select PersonName,DepartmentName,DepartmentCode From Person P
	Inner Join Department D
	On P.DepartmentID= D.DepartmentID;

--2. Give department wise maximum & minimum salary with department name.
	Select DepartmentName,MAX(salary) as Max_salary,MIN(salary) as Min_salary From Person P
	Inner Join Department D
	On P.DepartmentID= D.DepartmentID
	Group by DepartmentName;

--3. Find all departments whose total salary is exceeding 100000.
	Select DepartmentName,SUM(salary) Total From Person P
	Inner Join Department D
	On P.DepartmentID= D.DepartmentID
	Group by DepartmentName
	Having SUM(salary)>100000;

--4. Retrieve person name, salary & department name who belongs to Jamnagar city.
	Select PersonName,Salary,DepartmentName From Person P
	Inner Join Department D
	On P.DepartmentID= D.DepartmentID
	where City='Jamnagar';
	
--5. Find all persons who does not belongs to any department.

	SELECT Person.PersonName FROM Person 
	LEFT OUTER JOIN Department
	ON Person.DepartmentID=Department.DepartmentID
	WHERE Person.DepartmentID IS NULL

--6.Find department wise person counts.

	Select Count(PersonName) ,DepartmentName From Person
	Inner Join Department
	on Department.DepartmentID = Person.DepartmentID
	Group By DepartmentName 

--7. Find average salary of person who belongs to Ahmedabad city.
	Select City,avg(Salary) from Person
	where city = 'Ahmedabad'
	group by City
--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly.(In single column)

	Select CONCAT(PersonName ,' earns ',Salary,' from ',DepartmentName,' monthly') From Person
	Inner Join Department
	on Department.DepartmentID = Person.DepartmentID

--9. List all departments who have no persons.
	Select Department.DepartmentName from Person
	Inner Join Department
	on Department.DepartmentID = Person.DepartmentID
	Group By DepartmentName 
	Having Count(PersonID) =0 

--10. Find city & department wise total, average & maximum salaries.
	Select city,DepartmentName,AVG(Salary),MAX(Salary),MIN(Salary) From Person 
	Inner Join Department
	on Department.DepartmentID = Person.DepartmentID
	Group By City,DepartmentName
--11. Display Unique city names.
	Select Distinct City from Person

--12. List out department names in which more than two persons.
	Select Department.DepartmentName from Person
	Inner Join Department
	on Department.DepartmentID = Person.DepartmentID
	Group By DepartmentName 
	Having Count(PersonID)>2

--13. Combine person name’s first three characters with city name’s last three characters in single column.
		Select CONCAT(Left(PersonName,3),' ',RIGHT(PersonName,3) ) From Person 

--14. Give 10% increment in Computer department employee’s salary.
	update Person Set salary = Salary + salary * (0.1) 
	Where DepartmentID  =  (select DepartmentID From Department where DepartmentName = 'Computer');
	
	Select * From Person
--15. Display all the person name’s who’s joining dates difference with current date is more than 365 days.
	Select PersonName From Person 
	Where DATEDIFF(day,JoiningDate,Getdate()) >365