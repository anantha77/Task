------------------------------------------------------------------------------------------------
declare @store varchar(100)
declare @str varchar(100)
declare @Totalvalue int =''
select @str = 'abcde'

----
declare @totalvalue1 varchar(20)
select @totalvalue1 =left(@str,1) 
--select patindex('%[a-z]%','5643hj')
if(patindex('%[0-9]%',@totalvalue1) > 0)
Begin 

select @totalvalue =substring(@str,1,patindex('%[a-z]%',@str)-1)

select @totalvalue

End
else 
set @Totalvalue=1

------------
select @store='a,b,c,d,e'
declare @store1 varchar(100)
select @store1=@store 
declare @finalstring varchar(100) = ''
--select charindex(',','a25,b,c,d2,e')

--select substring('a25,',1,4)
declare @k int =1, @sep0 varchar(20),@sep1 int
declare @coms int,@separ varchar(100)
while (@k<=5)
Begin 
Select @coms = charindex(',',@store1) --4
,@separ = SUBSTRING(@store1,1,@coms) --a25,
if(len(@separ)>=3)
Begin
--select @separ
--select left(right('b,',2),len('b,')-1)
select @sep0 = cast (left(@separ,1) as varchar)	--A
select @sep1 = Convert(varchar, cast (substring(@separ,2,len(@separ)-2) as int ) * @Totalvalue)
--select @sep0,@sep1

select @finalstring=concat(@finalstring,','+concat(@sep0+'-',cast(@sep1 as int)))

select @store1=replace(@store1,@separ,'')
End
else if(len(@separ)>2)
Begin
select @sep0 = cast (left(@separ,1) as varchar)	--b
select @sep1 = Convert(varchar, cast (substring(@separ,2,len(@separ)-1) as int ) * @Totalvalue)
select @finalstring=concat(@finalstring,','+concat(@sep0+'-',cast(@sep1 as int)))
select @store1=replace(@store1,@separ,'')
End
else 
Begin
select @sep0 = left(@store1,1)	
,@sep1 = convert(varchar,len(@sep0) * @TotalValue)
select @finalstring=concat(@finalstring,','+concat(@sep0+'-',cast(@sep1 as int)))
select @store1=replace(@store1,@separ,'')
End
set @K=@k+1
End
select @finalstring

