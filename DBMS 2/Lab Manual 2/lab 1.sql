--1. Create INSERT, UPDATE & DELETE Stored Procedures for Person table

ALter Proc PR_Person_Insert
		@PersonID		Int, 
		@PersonName		Varchar (50), 
		@Salary			Decimal (8,2),
		@JoiningDate	Datetime,
		@City			Varchar (100),
		@Age			Int,
		@BirthDate		Datetime 
AS
INSERT INTO Person
SELECT 
@PersonID,@PersonName,@Salary,@JoiningDate,@City,@Age,@BirthDate;

Create Proc PR_Person_Update
		@PersonID		Int, 
		@PersonName		Varchar (50), 
		@Salary			Decimal (8,2),
		@JoiningDate	Datetime,
		@City			Varchar (100),
		@Age			Int,
		@BirthDate		Datetime 
AS
UPDATE Person SET
		PersonName	= @PersonName,		
		Salary		= @Salary,	
		JoiningDate	= @JoiningDate,	
		City		= @City,			
		Age			= @Age,			
		BirthDate	= @BirthDate
	Where PersonID  = @PersonID;


Create Proc PR_Person_Delete
		@PersonID Int
AS
DELETE FROM Person where 
 PersonID = @PersonID;

-- 2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the Person table. For that,
--create a new table PersonLog to log (enter) all operations performed on the Person table.

CREATE Trigger TR_Person_INSERT_AFTER
ON PERSON
FOR INSERT
AS
BEGIN
	Declare @PersonName  Varchar(250),@PersonId Int
	SELECT @PersonName = PersonName FROM Inserted
	SELECT @PersonId  = PersonId FROM Inserted
	INSERT into PersonLog
	SELECT @PersonId,@PersonName,'INSERT',getdate();
END
EXEC PR_Person_Insert 1,'Jenil',25000,'2020-01-01','rajkot',20,'2004-01-22';

Select *From Person
Select *From PersonLog 
DELETE FROM  Person where PersonID = 1


CREATE Trigger TR_Person_DELETE_AFTER
ON PERSON
FOR DELETE
AS
BEGIN
	Declare @PersonName  Varchar(250),@PersonId Int
	SELECT @PersonName = PersonName FROM deleted
	SELECT @PersonId  = PersonId FROM deleted
	INSERT into PersonLog
	SELECT @PersonId,@PersonName,'DELETE',getdate();
END

DELETE FROM Person_Info where PersonId = 1;
Select *From Person
Select *From PersonLog 

CREATE Trigger TR_Person_UPDATE_AFTER
ON PERSON
FOR UPDATE
AS
BEGIN
	Declare @PersonName  Varchar(250),@PersonId Int
	SELECT @PersonName = PersonName FROM Inserted
	SELECT @PersonId  = PersonId FROM Inserted
	INSERT into PersonLog
	SELECT @PersonId,@PersonName,'UPDATE',getdate();
END

EXEC PR_Person_Insert 1,'Jenil',25000,'2020-01-01','rajkot',20,'2004-01-22';
Update person set PersonName = 'GAJJAR' where PersonId = 1
Select *From Person
Select *From PersonLog 


--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Person
--table. For that, log all operation performed on the Person table into PersonLog.

CREATE Trigger TR_Person_INSERT_INSTEAD_OF
ON PERSON
INSTEAD OF INSERT
AS
BEGIN
	Declare @PersonName  Varchar(250),@PersonId Int
	SELECT @PersonName = PersonName FROM Inserted
	SELECT @PersonId  = PersonId FROM Inserted
	INSERT into PersonLog
	SELECT @PersonId,@PersonName,'INSERT',getdate();
END
EXEC PR_Person_Insert 1,'Jenil',25000,'2020-01-01','rajkot',20,'2004-01-22';
Select *From Person
Select *From PersonLog

CREATE Trigger TR_Person_DELETE_INSTEAD_OF
ON PERSON
INSTEAD OF DELETE
AS
BEGIN
	Declare @PersonName  Varchar(250),@PersonId Int
	SELECT @PersonName = PersonName FROM deleted
	SELECT @PersonId  = PersonId FROM deleted
	INSERT into PersonLog
	SELECT @PersonId,@PersonName,'DELETE',getdate();
END
DELETE FROM Person where PersonId = 1;
Select *From Person
Select *From PersonLog



CREATE Trigger TR_Person_UPDATE_INSTEAD_OF
ON PERSON
INSTEAD OF UPDATE
AS
BEGIN
	Declare @PersonName  Varchar(250),@PersonId Int
	SELECT @PersonName = PersonName FROM Inserted
	SELECT @PersonId  = PersonId FROM Inserted
	INSERT into PersonLog
	SELECT @PersonId,@PersonName,'UPDATE',getdate();
END

EXEC PR_Person_Insert 1,'Jenil',25000,'2020-01-01','rajkot',20,'2004-01-22';
Update person set PersonName = 'GAJJAR' where PersonId = 1
Select *From Person
Select *From PersonLog


DROP TRIGGER  TR_Person_INSERT_INSTEAD_OF
DROP TRIGGER  TR_Person_INSERT_AFTER
DROP TRIGGER  TR_Person_DELETE_AFTER

--4. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints
--‘Record deleted successfully from PersonLog’.

CREATE TRIGGER TR_PersonLog_Delete
On PersonLog
For DELETE
AS
BEGIN
	PRINT ('Record deleted successfully from PersonLog')
END

Delete from PersonLog where PersonName = 'GAJJAR';
SELECT * FROM PersonLog  

--5. Create INSERT trigger on person table, which calculates the age and update that age in Person table
CREATE TRIGGER TR_person_INSERT
ON PERSON
FOR INSERT
AS
BEGIN
	DECLARE @PersonId Int,@BirthDate DateTime
	SELECT @PersonId = PersonId From inserted
	SELECT @BirthDate  = BirthDate  From inserted
	Update Person set Age = DATEDIFF(Year,@BirthDate ,getdate())
	Where PersonId = @PersonId
END;

EXEC PR_Person_Insert 1,'nevil',25000,'2000-01-01','rajkot',-20,'2000-01-22';
EXEC PR_Person_Insert 2,'hardik',25000,'2010-01-01','rajkot',0,'2010-01-22';

Select *From Person
Truncate table Person