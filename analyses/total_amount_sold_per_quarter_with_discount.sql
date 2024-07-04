select
    fct.sk_order_date,
    dd.quarter_of_year,
    round(sum(fct.mtr_total_amount_net), 2) as mtr_total_amount_net
from {{ ref("fct_purchase_history")}} as fct
left join {{ ref("dim_date")}} as dd on dd.date_day = fct.sk_order_date
group by 1, 2