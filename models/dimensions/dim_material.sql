{{-
    config(
        alias = 'group5_dim_materials'
    )

-}}

with
materials                   as (select * from {{ref('materials')}})

select
    m.id                                        as material_id,
    m.name                                      as name,
    m.type                                      as type,
    m.description                               as description


from
 materials m