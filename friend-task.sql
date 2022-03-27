

--anth  
--moj
select left('ananth',5-3)
select iif(charindex('%a%','manoj')<>0,replace('*','manoj','a'),'aj')

declare @str1 varchar(100),@str2 varchar(100),@sub varchar(100)

select @str1='ananth',@str2='manoj'


declare @l1 int ,@l2 int
select @l1=len(@str1) ,@l2 =len(@str2)

if(@l1>@l2)
Begin
declare @i int =1
while (@i<=@l1)
begin 

select  @sub=substring((left(@str1,@l1-(@l1-@i))),@i,1)




--select charindex(@sub,@str2,'*')

set @i=@i+1
select @sub
end 
end 





















select iif( charindex('a','manoj')>0 ,replace('','manoj','*'),'manoj')


select charindex('a','manoj')

ananth

2






