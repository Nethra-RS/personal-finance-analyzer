{% test custom_positive_amount(model, column_name) %}
-- Fails if any amount is <= 0 or NULL
SELECT *
FROM {{ model }}
WHERE {{ column_name }} <= 0
   OR {{ column_name }} IS NULL
{% endtest %}


{% test custom_accepted_values(model, column_name, allowed_values) %}
SELECT *
FROM {{ model }}
WHERE {{ column_name }} NOT IN (
    {%- for val in allowed_values -%}
        '{{ val }}'{% if not loop.last %}, {% endif %}
    {%- endfor -%}
)
{% endtest %}
