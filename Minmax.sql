
--select * from Minmax('1,5,4,87,45','hi')

Alter Function Minmax
(@val1 varchar(max),
@val2 varchar(25)
)
 returns @Tbl Table(val int )

 as
Begin

	declare @table Table(Id int identity(1,1),val varchar(max))
		if exists(select val from @table )
		delete from @table

	insert into @table
	select Item from SplitString ('1,78,4,87,45',',') order by cast(item as int) 


	declare @countvalue int 
	select @countvalue = count(id) from @table

	Insert Into @Tbl
	select val  from @table where  case when @val2 like '%min%' Then  '1'

	declare @lowest int
		select @Lowest =  cast(val as int) from @table order by case when @val2 like '%min%' then  cast(val as int) Else  cast(val as int) End desc
		Insert Into @Tbl select @lowest

	--If(@val2 like '%Mi%') or (@val2 like '%sma%') or (@val2 like '%lo%')
	--Begin
	--	--declare @lowest int
	--	--select @Lowest =  cast(val as int) from @table order by   cast(val as int) desc
	--	--Insert Into @Tbl select @lowest
	--End

	--If(@val2 like '%Ma%') or (@val2 like '%hi%') or (@val2 like '%lar%')
	--Begin
	--	declare @high int
	--	select @high =  cast(val as int) from @table order by cast(val as int) 
	--	Insert Into @Tbl select @high
	--End
	Return 
End 


	




