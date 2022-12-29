{{-
    config(
        alias = 'LKG_dim_supplier'
    )

-}}

with
suppliers                   as (select * from {{ref('suppliers')}})
, purchase_order            as (select * from {{ref('purchase_orders')}})
, purchase_order_items      as (select * from {{ref('purchase_order_items')}})

select
    s.id                                        as id,
    s.name                                      as company_name,
    s.address                                   as supplier_address
    split_part(supplier_address, ' ', -1)       as country

from
 suppliers s
