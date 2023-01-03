{{-
    config(
        alias = 'group5_dim_calendar'
    )

-}}

with dates as
(
    select date_trunc('day', dd):: date as date
    from generate_series
        ( '2015-01-01'::timestamp 
        , '2023-01-31'::timestamp
        , '1 day'::interval) dd
), prep as
(
select 
    date,
    extract(year from (date))      as year,
    extract(quarter from (date))   as quarter,
    extract(month from (date))     as month,
    extract(day from (date))       as day_of_month,
    extract(week from (date))	   as week_of_the_year,
    extract(DOW from (date))       as day_of_the_week,
    case 
    	when extract(DOW from (date)) = 0 then 'Sunday'
    	when extract(DOW from (date)) = 1 then 'Monday'
    	when extract(DOW from (date)) = 2 then 'Tuesday'
    	when extract(DOW from (date)) = 3 then 'Wednesday'
    	when extract(DOW from (date)) = 4 then 'Thursday'
    	when extract(DOW from (date)) = 5 then 'Friday'
    	when extract(DOW from (date)) = 6 then 'Saturday'
    	end							as day_name
    	
from dates
)

select 
    date,
    year,
    quarter,
    month,
    day_of_month,
    week_of_the_year,
    day_of_the_week,
    day_name

from prep
