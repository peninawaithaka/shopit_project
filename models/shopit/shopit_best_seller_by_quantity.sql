--model that will aid in visualizing the best product by quantity in 2023. 

{{
    config(
        materialized = 'table'
    )
}}

with best_seller_by_quantity as (

    select 
        *
    from {{ ref('src_shopit_data')}}
)

select 
    product,
    order_date,
    sum(quantity) as quantity
from best_seller_by_quantity
group by product, order_date
order by quantity desc