exec charsep_07 @strname='Dinesh karthik',@s1=5,@e1=7

Alter proc [dbo].[charsep_07]
( @strname varchar(max),
@s1 INT,
@e1 INT
) as 
Begin
Declare @name varchar(max),
@val int
set @val=(@e1-@s1)+1
select @name=(select substring(@strname,@s1,@val)) 

select @name

DECLARE @Total INT = LEN(@name)
DECLARE @Counter INT = @Total

WHILE @Counter >= 1
BEGIN

    IF  @Counter + 1 <= @Total
    BEGIN
        SET @name = STUFF(@name, @Counter + 1, 0, ', ')
    END

    SET @Counter = @Counter - 1
END

--SELECT @name

select Item from  dbo.splitstrings(@name,',')
End
