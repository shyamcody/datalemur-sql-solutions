WITH send_open_stats
AS (
SELECT age_bucket,
SUM(CASE WHEN activity_type = 'open' THEN time_total
     ELSE 0 END) AS open_time,
SUM(CASE WHEN activity_type = 'send' THEN time_total
     ELSE 0 END) AS send_time
FROM
(SELECT age_bucket, activity_type, SUM(time_spent) as time_total
FROM
(SELECT 
user_id, activity_type, time_spent, age_bucket
FROM
(SELECT 
activities.user_id, 
activities.activity_type,
activities.time_spent,
age_breakdown.age_bucket
FROM
activities JOIN age_breakdown
on activities.user_id = age_breakdown.user_id) A
where activity_type != 'chat') B
GROUP BY age_bucket, activity_type) C
GROUP BY age_bucket
)

SELECT age_bucket,
ROUND(100*(send_time/(open_time+send_time)),2) AS SEND_PERC,
ROUND(100*(open_time/(open_time+send_time)),2) AS OPEN_PERC
from send_open_stats
ORDER BY age_bucket
;
