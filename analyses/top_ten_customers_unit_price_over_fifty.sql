with base_cte as (
    select
        dcust.sk_customer as sk_customer,
        dcust.dsc_name as customer_name,
        round(sum(fct.mtr_total_amount_net), 2) as mtr_total_amount_net,
        logical_and(fct.mtr_unit_price > 50) as all_unit_price_above_fifty
    from {{ ref("fct_purchase_history") }} as fct
    left join {{ ref("dim_customers") }} as dcust on dcust.sk_customer = fct.sk_customer_id
    group by 1, 2
)

select
    *,
from base_cte
limit 10