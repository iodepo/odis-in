SELECT *
FROM dataset.data
INNER JOIN base.data
ON dataset.data.id = base.data.id;