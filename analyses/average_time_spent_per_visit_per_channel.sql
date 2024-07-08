select
    dc.dsc_channel_name,
    round(avg(fct.mtr_length_of_stay_minutes),2) as avg_time_spent_per_visit
from {{ ref("fct_visit_history")}} as fct
left join {{ ref("dim_channels") }} as dc on fct.sk_channel_id = dc.sk_channel
group by 1
order by 2 desc