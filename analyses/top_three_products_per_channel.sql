with base_cte as (
    select
        dp.dsc_product_name,
        dc.dsc_channel_name,
        round(sum(fct.mtr_total_amount_net),2) as total_amount_net
    from {{ ref("fct_purchase_history") }} as fct
    left join {{ ref("dim_channels") }} as dc on fct.sk_channel_id = dc.sk_channel
    left join {{ ref("dim_products") }} as dp on fct.sk_product_sku = dp.sk_product
    group by 1,2
)

select
    *,
    rank() over(partition by bc.dsc_channel_name order by bc.total_amount_net desc) as rank
from base_cte as bc
qualify rank <= 3