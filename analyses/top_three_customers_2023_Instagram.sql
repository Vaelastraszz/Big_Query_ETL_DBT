with base_cte as (
    select
        dcust.sk_customer as sk_customer,
        dcust.dsc_name as customer_name,
        dchan.dsc_channel_name as channel_name,
        round(sum(fct.mtr_total_amount_net), 2) as mtr_total_amount_net
    from {{ ref("fct_purchase_history") }} as fct
    left join {{ ref("dim_customers") }} as dcust on dcust.sk_customer = fct.sk_customer_id
    left join {{ ref("dim_channels") }} as dchan on dchan.sk_channel = fct.sk_channel_id
    where dchan.dsc_channel_name = 'Instagram'
    group by 1, 2, 3
)

select 
    *
from base_cte
order by mtr_total_amount_net desc
limit 3
