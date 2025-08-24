--https://datalemur.com/questions/time-spent-snaps
WITH age_group_added AS (
     SELECT age_bucket,activity_type,time_spent FROM
     activities LEFT JOIN age_breakdown
     ON activities.user_id = age_breakdown.user_id
     WHERE activity_type IN ('send','open')
),

stats_calculated AS (
    SELECT age_bucket,
    SUM(
    CASE 
      WHEN activity_type = 'send' THEN time_spent
      ELSE 0
    END) AS time_spent_sending,
    SUM(
    CASE
      WHEN Activity_type = 'open' THEN time_spent
      ELSE 0
    END) AS time_spent_opening
    
    FROM age_group_added
    GROUP BY age_bucket
)

SELECT age_bucket, 
ROUND(time_spent_sending/(time_spent_sending + time_spent_opening)*100,2),
ROUND(time_spent_opening/(time_spent_sending + time_spent_opening)*100,2)
FROM
stats_calculated;
