{{-
    config(
        alias = 'group5_fact_demands'
    )

-}}

with
orders                   as (select * from {{ref('order_items')}})
, pro_demands            as (select * from {{ref('monthly_material_demands')}})

select 
    material_id, 
    quantity, 
    extract(month from timestamp) as month, 
    extract(year from timestamp) as year, 
    case when material_id > 0 then 'Retailer' end as agent

from order_items oi  

union all

select 
    material_id, 
    quantity, 
    month, 
    year, 
    case when material_id > 0 then 'Production' end as agent
    
from monthly_material_demands mmd 