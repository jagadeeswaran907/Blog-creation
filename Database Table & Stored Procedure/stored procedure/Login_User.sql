CREATE DEFINER=`root`@`localhost` PROCEDURE `Login_User`(Email varchar(255))
BEGIN
if exists(select null from registeruser where userEmail = Email)
then
select "Success" as msg,200 as status_code,password from registeruser where userEmail = Email;
else
select 'Invalid username or password' as msg , 404 as status_code;
end if;
END