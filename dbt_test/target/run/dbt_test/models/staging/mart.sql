

  create  table "dvdrental"."dvd_schema"."mart__dbt_tmp"
  as (
    select r.customer_id,
count(i.inventory_id) as cnt
from "dvdrental"."dvd_schema"."rental" r
left join "dvdrental"."dvd_schema"."inventory" i
on r.inventory_id = i.inventory_id
group by r.customer_id
order by cnt desc
limit 10
  );