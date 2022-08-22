select r.customer_id,
count(i.inventory_id) as cnt
from {{ref("rental")}} r
left join {{ref("inventory")}} i
on r.inventory_id = i.inventory_id
group by r.customer_id
order by cnt desc
limit 10