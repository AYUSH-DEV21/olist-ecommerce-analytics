SELECT

    strftime('%Y-%m', order_purchase_timestamp) AS order_month,

    ROUND(
        SUM(total_payment),
        2
    ) AS monthly_revenue,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(
        AVG(total_payment),
        2
    ) AS average_order_value

FROM vw_customer_orders

GROUP BY order_month

ORDER BY order_month;