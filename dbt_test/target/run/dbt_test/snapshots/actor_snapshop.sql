
      

  create  table "dvdrental"."snapshots"."actor_snapshot"
  as (
    

    select *,
        md5(coalesce(cast(actor_id as varchar ), '')
         || '|' || coalesce(cast(last_update as varchar ), '')
        ) as dbt_scd_id,
        last_update as dbt_updated_at,
        last_update as dbt_valid_from,
        nullif(last_update, last_update) as dbt_valid_to
    from (
        



select * from "dvdrental"."public"."actor"

    ) sbq


  );
  