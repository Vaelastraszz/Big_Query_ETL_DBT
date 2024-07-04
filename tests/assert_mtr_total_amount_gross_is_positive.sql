select
    sk_customer_id,
    sk_channel_id,
    sk_product_sku,
    sum(mtr_total_amount_gross) as mtr_total_amount_gross
from {{ ref("fct_purchase_history")}}
group by 1, 2, 3
having mtr_total_amount_gross < 0