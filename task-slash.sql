
declare @string varchar(max)='\\\//'
declare @m int,@c1 int

select @string=reverse(@string)
select @m = PATINDEX ( '%[a-z]%',@string)
select @m = case when @m=0 then null  else @m  end  


				

--select  @m
  select @c1=len(@string)-len(@m)

 -- select substring(@string,@m,@c1) 

select @string = reverse (substring(@string,@m,@c1+1))
select @string



--declare @str varchar(max)='/a/n/a/n///'
--select @str=REVERSE(@str)
--declare @s_str varchar(200)
--set @s_str= 'n'--@str>='a' and @str<='z'
--select CHARINDEX(@s_str,@str) g 
--if(@str>='a'and @str<='z')
--begin 
--end
--select @s_str
----select @str
--declare @n int
--set @n=5
--while(@n>1)
--declare @i int =1
--select left('/n/ana/a',@i)
--set @i+=1
--set @n-=1
--declare @str1 varchar(50)='///n/a/an'
--	--
--	declare @l int ,@l1 int,@str2 varchar(20)
--	set @l=len(@str1)
--	--set @l1=@l
--while(@l>=1)
--begin
--	declare @i int,@a2 varchar(20)
--		if @str1='/'
--		begin
--		select @str2=left(@str1,@i)
--		set @i+=1

--		select @str2
--		End
--		select @str2
----select @l
--set @l=@l-1
--end

--if (@str1='/')
--Begin
--select @str1=left(@str1,'1')
--	select @str1
--set @l=@l-1
--End
--else 
--select @str1
--declare @a1 varchar(10),@r1 int
--set @a1='//n/an/a' set @r1= len(@a1)
--while(@r1>1)
--Begin 
--declare @i int=1,@a2 varchar(20)
--		if @a1='/'
--		begin
--		select @a2=left(@a1,@i)
--		set @i+=1
--		select @a2
--		End
--set @r1-=1
--End
--declare @str2 int = (select CHARINDEX())

