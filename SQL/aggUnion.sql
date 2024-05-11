SELECT base_agg.id, base_agg.type_list, base_agg.name_list, dataset_agg.kw_list, base_agg.b_url, base_agg.b_desc, base_agg.b_headline
FROM (
    SELECT id, STRING_AGG(DISTINCT type, ', ') AS type_list, STRING_AGG(DISTINCT name, ', ') AS name_list,
           any_value(url) AS b_URL, any_value(description) AS b_desc, any_value(headline) AS b_headline
    FROM base
    GROUP BY  id
) AS base_agg
JOIN (
    SELECT id,    ANY_VALUE(includedInDataCatalog), STRING_AGG(DISTINCT keyword, ', ') AS kw_list
    FROM dataset
    GROUP BY  id
) AS dataset_agg
ON base_agg.id = dataset_agg.id
ORDER By base_agg.id;
