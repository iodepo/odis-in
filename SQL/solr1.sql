SELECT dataset.id,  dataset.type,  dataset.license,  dataset.keyword
FROM dataset
JOIN base
ON dataset.id =  base.id;
