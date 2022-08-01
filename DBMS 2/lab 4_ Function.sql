--1. Create a table valued function which accepts DepartmentID as a parameter & returns a worker 
--table based on DepartmentID.
	Alter Function Worker_By_DepartmentID
	(
		@DepartmentID Int
	)
	returns Table
	AS
	return 
	(
		Select FirstName From Person
	where DepartmentID = @DepartmentID
	)
	Select FirstName From  dbo.Worker_By_DepartmentID(2);

--2. Create a table valued function which returns a table with unique city names from worker table.

--3. Create a scalar valued function which accepts two parameters start date & end date, and returns a date difference in days.
	Create Function Date_Difference_In_Days
	(
		@Date1 DateTime,
		@Date2 DateTime
	)
	returns Varchar(50)
	As
	BEGIN
	Return 
	(
	 Select CAST (DATEDIFF(day,@Date1,@Date2) as varchar)
	)	
	END

	Select dbo.Date_Difference_In_Days('2022-07-31',GETDATE());
	Select GETDATE()
--4. Create a scalar valued function which accepts two parameters year in integer & month in integer and returns total days in passed month & year.
	Create Function Total_Days_In_A_Month
	(
		@Month Int,
		@Year Int
	)
	Returns Int
	AS
	BEGIN
		Declare @Date Date;
		set @Date = CONCAT(@Year,'-',@Month,'-','1');
		Return Day(EOMONTH(@Date)) 
	END
	Select dbo.Total_Days_In_A_Month(2,2012) as TotalDays;

--5. Create a scalar valued function which accepts two parameters year in integer & month in
--integer and returns first date in passed month & year

	Create Function First_Day_In_A_Month
	(
		@Month Int,
		@Year Int
	)
	Returns Date
	AS
	BEGIN
		Declare @Date Date;
		set @Date = CONCAT(@Year,'-',@Month,'-','1');
		Return (@Date) 
	END

	Select dbo.First_Day_In_A_Month(2,2012) as TotalDays;
