SELECT order_date, product_type, 
sum(quantity) over (partition by product_type order by order_date) as cum_purchased
from total_trans
order by order_date;
