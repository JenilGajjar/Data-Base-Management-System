--1. All tables Insert,update,delete 
Create Procedure PR_Insert_Person
@FirstName			 Varchar(100),
@LastName			 Varchar(100),
@Salary				 Decimal(8,2),
@JoiningDate		 DateTime,
@DepartmentID		 Int,
@DesignationID		 Int
AS
Insert Into Person(
FirstName,		
LastName,	
Salary,			
JoiningDate,	
DepartmentID,	
DesignationID	
)
Values( 
@FirstName,		
@LastName,		
@Salary,		
@JoiningDate,	
@DepartmentID,	
@DesignationID	
);

Create Procedure PR_Insert_Department
@DepartmentID		 Int,
@DepartmentName		 Varchar(100)
AS
Insert Into Department
select  @DepartmentID,@DepartmentName;

Create Procedure PR_Insert_Designation
@DesignationID		 Int,
@DesignationName	 Varchar(100)
AS
Insert Into Designation
select  @DesignationID,@DesignationName;


Create Procedure Pr_Update_Person
@WorkerId			 Int,
@FirstName			 Varchar(100),
@LastName			 Varchar(100),
@Salary				 Decimal(8,2),
@JoiningDate		 DateTime,
@DepartmentID		 Int,
@DesignationID		 Int
as
Update Person 
set		
FirstName		=@FirstName,		
LastName		=@LastName,		
Salary			=@Salary,			
JoiningDate		=@JoiningDate,	
DepartmentID	=@DepartmentID,	
DesignationID	=@DesignationID	
where WorkerId=@WorkerId;

Create Procedure PR_Update_Department
@DepartmentID		 Int,
@DepartmentName		Varchar(100)
AS
Update Department 
set DepartmentName = @DepartmentName
where DepartmentID = @DepartmentID;

Create Procedure PR_Update_Designation
@DesignationtID		 Int,
@DesignationName	 Varchar(100)
AS
Update Designation 
set DesignationName = @DesignationName
where DesignationID = @DesignationtID;



Create Proc PR_Delete_Person
@WorkerId Int
As
Delete From Person 
where WorkerId = @WorkerId

Create Proc PR_Delete_Department
@DepartmentId Int
As
Delete From Department
where DepartmentId = @DepartmentId

Create Proc PR_Delete_Designation
@DesignationId Int
As
Delete From Designation
where DesignationId= @DesignationId

--All tables SelectAll (If foreign key is available than do write join and take columns on select list)
Create proc PR_SelectAll_Person
as	
Select WorkerID,FirstName,LastName,Salary,JoiningDate,P.DepartmentID,P.DesignationID,DesignationName,DepartmentName
 From Person P
		Inner Join Department D1
		On P.DepartmentId = D1.DepartmentId
		Inner Join Designation D2
		On P.DesignationId = D2.DesignationId		

Create Procedure PR_SelectAll_Department
as
Select *From Department

Create Procedure PR_SelectAll_Designation
as
Select *From Designation


--3. All tables SelectPK
Create Proc PR_SelectPK_Person
@WorkerID Int
as
Select *From Person
where WorkerID = @WorkerID

Create Proc PR_SelectPK_Department
@DepartmentID Int
as
Select *From Department
where DepartmentID = @DepartmentID

Create Proc PR_SelectPK_Designation
@DesignationID Int
as
Select *From Designation
where DesignationID= @DesignationID;

--Create Procedure that takes Department Name & Designation Name as Input and 
--Returns a table with Worker’s First Name, Salary, Joining Date & Department Name
 
 Create Proc PR_Table_Person
@DesignationName	 Varchar(100),
@DepartmentName      Varchar(100)
as
Select FirstName,Salary,JoiningDate,DepartmentName
 From Person P
		Inner Join Department D1
		On P.DepartmentId = D1.DepartmentId
		Inner Join Designation D2
		On P.DesignationId = D2.DesignationId
		where DesignationName=@DesignationName and DepartmentName = @DepartmentName;  

--Create Procedure that takes FirstName as an input parameter and displays’ all the details of 
--the worker with their department & designation name.
Create proc PR_SelectByFirstName_Person
@FirstName varchar(100)
as	
Select WorkerID,FirstName,LastName,Salary,JoiningDate,P.DepartmentID,P.DesignationID,DesignationName,DepartmentName
 From Person P
		Inner Join Department D1
		On P.DepartmentId = D1.DepartmentId
		Inner Join Designation D2
		On P.DesignationId = D2.DesignationId	
		where FirstName = @FirstName

--Create Procedure which displays department wise maximum, minimum & total salaries.

Create Proc PR_Max_Min_total_Department
as
Select D.Departmentname,Max(salary) as Max_sal,Min(salary) as Min_sal,Sum(salary) as Total
	From Person p
	Inner Join Department D
	On P.DepartmentId = D.departmentId
	Group By Departmentname