with
    source_data as (
        select *
    from {{ source('erpnorthwind20211010', 'public_categories') }}
    )

with
    source_data1 as (
        select *
    from {{ source('erpnorthwind20211010', 'public_products') }}
    )

with
    source_data2 as (
        select *
    from {{ source('erpnorthwind20211010', 'public_suppliers') }}
    )

with
    source_data3 as (
        select *
    from {{ source('erpnorthwind20211010', 'public_orders_details') }}
    )


with
    Merge1 as (
        select * from source_data
left join source_data1 on source_data.category_id = source_data1.category_id

with
    Merge2 as (
        select * from Merge1
left join source_data2 on source_data.supplier_id = source_data1.supplier_id

select * from Merge2
left join source_data3 on source_data.product_id = source_data1.product_id