/*
============================================================
Business SQL #9
Question:
What is the average Customer Lifetime Value (CLV)?
============================================================
*/

SELECT

    ROUND(

        AVG(customer_revenue),

        2

    ) AS average_customer_lifetime_value

FROM (

    SELECT

        customer_unique_id,

        SUM(total_payment) AS customer_revenue

    FROM vw_customer_orders

    GROUP BY customer_unique_id

);