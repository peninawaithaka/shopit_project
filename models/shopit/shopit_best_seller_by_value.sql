--model that will aid in visualizing the best product by value in 2023. 
{{
    config(
        materialized = 'view'
    )
}}

with best_seller_by_value as (

    select 
        *
    from {{ ref('src_shopit_data')}}
)

select
    product,
    order_date,
    sum(product_price_after_discount) as price
from best_seller_by_value
group by product, order_date
order by price desc




