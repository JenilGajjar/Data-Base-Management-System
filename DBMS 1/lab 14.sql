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

--6