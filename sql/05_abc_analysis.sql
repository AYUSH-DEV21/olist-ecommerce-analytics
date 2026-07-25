WITH product_summary AS (

    SELECT

        product_id,

        category,

        SUM(price) AS revenue

    FROM vw_product_sales

    GROUP BY

        product_id,
        category

),

product_pareto AS (

    SELECT

        product_id,

        category,

        revenue,

        SUM(revenue)
        OVER(

            ORDER BY revenue DESC

        ) * 1.0

        /

        SUM(revenue)
        OVER()

        AS cumulative_pct

    FROM product_summary

)

SELECT

    product_id,

    category,

    ROUND(revenue,2) AS revenue,

    ROUND(cumulative_pct*100,2) AS cumulative_pct,

    CASE

        WHEN cumulative_pct <= 0.80 THEN 'A'

        WHEN cumulative_pct <= 0.95 THEN 'B'

        ELSE 'C'

    END AS abc_class

FROM product_pareto

ORDER BY revenue DESC;

------------------------------------------------------------------------------------

WITH product_summary AS (

    SELECT

        product_id,

        SUM(price) AS revenue

    FROM vw_product_sales

    GROUP BY product_id

),

product_pareto AS (

    SELECT

        product_id,

        revenue,

        SUM(revenue)
        OVER(

            ORDER BY revenue DESC

        ) * 1.0

        /

        SUM(revenue)
        OVER()

        AS cumulative_pct

    FROM product_summary

)

SELECT

CASE

    WHEN cumulative_pct <= 0.80 THEN 'A'

    WHEN cumulative_pct <= 0.95 THEN 'B'

    ELSE 'C'

END AS abc_class,

COUNT(*) AS products,

ROUND(SUM(revenue),2) AS merchandise_value

FROM product_pareto

GROUP BY abc_class

ORDER BY abc_class;