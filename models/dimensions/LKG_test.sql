{{-
    config(
        alias = 'LKG_test'
    )

-}}

with
suppliers                   as (select * from {{ref('suppliers')}})
, purchase_order            as (select * from {{ref('purchase_orders')}})
, purchase_order_items      as (select * from {{ref('purchase_order_items')}})

select
    poi.material_id             as material_id,
    s.name                      as supplier_name,
    poi.price                   as price
from
purchase_order po
    left join 
suppliers s                 on po.supplier_id = s.id
    left join
purchase_order_items poi    on poi.purchase_order_id = po.id



