SELECT employee_id, salary, status FROM
(SELECT 
employee_pay.employee_id, 
employee_pay.salary,
employee_pay.title,
CASE 
WHEN employee_pay.salary > avg_salary*2 THEN 'Overpaid'
WHEN employee_pay.salary < avg_salary*0.5 THEN 'Underpaid'
ELSE 'Normal' 
END AS status
FROM
employee_pay JOIN
(SELECT title,AVG(salary) as avg_salary 
FROM employee_pay
GROUP BY title) A
ON employee_pay.title = A.title) B
where status != 'Normal'
;
