/*
============================================================
Business SQL #10
Question:
Create a unified analytical dataset for Power BI reporting.
============================================================
*/

SELECT

    p.order_id,

    o.order_purchase_timestamp,

    o.customer_state,

    o.customer_unique_id,

    p.seller_id,

    p.product_id,

    p.category,

    p.price,

    p.freight_value,

    p.gross_value,

    c.total_payment,

    o.order_status,

    o.order_delivered_customer_date,

    o.order_estimated_delivery_date

FROM vw_product_sales p

JOIN vw_orders o
    ON p.order_id = o.order_id

JOIN vw_customer_orders c
    ON p.order_id = c.order_id;