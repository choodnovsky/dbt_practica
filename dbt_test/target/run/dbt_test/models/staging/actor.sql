

  create  table "dvdrental"."dvd_schema"."actor__dbt_tmp"
  as (
    select * from "dvdrental"."public"."actor"
  );