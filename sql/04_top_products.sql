SELECT

    product_id,

    category,

    COUNT(*) AS units_sold,

    COUNT(DISTINCT order_id) AS unique_orders,

    ROUND(SUM(price),2) AS merchandise_value,

    ROUND(AVG(price),2) AS average_price

FROM vw_product_sales

GROUP BY

    product_id,
    category

ORDER BY merchandise_value DESC

LIMIT 20;

------------------------------------------------------------------------------------------------


WITH product_summary AS (

    SELECT

        product_id,

        category,

        SUM(price) AS revenue

    FROM vw_product_sales

    GROUP BY

        product_id,
        category

)

SELECT

    product_id,

    category,

    ROUND(revenue,2) AS revenue,

    ROUND(

        revenue * 100.0

        /

        SUM(revenue) OVER(),

        4

    ) AS revenue_share_pct

FROM product_summary

ORDER BY revenue DESC;