Create Table Student(
	Rno Int,
	Name Varchar(50),
	Branch Varchar(50)
)

Create Table Result
(
	Rno Int,

)

Insert Into Student Select 101,'Raju','CE'
Insert Into Student Select 102,'Amit','CE'
Insert Into Student Select 103,'Sanjay','ME'
Insert Into Student Select 104,'Neha','EC'
Insert Into Student Select 105,'Meera','EE'
Insert Into Student Select 106,'Mahesh','ME'



--1

Create Procedure spDisplayDetails
AS
Begin
	Select Student.Rno,Name,Branch,Spi From Student
	Full JOIN Result
	ON Student.Rno=Result.Rno
ENd
EXEC spDisplayDetails

--2

Create Procedure spGetDataByRNo
	@Rno INt
As
BEGIN
	Select *From Student
	Where Rno=@Rno
END
EXEC spGetDataByRNo 103

--3
Create Procedure spInsertDateIntoStudent
	@Rno Int,@Name Varchar (50), @Branch Varchar(50)
AS
BEGIN
	INSERT INTO Student SELECT @Rno,@Name,@Branch
END
EXEC spInsertDateIntoStudent 107,'Raj','EE'

--4
Create Procedure spUpdateStudent
	@Rno Int,@Branch Varchar(50)
AS
BEGIN
	Update Student set Branch=@Branch
	WHERE Rno=@Rno
END
EXEC spUpdateStudent 105,'EC'


--5
Create Procedure spDeleteDataFromStudent
	@Rno Int
AS
BEGIN
	DELETE FROM Student WHERE Rno=@Rno
END
EXEC spDeleteDataFromStudent 103