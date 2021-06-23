
use master

drop database if exists MotionPictureDB

create database MotionPictureDB;

use MotionPictureDB

drop table if exists MotionPicture;

create table MotionPicture (
id int identity(1,1) primary key not null,
Name nvarchar(50) not null, 
Description nvarchar(500),
ReleaseYear int not null
);

insert into MotionPicture (Name, Description, ReleaseYear) 
values 
	(	'The Matrix', 
		 'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence. ',
		1999 );

insert into MotionPicture (Name, Description, ReleaseYear) 
values 
	(	'The Lion King', 
		 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.',
		1994 );

insert into MotionPicture (Name, Description, ReleaseYear) 
values 
	(	'Aladdin', 
		 'A kindhearted street urchin and a power-hungry Grand Vizier vie for a magic lamp that has the power to make their deepest wishes come true.',
		1992 );

insert into MotionPicture (Name, Description, ReleaseYear) 
values 
	(	'Space Jam', 
		 'In a desperate attempt to win a basketball match and earn their freedom, the Looney Tunes seek the aid of retired basketball champion, Michael Jordan.',
		1992 );

insert into MotionPicture (Name, Description, ReleaseYear) 
values 
	(	'Idiocracy', 
		 'Private Joe Bauers, a decisively average American, is selected as a guinea pig for a top-secret hibernation program but is forgotten, awakening to a future so incredibly moronic hes easily the most intelligent person alive.',
		2006 );
