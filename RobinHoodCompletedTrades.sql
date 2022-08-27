SELECT user_city, count(order_id) as count_complete_order from 
(SELECT order_id, trades.user_id as trader_id, users.city as user_city FROM 
trades join users 
on trades.user_id = users.user_id
where trades.status = 'Completed') B
group by user_city
order by count_complete_order desc
limit 3;
