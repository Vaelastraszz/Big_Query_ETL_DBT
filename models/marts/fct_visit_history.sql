with stg_fct_visit_history as (
    select
        customer_id as nk_customer_id,
        channel_id as nk_channel_id,
        cast(visit_timestamp as date) as sk_visit_date,
        cast(bounce_timestamp as date) as sk_date_bounce,
        cast(visit_timestamp as datetime) as dt_visit_timestamp,
        cast(bounce_timestamp as datetime) as dt_bounce_timestamp
    from {{ ref("stg_visit_history") }}
)

select
    coalesce(dcust.sk_customer, "-1") as sk_customer_id,
    coalesce(dchan.sk_channel, "-1") as sk_channel_id,
    fct.sk_visit_date,
    fct.sk_date_bounce,
    fct.dt_visit_timestamp,
    fct.dt_bounce_timestamp,
    date_diff(fct.dt_bounce_timestamp, fct.dt_visit_timestamp, minute) as mtr_length_of_stay_minutes,
from stg_fct_visit_history as fct
left join {{ ref("dim_customers") }} as dcust using(nk_customer_id)
left join {{ ref("dim_channels") }} as dchan using(nk_channel_id)