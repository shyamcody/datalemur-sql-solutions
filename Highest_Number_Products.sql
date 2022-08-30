SELECT user_id, product_num
FROM
(SELECT user_id,count(product_id) as product_num, sum(spend) as total_spend
FROM user_transactions
group by user_id
order by product_num desc, total_spend desc) A
where total_spend>1000
limit 3;
