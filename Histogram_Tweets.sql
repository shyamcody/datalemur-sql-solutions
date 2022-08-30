SELECT tweet_count as tweet_bucket, count(user_id) as users_num from
(SELECT user_id, count(tweet_id) as tweet_count 
FROM tweets
where tweet_date>='01-01-2022' and tweet_date<'12-31-2022'
group by user_id) A
group by tweet_count;
