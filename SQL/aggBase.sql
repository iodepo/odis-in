SELECT id, any_value(type), any_value(name), any_value(url), any_value(description)
FROM base
GROUP BY  base.id

