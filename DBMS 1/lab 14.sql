--1
DECLARE @no Int
SET @no=1
	WHILE(@no<=10)
	BEGIN
		PRINT @no
		SET @no=@no+1
	END

--2
DECLARE @i Int
SET @i=9

	IF(@i%2=0)
	BEGIN
		PRINT 'EVEN'
	END
	ELSE
	BEGIN
		PRINT 'ODD'
	END

--3
DECLARE @n Int
SET @n=1
	WHILE(@n<=10)
	BEGIN
		if(@n%2!=0)
		BEGIN
			PRINT @n
		END
		SET @n = @n +1
	END

--4
DECLARE @Sum Int ,@a Int
SET @Sum=0 
SET @a =1
	WHILE(@a<=50)
		BEGIN
			SET @SUM = @Sum + @a
			SET @a = @a +1
		END
	PRINT @SUM

--5
DECLARE @num Int ,@esum Int 
SET @num=1
SET @esum=0
	WHILE (@num<=20)
		BEGIN
			IF(@num%2=0)
			BEGIN
				SET @esum =@esum + @num
			END
			SET @num = @num +1
		END
	PRINT @esum

--6DECLARE @x  Int, @j Int ,@flag IntSet @x=20Set @j=2Set @flag=1	While (@j<@x)		BEGIN		If(@X%@j=0)			BEGIN 				SET @flag =0				BREAk			END		ELSE			BEGIN				SET @flag=1			END		SET @j=@j+1	END	IF(@flag=0)		BEGIN			PRINT 'GIVEN NUMBER IS NOT PRIME'		END	ELSE		BEGIN			PRINT 'GIVEN NUMBER IS  PRIME'		END--7CREATE TABLE EvenNo(Number Int)CREATE TABLE OddNo(Number Int)DECLARE @number IntSET @number=1	WHILE(@number<=50)	BEGIN		IF(@number%2=0)			BEGIN				INSERT INTO EvenNo SELECT @number			END		ELSE			BEGIN				INSERT INTO OddNo SELECT @number			END			SET @number =@number +1	ENDSELECT Number As Even FROM EvenNo SELECT Number As ODD FROM OddNo