Create Database [Jenil 21010101063];
USE [Jenil 21010101063];

--1. Select All  CityID, CityName, Pincode, CityRemarks, StateID, StateName
	Create Procedure PR_MST_City_SelectAll
	AS
	BEGIN
	Select CityID, CityName, Pincode, CityRemarks, MST_City.StateID, StateName From MST_City
	INNER JOIN State
	ON MST_City.StateId=State.StateID
	END



--2. Insert

Create Proc PR_MST_City_Insert
@CityID				Int,
@CityName			Varchar(250),
@Pincode			Varchar(6),
@StateID			Int,
@CityRemarks		Varchar(500)
AS
BEGIN

Insert Into MST_City(CityID,CityName,Pincode,StateID,CityRemarks)
	SELECT @CityID,@CityName,@Pincode,@StateID,@CityRemarks
END		

PR_MST_City_Insert 6,'Patan','360101',6,'Good';

--3. Update  
Create Proc PR_MST_City_Update
@CityID				Int,
@CityName			Varchar(250),
@Pincode			Varchar(6),
@StateID			Int,
@CityRemarks		Varchar(500)
	AS
	BEGIN
		Update MST_City set 
			CityName=@CityName,
			Pincode=@Pincode,
			StateID=@StateID,
			CityRemarks=@CityRemarks
		Where CityID=@CityID
	END

PR_MST_City_Update 6,'Patan','360101',6,'Very Good';

--4. Delete  
	Create Proc PR_MST_City_Delete
	@CityId Int 
	AS
		BEGIN
			Delete From MST_City where CityId=@CityId
		ENd

	PR_MST_City_Delete 6

--5. SelectByPK
	Create Procedure PR_MST_City_SelectByPK
	@CityId Int 
	AS
		BEGIN
			Select * From MST_City Where CityId=@CityId
		End


--6. SelectByPincodeStartWith360
	Create Procedure PR_MST_City_SelectByPincodeStartWith360
	AS
		BEGIN
			Select * From MST_City Where Pincode like '360%'
		End

	PR_MST_City_SelectByPincodeStartWith360


--7. SelectByCityNamePincode
	Create Proc PR_MST_City_SelectByCityNamePincode
	@CityId		Int,
	@Pincode	Int
	AS
	BEGIN
		Select * From MST_City
		Where CityId=@CityId and Pincode=@Pincode
	End

	PR_MST_City_SelectByCityNamePincode 2,'360102';

--8. SelectByCityRemarks
	Create Procedure PR_MST_City_SelectByCityRemarks
	@CityRemarks Varchar(500)
	AS
		BEGIN
			Select * From MST_City Where CityRemarks=@CityRemarks
		End

PR_MST_City_SelectByCityRemarks 'Good'


--9. SelectByStateID
	Create Procedure PR_MST_City_SelectByStateID
	@StateID Int 
	AS
		BEGIN
			Select * From MST_City Where StateID=@StateID
		End

	PR_MST_City_SelectByStateID 2

10. SelectByStateIDCityID
	Create Procedure PR_MST_City_SelectByStateIDCityID
	@CityID	Int,
	@StateID Int 
	AS
		BEGIN
			Select * From MST_City Where StateID=@StateID and CityID=@CityID
		End

PR_MST_City_SelectByStateIDCityID  1,1