CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Post`()
BEGIN
select * from createpost where isDeleted=false;
END