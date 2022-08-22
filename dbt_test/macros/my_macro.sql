{% macro my_macro(column_name) %}
    cast ({{ column_name }} as timestamp)
{% endmacro %}
