{% snapshot actor_snapshot_check %}

{{
    config(
      target_database='dvdrental',
      target_schema='snapshots',
      unique_key='actor_id',
      strategy='check',
      updated_at='last_update',
      check_cols=['first_name', 'last_name']
    )
}}

select * from {{ source("dvd_rental", "actor")}}

{% endsnapshot %}

-- походу комментарии тут не пишутся((( блэт