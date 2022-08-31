WITH tab AS (SELECT
    country,
    customer_name,
    sum(count) AS payment_cnt,
    sum(amount) AS payment_sum,
    max(q1.rental_date) AS last_date FROM (
                            SELECT
                                co.country,
                                concat(cu.first_name, ' ', cu.last_name ) AS customer_name,
                                1 as "count",
                                p.amount,
                                r.rental_date
                            FROM {{source("dvd_rental", "payment")}} p
                                    JOIN {{source("dvd_rental", "customer")}} cu USING(customer_id)
                                    JOIN {{source("dvd_rental", "address")}} a USING(address_id)
                                    JOIN {{source("dvd_rental", "city")}} ci USING(city_id)
                                    JOIN {{source("dvd_rental", "country")}} co USING(country_id)
                                    JOIN {{source("dvd_rental", "rental")}} r USING(customer_id) ORDER BY co.country) AS q1
                            GROUP BY country, customer_name
                            order by country, customer_name)
select *
FROM (SELECT
    country,
    customer_name,
    last_date,
    row_number() OVER (PARTITION BY country order by last_date desc) as rn FROM tab ) AS q6 where country = 'Algeria'
