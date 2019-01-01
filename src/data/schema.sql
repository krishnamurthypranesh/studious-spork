create database tweetsdb;

use tweetsdb;

create table tweets(
	entry_id int auto_increment primary key,
	tweet_id bigint(12),
	tweet_time datetime,
	handle varchar(256) ,
	location varchar(256),
	tweet_text text,
	media int,
	favs int,
	retweets int
);

create table user_info(
	entry_id int auto_increment primary key,
	name varchar(100),
	handle varchar(100),
	lang varchar(30),
	verified_account int,
	followers_count int,
	friends_count int,
	statuses_count int,
	favourites_count int
)

