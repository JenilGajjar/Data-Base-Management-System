--1. Create a view that display first 100 workers details.
	Create view vw_worker_top_100
	as 
	select top 100 * From person;
	Select * From vw_worker_top_100

--2. Create a view that displays designation wise maximum, minimum & total salaries.
	Create view vw_designation_max_min_total_salary
	as
	Select DesignationName,Max(Salary) [Max Salary],MIN(Salary) [Min Salary],SUM(Salary) [Total Salary] 
	From person
	Inner Join Designation
	on person.DesignationId = Designation.Designationid
	Group By DesignationName;
	Select *From vw_designation_max_min_total_salary
	
--3. Create a view that displays Worker’s first name with their salaries & joining date, it also displays 
	--duration column which is difference of joining date with respect to current date.

	Create View vw_worker_info
	as
	Select FirstName,Salary,JoiningDate,DATEDIFF(year,JoiningDate,Getdate()) [Experiance] From Person
	Select * From vw_worker_info

--4. Create a view which shows department & designation wise total number of workers.
	Create View vw_Total_workers_department_designation	as	Select DepartmentName,DesignationName,COUNT(WorkerID)  [Total workers] From Person P	Inner Join  Department D1	on P.DepartmentID=D1.DepartmentId	Inner Join Designation D2	on P.DesignationID = D2.DesignationID	Group by DepartmentName,DesignationName;	Select *From vw_Total_workers_department_designation--5. Create a view that displays worker names who don’t have either in any department or designation.	Create View vw_woker_NoDepaetment_NoDesigantion	as	Select FirstName from Person	where DepartmentID is null OR DesignationID is null	Select *From vw_woker_NoDepaetment_NoDesigantion	