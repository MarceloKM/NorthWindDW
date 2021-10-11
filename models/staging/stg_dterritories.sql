with
    source_data as (
        select *
    from {{ source('erpnorthwind20211010', 'public_territories') }}
    )
    
select * 
from source_data
