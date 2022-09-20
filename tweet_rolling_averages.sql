SELECT
user_id, tweet_date,
TRUNC(
      AVG(tweet_count)
      OVER(
      PARTITION BY user_id
      ORDER BY user_id,tweet_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2)
      AS rolling_avg_3days
FROM 
(
SELECT user_id, tweet_date,
count(tweet_id) as tweet_count FROM
tweets
GROUP BY user_id, tweet_date) A
ORDER BY user_id, tweet_date;
