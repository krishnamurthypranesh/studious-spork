# This file contains all the SQL code for the measurements asked

use tweetsdb;

-- total number of tweets
select count(tweet_id) as `Total Tweets`
from tweets; # 1359

-- total number of unique users
select count(distinct(handle)) as `Unqiue Users`
from user_info; # 986

--number of tweets with media
select sum(media)
from tweets
where media = 1; # 143

-- tweets with most retweets
select a.tweet_id, a.tweet_text,
extract(hour from a.tweet_time) as hour, 
extract(minute from a.tweet_time) as minute,
extract(second from a.tweet_time) as seconds
from tweets as a join (
	select tweet_text, count(tweet_id) as tweetCount
	from tweets
	group by tweet_text
	order by tweetCount desc
	limit 1
) as b on a.tweet_text = b.tweet_text
order by hour, minute, seconds
limit 1; # the tweet with the most number of retweets is the tweet with the id 1079819873239339008.

-- tweet that has been favourited the most
# assuming that every tweet that retweeted was also liked, then the tweet with the most number of favourites is
# the tweet with the most retweets. 

-- tweet count for each location top 25
select location, count(tweet_id) as `Tweet Count`
from tweets
group by location
order by `Tweet Count` desc
limit 5; # USA

-- top users with max tweets top 5 users
select distinct(a.name), (b.handle), b.tweetCount
from user_info as a join (
	select count(tweet_id) as tweetCount, handle
	from tweets
	group by handle
	order by tweetCount desc
	limit 25
) as b on a.handle = b.handle
order by tweetCount desc
limit 5; 
# top user with most tweets in the said period is Matthias Wilke(@lebensgeister13) with 25 tweets

-- user with maximum retweets
select a.handle, c.name, extract(hour from a.tweet_time) as hour, 
extract(minute from a.tweet_time) as minute,
extract(second from a.tweet_time) as seconds,
a.tweet_text, b.tweetCount
from tweets as a join(
	select tweet_text, count(tweet_id) as tweetCount
	from tweets
	group by tweet_text
	order by tweetCount desc
	limit 1
) as b on a.tweet_text = b.tweet_text
join user_info as c on a.handle = c.handle
order by hour, minute, seconds;
# user who's tweet has been retweeted the most number of times in the considered time period 
# is Leonardo Perez(@RodriguezEsaul). His tweet has been retweeted 25 times.

-- user with max favourites
# assuming that every person who retweeted a particular tweet also liked it, person with the highest favourites
# count is also the person with the highest retweets. So, the answer is Leonardo Perez(@RodriguezEsaul)

-- user with overall max favourites
select name, handle, favourites_count
from user_info
order by favourites_count desc
limit 1;
	
# The user with the overall maximum number of tweets is Daniel Alejandro(@Garcia_Daniel30) with 697049 favourites