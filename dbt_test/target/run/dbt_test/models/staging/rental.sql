

  create  table "dvdrental"."dvd_schema"."rental__dbt_tmp"
  as (
    select * from "dvdrental"."public"."rental"
  );