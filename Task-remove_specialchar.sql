declare @str varchar(100)
select @str='a&n$Y,,k*'
declare @d varchar(100),@i int
set @i=1
declare @t1 table (id int identity(1,1),fa varchar(100)) 

while(len(@str)>=@i)
begin
insert into @t1 (fa) 
select fa=substring(@str,@i,1) 
set @i+=1


--select @d
end
select * from @t1 where fa  like '%[a-z]%'					--'%[a-z]%'
