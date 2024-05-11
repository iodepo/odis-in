SELECT base.id, base.type, base.name, dataset.keyword
FROM base
INNER JOIN dataset
ON base.id = dataset.id
    GROUP BY  dataset.keyword
LIMIT 1000;