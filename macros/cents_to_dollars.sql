/*{% macro amount_dollars(payment) %}

{{payment}}/100
{% endmacro %}*/



{% macro cents_to_dollars(column_name, decimal_places=2) -%}
round( 1.0 * {{ column_name }} / 100, {{ decimal_places }})
{%- endmacro %}
