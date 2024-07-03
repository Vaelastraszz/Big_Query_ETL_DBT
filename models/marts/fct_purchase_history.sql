with stg_fct_purchase_history as (
    select
        customer_id as nk_customer_id,
        product_sku as nk_product_sku,
        channel_id as nk_channel_id,
        quantity as mtr_quantity,
        discount as mtr_discount,
        cast(order_date as date) as dt_order_date
    from {{ ref("stg_purchase_history") }}
)

select
    coalesce(dcust.sk_customer, "-1") as sk_customer_id,
    coalesce(dchan.sk_channel, "-1") as sk_channel_id,
    coalesce(dprod.sk_product, "-1") as sk_product_sku,
    fct.dt_order_date as sk_order_date,
    fct.mtr_quantity,
    fct.mtr_discount,
    dprod.mtr_unit_price,
    round(fct.mtr_quantity * dprod.mtr_unit_price, 2) as mtr_total_amount_gross,
    round(fct.mtr_quantity * dprod.mtr_unit_price * (1 - fct.mtr_discount), 2) as mtr_total_amount_net
from stg_fct_purchase_history as fct
left join {{ ref("dim_customers") }} as dcust using(nk_customer_id)
left join {{ ref("dim_channels") }} as dchan using(nk_channel_id)
left join {{ ref("dim_products") }} as dprod using(nk_product_sku)