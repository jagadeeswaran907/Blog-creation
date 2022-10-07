CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Post`(PostID int)
BEGIN
update createpost set isDeleted = true,updatedTime = now()  where ID = PostID;
select 'Post has been deleted successfully' as msg, 200 as status_code;
END