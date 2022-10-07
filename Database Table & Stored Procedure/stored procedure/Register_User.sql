CREATE DEFINER=`root`@`localhost` PROCEDURE `Register_User`(Email varchar(255), Password varchar(255))
BEGIN
if exists(select userEmail from registeruser where userEmail = Email)
then 
 select "Email Already existing" as msg, 400 as status_code;
 else
 insert into registeruser (userEmail,password,createdTime,isDeleted) value (Email,Password,now(),false);
  select "Your Registered Successfully" as msg, 200 as status_code;
 end if;
END