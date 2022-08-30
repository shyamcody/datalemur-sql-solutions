SELECT sender_id, count(message_id) as count_message
FROM 
(select * from
messages
where sent_date<'09-01-2022' and sent_date>='08-01-2022') A
group by sender_id
order by count_message desc
limit 2;
