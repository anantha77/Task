declare @val nvarchar (max)
set @val = ''

select @val = 
    case when @val = ''
    then isnull(SancNo,'')
    else @val +
	 coalesce(',' + sancno,'')
    end 
  from LOS_SancInfoMain -- where SancNo in ('ADYA1TW1908030004','ADYA1TW1908030005','ADYA1TW1908050006','ADYA1TW1908050007','ADYA1TW1908050008')

select  @val List_of_Value

--declare @r varchar(max)
--select  coalesce( sancno,'') from LOS_SancInfoMain
--select @r


declare @val1 varchar(max)
select @val1= 'select SancNo from LOS_SancCustDetails where Gender=''F''and PerState=''New Delhi'' '
select @val1

exec (@val1)
