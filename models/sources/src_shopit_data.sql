--clean up the nulls - use sku_group where product is null
--write tests to confirm no nulls
--test on uniqueness and accepted values for order status

{{
    config(
        materialized = 'table'
    )
}}

with raw_shopit_data as (

    select * from {{ source('SHOPIT_ANALYTICS','RAW_SHOPIT_DATA')}}

)

select 
    order_id,
    order_line_item_id,
    cast(order_date as date) as order_date,
    email,
    country,
    country_code,
    external_source,
    order_status,
    product_id,
    case
        when product is null then sku_group
        else product
    end as product,
    product_price_after_discount,
    quantity,
    sku,
    sku_group
from raw_shopit_data