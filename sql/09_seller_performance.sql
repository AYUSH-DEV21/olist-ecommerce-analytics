/*
============================================================
Business SQL #6
Question:
Which sellers generate the highest merchandise value and process
the largest number of customer orders?
============================================================
*/

SELECT

    seller_id,

    COUNT(DISTINCT order_id) AS total_orders,

    COUNT(*) AS items_sold,

    ROUND(SUM(price),2) AS merchandise_value,

    ROUND(SUM(freight_value),2) AS freight_value,

    ROUND(AVG(price),2) AS average_item_price

FROM vw_product_sales

GROUP BY seller_id

ORDER BY merchandise_value DESC;