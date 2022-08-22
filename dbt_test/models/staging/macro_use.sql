select
a.*,
{{my_macro("last_update")}} as "last_update_2"
from {{ref("actor_snapshot_scd")}} a