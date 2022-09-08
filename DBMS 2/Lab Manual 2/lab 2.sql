--1. Print message like - Error Occur that is: Divide by zero error encountered

Begin Try
Select (1/0)
End Try
Begin Catch
	print ('Error Occur that is: Divide by zero error encountered')
End Catch

--2. Print error message in insert statement using Error_Message () function: Conversion failed converting datetime from character string.

Begin Try
	Select CONVERT(datetime,'2004-01-32')
End Try
Begin Catch
	select ERROR_MESSAGE() as msg
End Catch

Insert into PersonLog2 values(1,'Jenil','Insert','2022-02-28');
--3 Create procedure which prints the error message that “The PLogID is already taken. Try another one”.ALter proc PRLog2_Insert@PLogID				Int, 
@PersonName			Varchar(250), 
@Operation			Varchar (50), 
@UpdatedDate		DateTime
As
Begin
	Begin Try
		Insert Into PersonLog2 values(@PLogID,@PersonName,@Operation,@UpdatedDate)
	End Try
	Begin Catch
		print concat('The ', @PLogID , ' is already taken. Try another one')
	End Catch
End

exec PRLog2_Insert 2,'Nevil','Delete','2020-02-28'
select *from PersonLog2

--4 Create procedure that print the sum of two numbers: take both number as integer & handle exception 
--	with all error functions if any one enters string value in numbers otherwise print result.

Create Proc SumOFTwo
@a Varchar(50),
@b Int,
@Ans Int OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @Ans = @a + @b
	END TRY
	BEGIN CATCH
		SELECT 
		ERROR_LINE() AS  ERROR_LINE,
		ERROR_MESSAGE() AS ERROR_MESSAGE,
		ERROR_NUMBER() AS ERROR_NUMBER,
		ERROR_PROCEDURE() AS  ERROR_PROCEDURE,
		ERROR_SEVERITY()  AS ERROR_SEVERITY,
		ERROR_STATE() AS ERROR_STATE
	END CATCH
END
DECLARE  @r Int;
exec SumOFTwo 'a',3,@r output
print @r

--5. Throw custom exception using stored procedure which accepts PLogID as input & that throws 
--Error like no plogid is available in database

Alter Proc PersonLog_PlogId
@PLogID Int
AS
BEGIN
	IF EXISTS(Select *From PersonLog2 where PLogID= @PLogID)
		PRINT concat(@PLogID,' is Available')
	ELSE
		THROW 51234,'no plogid is available in database',1
END
PersonLog_PlogId 1

--6. Create cursor with name per_cursor which takes PLogID & PersonName as variable and produce 
--combine output with PLogID & Person Name.

Declare
@PLogId Int,
@PersonName VarChar(250);
Declare Person_Curor Cursor 
FOR 
	SELECT PlogId,PersonName From PersonLog2;
OPEN Person_Curor;
		FETCH NEXT From Person_Curor INTO
		@PLogId,@PersonName;
	WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT  CONCAT(@PlogId,' - ',@PersonName)
			FETCH NEXT From Person_Curor INTO
			@PLogID,@PersonName;
		END
CLOSE Person_Curor;
DEALLOCATE Person_Curor;


--7. Use Table Student (Id, Rno, EnrollmentNo, Name, Branch, University) - Create cursor that updates 
--enrollment column as combination of branch & Roll No. like SOE22CE0001 and so on. (22 is 
--admission year
Declare 
@Rno Int,
@Branch Varchar(50)
Declare PersonLog2_Cursor Cursor
For 
Select Rno,Branch From Student
OPEN PersonLog2_Cursor;
		FETCH NEXT From PersonLog2_Cursor INTO @Rno,@Branch
		while @@FETCH_STATUS = 0
		BEGIN
			UPDATE STUDENT SET EnrollmentNo = CONCAT('SOE22',@Branch,@Rno) WHERE Rno = @Rno
			FETCH NEXT From PersonLog2_Cursor INTO @Rno,@Branch
		END
	
CLOSE PersonLog2_Cursor;
DEALLOCATE PersonLog2_Cursor;

SELECT * FROM STUDENT