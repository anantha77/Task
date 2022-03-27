--exec Chem_Formula '1234'
Alter proc Chem_Formula
( @str1 varchar(100)
)
As

declare @str varchar(100),@store varchar(100)=''
,@s_str varchar(100),@Totalvalue int=''
select @str = upper(@str1)
If(len(@str)<2 and @str between '0' and '9' )
		select ':( Please Provide Valid Inputs...' Final_OP
Else If(patindex('%[a-z]%',@str) = 0)
	select ' :( Please Provide Valid Inputs...' Final_OP
Else
	Begin
	Declare @i int = 1,@j int = 1
	declare @totalvalue1 varchar(20)
	select @totalvalue1 =left(@str,1) 
	/*Loop condition  Start*/
	DECLARE @strEnrollmentNumber VARCHAR(MAX) =@str-- 'SOE14CE13017'  
	DECLARE @intNumber INT    
	SET @intNumber = PATINDEX('%[^A-Za-z]%', @strEnrollmentNumber)    
	WHILE @intNumber > 0    
	  BEGIN  
		SET @strEnrollmentNumber = STUFF(@strEnrollmentNumber, @intNumber, 1, '' )    
		SET @intNumber = PATINDEX('%[^A-Za-z]%', @strEnrollmentNumber )    
	  END  
	--select len(@strEnrollmentNumber)
	/*Loop condition End*/

	If(patindex('%[0-9]%',@totalvalue1) > 0)
		Begin 
		select @totalvalue =substring(@str,1,patindex('%[a-z]%',@str)-1)
		End
	Else if(@Totalvalue=0) 
		Begin 
		set @Totalvalue=1
		End
	else
		Begin 
		set @Totalvalue=1
		End
	while(@i<=len(@str))
		Begin
			select @s_str=right(left(@str,@j),1)
			if  (patindex('%[a-z]%',@s_str) > 0)
			Begin
				select @store =concat(@store,','+@s_str)
			End
			else if  (patindex('%[0-9]%',@s_str) > 0)
			Begin 
				select @store=CONCAT(@store,@s_str)
			End
			set @j=@j+1
			set @i=@i+1
		End
	select @store=substring(@store,patindex('%[a-z]%',@store),len(@store))
	select @store  Revised_String
	---------------------------------------------PART - 02------------------------------
	select @totalvalue1 =left(@str,1) 
	if(patindex('%[0-9]%',@totalvalue1) > 0)
	Begin 
		select @totalvalue =substring(@str,1,patindex('%[a-z]%',@str)-1)
	End
	else 
		set @Totalvalue=1
	declare @store1 varchar(100)
	select @store1=@store 
	declare @finalstring varchar(100) = ''
	declare @k int =1, @sep0 varchar(20),@sep1 int
	declare @coms int,@separ varchar(100)
	while (@k<=len(@strEnrollmentNumber))
	Begin 
		Select @coms = charindex(',',@store1) --4
		,@separ = SUBSTRING(@store1,1,@coms) --a25,
		if(len(@separ)>=3)
		Begin
			select @sep0 = cast (left(@separ,1) as varchar)	--A
			select @sep1 = Convert(varchar, cast (substring(@separ,2,len(@separ)-2) as int ) * @Totalvalue)
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

		else if(len(@separ)>1)
		Begin
			select @sep0 = cast (left(@separ,1) as varchar)	
			select @sep1 =  convert(varchar,case when right(@separ,1) between '0' and '9' then convert(int,@separ) else convert (int ,1) End ) * @Totalvalue
			select @finalstring=concat(@finalstring,','+concat(@sep0+'-',cast(@sep1 as int)))
			select @store1=replace(@store1,@separ,'')
		End
		else 
		Begin
			select @sep0 = Convert(varchar,cast(case when left(@store1,1) between 'a' and 'z' then convert(varchar,left(@store1,1)) else '' end as varchar))
			select @sep1 = Convert(varchar,cast(case when right(left(@store1,2),1) between '0' and '9' then convert(int,substring(@store1,2,len(@store1))) else 1 end as int) * @Totalvalue)
			select @finalstring=concat(@finalstring,','+concat(@sep0+'-',cast(@sep1 as int)))
			select @store1=replace(@store1,@separ,'')
		End
	set @K=@k+1
	End
	--select @finalstring

	select stuff(@finalstring,1,1,'') Final_OP
End



