SELECT base_agg.id,
       base_agg.type_list,
       base_agg.name_list,
       dataset_agg.kw_list,
       base_agg.b_url,
       base_agg.b_desc,
       base_agg.b_headline,
       geo_agg.geom_list,
       geo_agg.wkt_list,
       geo_agg.geojson,
       temporal_agg.tc_list,
       temporal_agg.dp_list
FROM (SELECT id,
             STRING_AGG(DISTINCT type, ', ') AS type_list,
             STRING_AGG(DISTINCT name, ', ') AS name_list,
             any_value(url)                  AS b_URL,
             any_value(description)          AS b_desc,
             any_value(headline)             AS b_headline
      FROM base
      GROUP BY id) AS base_agg
         JOIN (SELECT id, ANY_VALUE(includedInDataCatalog), STRING_AGG(DISTINCT keyword, ', ') AS kw_list
               FROM dataset
               GROUP BY id) AS dataset_agg
              ON base_agg.id = dataset_agg.id
         JOIN (SELECT id, STRING_AGG(DISTINCT geom, ', ') AS geom_list,
                      STRING_AGG(DISTINCT wkt, ', ') AS wkt_list,
                      STRING_AGG(DISTINCT geojson, ', ') AS geojson
               FROM sup_geo
               GROUP BY id) AS geo_agg
              ON base_agg.id = geo_agg.id
         JOIN (SELECT id, STRING_AGG(DISTINCT temporalCoverage, ', ') AS tc_list, STRING_AGG(DISTINCT datePublished, ', ') AS dp_list
               FROM sup_time
               GROUP BY id) AS temporal_agg
              ON base_agg.id = temporal_agg.id
ORDER By base_agg.id;