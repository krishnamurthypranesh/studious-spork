# This repo contains a brief analysis of the tweets with the "#nba"
The data were collected in a period of about two hours on New Years / New Year's Eve (depending on where you live.)
(The data were collected from 00:45 to about 3:00 IST).

There are two datasets, one with information about the tweets and another with information about the users who tweeted. There are about 1360 tweets.

The tweets were collected using python, processed and stored in a MySQL 8.0 database.

All this was done as a part of a challenge.
## Challenge: 
    - Collect tweets using the twitter standard search api
    - Process the tweets and store in a database
    - Measure:
        - Total Tweets
        - Unique Users
        - Number of Tweets with media
        - Tweets with most retweets
        - Tweets with the most favorite counts
        - Tweet count for each location
        - Top Users with maximum tweets
        - Users with maximum retweets
        - Users with maximum favorites
    - Visualize the data
        - Distribution of tweets across locations
        - Distribution of tweets across time

## Code style used
    - camelCase for user-defined functions and classes
    - snake_case for variables
    - double quotes over single quotes
    - tabs over spaces