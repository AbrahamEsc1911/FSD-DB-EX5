create database training;
use training;
create table user (
id int primary key auto_increment not null,
name varchar(40) not null,
role enum('user', 'trainer') default 'user',
created_at datetime default current_timestamp,
is_active boolean default false,
updated_at datetime default current_timestamp on update current_timestamp
);

create table activity (
id int primary key auto_increment not null,
name varchar(50) not null,
description text
);

create table register_activity (
id int primary key auto_increment not null,
user_id int,
foreign key(user_id) references user(id),
activity_id int,
foreign key(activity_id) references activity(id),
progress int check(progress >= 1 and progress <= 100),
goals enum('lose_wigth', 'gain muscle')
);

create table recomendations(
id int primary key auto_increment not null,
user_id int,
foreign key(user_id) references user(id),
activity_id int,
foreign key(activity_id) references activity(id),
description text not null
);