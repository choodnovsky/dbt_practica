{% snapshot actor_snapshot_scd %}

{{
    config(
      target_database='dvdrental',
      target_schema='snapshots',
      unique_key='actor_id',
      strategy='timestamp',
      updated_at='last_update',
    )
}}

select * from {{ source("dvd_rental", "actor")}}

{% endsnapshot %}

-- походу комментарии тут не пишутся((( блэт