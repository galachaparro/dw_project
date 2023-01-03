{{-
    config(
        alias = 'group5_dim_retailer'
    )

-}}

with
retailers                   as (select * from {{ref('retailers')}})

select
    r.id                                        as id,
    r.name                                      as company_name,
    r.address                                   as retailer_address,
    split_part(r.address, ', ', 4)              as country,
    split_part(r.address, ', ', 3)              as region
from
retailers r