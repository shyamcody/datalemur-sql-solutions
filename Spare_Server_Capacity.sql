SELECT *
FROM
(SELECT datacenter_id, 
monthly_capacity - sum(customer_monthly_demand) as spare_capacity
FROM
(SELECT forecasted_demand.datacenter_id as datacenter_id,
forecasted_demand.customer_id as customer_id,
forecasted_demand.monthly_demand as customer_monthly_demand,
datacenters.monthly_capacity as monthly_capacity 
FROM 
forecasted_demand join datacenters
on forecasted_demand.datacenter_id = datacenters.datacenter_id) A
group by datacenter_id,monthly_capacity) B
order by datacenter_id, spare_capacity;
