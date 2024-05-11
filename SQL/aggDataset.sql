SELECT id,    ANY_VALUE(includedInDataCatalog), STRING_AGG( keyword, ', ') AS kw_list
FROM dataset
GROUP BY  dataset.id

