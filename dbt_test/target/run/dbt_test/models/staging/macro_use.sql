

  create  table "dvdrental"."dvd_schema"."macro_use__dbt_tmp"
  as (
    select
a.*,

    cast (last_update as timestamp)
 as "last_update_2"
from "dvdrental"."snapshots"."actor_snapshot_scd" a
  );