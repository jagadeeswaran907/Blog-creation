CREATE DEFINER=`root`@`localhost` PROCEDURE `Create_Post`(Post_Title varchar(255),Post_Image varchar(255),starRating int,Price int,Created_By int)
BEGIN
if exists(select posttitle from createpost where posttitle=Post_Title)
then
select 'Post name already existing' as msg , 404 as status_code;
else
insert into createpost (posttitle,postImage,starRating,Price,createdBy,createdTime,isDeleted) values
(Post_Title,Post_Image,starRating,Price,Created_By,now(),false);
select 'Post created successfully' as msg , 200 as status_code;
end if;
END