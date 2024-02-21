--clean up the nulls - use sku_group where product is null
--write tests to confirm no nulls
--test on uniqueness and accepted values for order status

with raw_shopit_data as (

    select * from {{ source('SHOPIT_ANALYTICS','RAW_SHOPIT_DATA')}}
)

select * from raw_shopit_data