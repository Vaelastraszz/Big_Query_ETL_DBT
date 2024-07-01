with raw_purchase_history as (
    select
        customer_id,
        product_sku,
        channel_id,
        quantity,
        discount,
        order_date
    from {{ source("omnichannel", "purchaseHistory")}}
)

select * from raw_purchase_history