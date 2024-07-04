select
    sk_customer_id,
    sk_channel_id,
    sum(mtr_length_of_stay_minutes) as mtr_length_of_stay_minutes
from {{ ref("fct_visit_history")}}
group by 1, 2
having mtr_length_of_stay_minutes <= 0 