
create database MotionPictureDB;

use MotionPictureDB

drop table if exists MotionPicture;

create table MotionPicture (
id int identity(1,1) primary key not null,
Name nvarchar(50) not null, 
Description nvarchar(500),
ReleaseYear int not null
);