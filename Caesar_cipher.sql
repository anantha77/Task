
--select * from CEcipher('PRAVEEN')
alter Function CEcipher
(
@Fname varchar(max)=''
) 
Returns @result  Table (Old_Name varchar(max),Result varchar(max))

as
Begin 

Declare @str varchar(max),@i int,@val1 char(1),@n1 int,@n2 char(1)
select @str=@Fname
set @i=1
while(len(@str)>=@i)
		Begin
			select @val1=right(left(@str,@i),1),
			 @n1=ascii(@val1) +3,
			 @n2 = char(@n1)
			insert into @result (old_name,Result) 
			select old_name=@val1,Result=@n2 
			set @i+=1
		End
Return 

End

