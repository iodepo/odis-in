# DuckDB Notes


## Notes

Need to get to: [solrExample.json](solrExample.json)

This SQL statement will return all columns where there's a matching id in both table1 and table2.
```sql
SELECT *
FROM table1
INNER JOIN table2
ON table1.id = table2.id;
```

If you want to include all records from one of the tables, 
even if there's no matching id in the other table, you would use a LEFT JOIN or RIGHT JOIN:
```sql
SELECT *
FROM table1
LEFT JOIN table2
ON table1.id = table2.id;
```

NOTE: If the id column exists in both of your tables,
you will need to use an alias to distinguish between them in your SELECT statement, like so:
```sql
SELECT table1.id AS id1, table2.id AS id2, ...
FROM table1
INNER JOIN table2
ON table1.id = table2.id;
```

## Console Commands
don't create schema, just tables for each parquet!

This is the simpler approach 
Console commands 2
```
CREATE TABLE base (id VARCHAR, type VARCHAR, name VARCHAR, url VARCHAR, description VARCHAR, headline VARCHAR, g VARCHAR );
CREATE TABLE dataset (id VARCHAR, type VARCHAR, sameAs VARCHAR, license VARCHAR, citation VARCHAR, keyword VARCHAR, includedInDataCatalog VARCHAR, distribution VARCHAR, region VARCHAR, provider VARCHAR, publisher VARCHAR, creator VARCHAR);
CREATE TABLE sup_time (id VARCHAR, type VARCHAR, time VARCHAR, temporalCoverage VARCHAR, dateModified VARCHAR, datePublished VARCHAR, );

COPY base FROM '/home/fils/src/Projects/OIH/odis-arch/graphOps/extraction/mdp/output/*_baseQuery.parquet';
COPY dataset FROM '/home/fils/src/Projects/OIH/odis-arch/graphOps/extraction/mdp/output/*_dataset.parquet';
COPY sup_time FROM '/home/fils/src/Projects/OIH/odis-arch/graphOps/extraction/mdp/output/*_sup_temporal.parquet';

CREATE TABLE course AS SELECT * FROM read_parquet('/home/fils/src/Projects/OIH/odis-arch/graphOps/extraction/mdp/output/*_course.parquet',  union_by_name=true);
CREATE TABLE person AS SELECT * FROM read_parquet('/home/fils/src/Projects/OIH/odis-arch/graphOps/extraction/mdp/output/*_person.parquet',  union_by_name=true);
CREATE TABLE sup_geo AS SELECT * FROM read_parquet('/home/fils/src/Projects/OIH/odis-arch/graphOps/extraction/mdp/output/*_sup_geo.parquet',  union_by_name=true);


```

This following apporach didn't seem to work as well, or be necessary since I ca
make tables and load the parquet to the tables and then join across those.
Console commands 1
```
CREATE SCHEMA base;
CREATE SCHEMA course;
CREATE SCHEMA dataset;
CREATE SCHEMA person;
CREATE SCHEMA sup_geo;
CREATE SCHEMA sup_time;

CREATE TABLE dataset.data (id VARCHAR, type VARCHAR, sameAs VARCHAR, license VARCHAR, citation VARCHAR, keyword VARCHAR, includedInDataCatalog VARCHAR, distribution VARCHAR, region VARCHAR, provider VARCHAR, publisher VARCHAR, creator VARCHAR);
CREATE TABLE base.data (id VARCHAR, type VARCHAR, name VARCHAR, url VARCHAR, description VARCHAR, headline VARCHAR, g VARCHAR );

COPY dataset.data FROM '/home/fils/src/Projects/OIH/odis-arch/graphOps/extraction/mdp/output/*_dataset.parquet';
COPY base.data FROM '/home/fils/src/Projects/OIH/odis-arch/graphOps/extraction/mdp/output/*_baseQuery.parquet';

CREATE TABLE course.data AS SELECT * FROM read_parquet('/home/fils/src/Projects/OIH/odis-arch/graphOps/extraction/mdp/output/*_course.parquet',  union_by_name=true);
CREATE TABLE person.data AS SELECT * FROM read_parquet('/home/fils/src/Projects/OIH/odis-arch/graphOps/extraction/mdp/output/*_person.parquet',  union_by_name=true);
CREATE TABLE sup_geo.data AS SELECT * FROM read_parquet('/home/fils/src/Projects/OIH/odis-arch/graphOps/extraction/mdp/output/*_sup_geo.parquet',  union_by_name=true);
CREATE TABLE sup_time.data AS SELECT * FROM read_parquet('/home/fils/src/Projects/OIH/odis-arch/graphOps/extraction/mdp/output/*_sup_temporal.parquet',  union_by_name=true);

```

## Columns we need

```
"id",
"type",
"txt_creator",
"txt_dateModified",
"txt_datePublished",
"description",
"txt_distribution",
"id_includedInDataCatalog",
"txt_includedInDataCatalog",
"txt_keywords",
"txt_license",
"name",
"id_provider",
"txt_provider",
"id_publisher",
"txt_publisher",
"geom_type",
"has_geom",
"geojson_point",
"geojson_simple",
"geojson_geom",
"geom_area",
"geom_length",
"the_geom",
"dt_startDate",
"n_startYear",
"dt_endDate",
"n_endYear",
"txt_temporalCoverage",
"txt_url",
"txt_variableMeasured",
"txt_version"
```

