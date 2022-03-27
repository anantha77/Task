declare @d1 int ='17', @N_Replicate varchar(100),@C_sep char(1),@STR_Replicate varchar(100),@F_rep varchar(100)
declare @r int =1,@s1 varchar(100),@s2 varchar(100)
Select @s1='FLAMES',@s2=@s1
select @N_Replicate=REPLICATE('FLAMES',(@d1/len(@s2)+1))
select @STR_Replicate=@N_Replicate
while(@r<=10)
begin
select @C_sep=substring(@STR_Replicate,@d1,1)
select @F_rep=substring(@STR_Replicate,@d1,len(@STR_Replicate))
if(len(@F_rep)<@d1)
select @F_rep=concat(@F_rep,replicate(@s1,((@d1/len(@s2)+1))))

select @STR_Replicate=replace(@F_rep,@C_sep,'')
select @s1=replace(@s1,@C_sep,'')
if(len(@STR_Replicate)<@d1)
select @STR_Replicate=replicate(concat(@STR_Replicate,@s1),@d1)

if(len(@s1)=1)
break
set @r=@r+1
end
select @r,@C_sep R2,@STR_Replicate R3,@F_rep R4,@s1 S1


--declare @s1 char(1)='F'

--select case when @s1 ='F' then N'FRIENDS - நட்பில் ஒன்றாக சேர்ந்திருப்போம்' 
--			when @s1 ='L' then N'LOVE - ' 
--			when @s1 ='A' then N'AFFECTION - ' 
--			when @s1 ='M' then N'MARRIAGE - ' 
--			when @s1 ='E' then N'ENEMY - ' 
--		    when @s1 ='S' then N'SISTER' else '' End N'உறவுகள் - Relationship'


		


--select @F_rep=substring(@STR_Replicate,@d1,len(@STR_Replicate))
--select @F_rep R4
----if(left(@STR_Replicate,1)=right(@STR_Replicate,1))
----Begin
----select @F_rep=substring(@STR_Replicate,@d1,len(@F_rep)-1)
----select @F_rep R4
----End
--select @STR_Replicate=REPLACE(@F_rep,@C_sep,'')
--select len(@STR_Replicate),len(@F_rep)
----if(len(@STR_Replicate)<len(@F_rep))
--select @STR_Replicate=concat(@STR_Replicate,@s1)
--select @STR_Replicate R3
--select @C_sep R2,@F_rep R4,@STR_Replicate R3,@s1 S1
--select @r,@C_sep R2,@STR_Replicate R3 ,len(@STR_Replicate) R3,@F_rep R4,len(@F_rep) R4,@s1 S1
--select @STR_Replicate,@s1,@F_rep
