

  create  table "dvdrental"."dvd_schema"."inventory__dbt_tmp"
  as (
    select * from "dvdrental"."public"."inventory"
  );