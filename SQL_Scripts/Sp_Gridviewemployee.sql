CREATE DATABASE employee_db

CREATE TABLE employee_db..employee_details (
	id				int IDENTITY(1,1) primary key,
	empcode			nvarchar(10) null,
	firstname		nvarchar(10)  null,  
	lastname		nvarchar(10)  null,  
	phonenumber		nvarchar(20)  null,  
	emailaddress	nvarchar(255)  null,  
	salary			nvarchar(10)  null,  
	event			char(2)  
)

-----------------------------------------------------------------------------------------------

use employee_db
GO
if exists (select 'x' from sysobjects where name='Sp_Gridviewemployee' and type='P' )
	drop procedure Sp_Gridviewemployee
GO

create procedure Sp_Gridviewemployee  
(        
 @empcode		nvarchar(10) = null,  
 @firstname		nvarchar(10) = null,  
 @lastname		nvarchar(10) = null,  
 @phonenumber	nvarchar(20) = null,  
 @emailaddress  nvarchar(255) = null,  
 @salary		nvarchar(10) = null,  
 @Event			nchar(2)
   
  
)  
as  
/***************************************************************  
 ** Version    : SQL 2008R2    
 ** Procedure    : Crud operation   
 ** Author       : Rajdeep Barui    
 ** Date written : 03.05.2022  
 ****************************************************************/  
begin  
 SELECT CONVERT(INT, @salary)  
 if(@Event = 'A')  
 begin  
  
  if exists(select * from employee_db..employee_details where empcode=@empcode or phonenumber=@phonenumber   
     or emailaddress=@emailaddress)  
  begin  
   return 2  
  end  
  begin transaction  
    
  insert into employee_db..employee_details (empcode,firstname,lastname,phonenumber,emailaddress,salary)   
  values(@empcode,@firstname,@lastname,@phonenumber,@emailaddress,@salary)  
    
  if(@@error!=0)  
  begin  
   rollback tran   
   return 1  
  end   
  commit transaction  
 end  
 else if(@Event = 'S')  
 begin  
  select * from employee_db..employee_details order by employee_details.id desc  
 end  
 else if(@Event = 'U')  
 begin  
  if exists(select * from employee_db..employee_details where (phonenumber=@phonenumber   
     or emailaddress=@emailaddress) and (empcode != @empcode))  
  begin  
   return 2  
  end  
  begin transaction  
   UPDATE employee_db..employee_details SET empcode=@empcode,firstname=@firstname,lastname=@lastname,phonenumber=@phonenumber,emailaddress=@emailaddress,salary=@salary  where empcode = @empcode  
  if(@@error!=0)  
  begin  
   rollback tran   
   return 1  
  end   
  commit transaction  
 end  
 --else if(@Event = 'D')  
 --begin  
 -- begin transaction  
 --  insert into   
 --   employee_db..log_employeedetails (empcode,firstname,lastname,phonenumber,emailaddress,salary)   
 --  select  
 --   empcode,firstname,lastname,phonenumber,emailaddress,salary  
 --  from  
 --   employee_db..employee_details  
 --  where  
 --   empcode = @empcode;  
  
 --  delete from employee_db..employee_details WHERE empcode = @empcode  
 -- if(@@error!=0)  
 -- begin  
 --  rollback tran   
 --  return 1  
 -- end   
 -- commit transaction  
 --end  
 --else if(@Event = 'L')  
 --begin  
 -- select * from employee_db..log_employeedetails order by log_employeedetails.id desc  
 --end  
 --else if(@Event = 'R')  
 --begin  
 -- begin transaction  
 --  insert into   
 --   employee_db..employee_details (empcode,firstname,lastname,phonenumber,emailaddress,salary)   
 --  select  
 --   empcode,firstname,lastname,phonenumber,emailaddress,salary  
 --  from  
 --   employee_db..log_employeedetails  
 --  where  
 --   empcode = @empcode;  
  
 --  delete from employee_db..log_employeedetails WHERE empcode = @empcode  
 -- if(@@error!=0)  
 -- begin  
 --  rollback tran   
 --  return 1  
 -- end   
 -- commit transaction  
 --end
  
end  
go