
      update "dvdrental"."snapshots"."actor_snapshot_scd"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "actor_snapshot_scd__dbt_tmp152357222272" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "dvdrental"."snapshots"."actor_snapshot_scd".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      and "dvdrental"."snapshots"."actor_snapshot_scd".dbt_valid_to is null;

    insert into "dvdrental"."snapshots"."actor_snapshot_scd" ("actor_id", "first_name", "last_name", "last_update", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."actor_id",DBT_INTERNAL_SOURCE."first_name",DBT_INTERNAL_SOURCE."last_name",DBT_INTERNAL_SOURCE."last_update",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "actor_snapshot_scd__dbt_tmp152357222272" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  