# OBIS Depth review

## About

Note and comments on the OBIS data as related to depth values that might align 
with the guidance at:  XYZ

A simple query to look for the term "depth" in variable names for OBIS

```SPARQL
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <https://schema.org/>

SELECT ?sid ?name
WHERE {
    ?sid schema:variableMeasured ?prop .
    ?prop schema:name ?name .
    FILTER regex(str(?name), "depth", "i")
}
```

Find the unique instances of these names.  Note this is just the string
value and so it might have false matches.

```SPARQL
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <https://schema.org/>

SELECT ?name (COUNT(DISTINCT ?sid) as ?count)
WHERE {
    ?sid schema:variableMeasured ?prop .
    ?prop schema:name ?name .
    FILTER regex(str(?name), "depth", "i")
}
GROUP BY ?name ORDER BY DESC(?count)
```

This has some example output like the following.

| Object Name       | Count              |
|-------------------|------------------- |
| water depth	      | "36"^^xsd:integer |
| Depth (m)         | "14"^^xsd:integer |
| sampling_depth    | "12"^^xsd:integer |
| Water depth       | "9"^^xsd:integer  |
| MinimumDepth_cm	  | "8"^^xsd:integer  |
| MaximumDepth_cm	  | "8"^^xsd:integer  |
| sampling_depth_min| "7"^^xsd:integer  |


In terms of numerical values there are no uses 
of maxValue, minValue, or value in the variableMeasured
referenced types. 

We can start to look at associated data with the metadata
records. 

```SPARQL
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <https://schema.org/>

SELECT ?sid ?name ?url
WHERE {
    ?sid schema:distribution ?dist .
    ?dist schema:contentUrl ?url .
    ?sid schema:variableMeasured ?prop .
    ?prop schema:name ?name .
    FILTER regex(str(?name), "depth", "i")
}
```

We can also use the above SPARQL to find resources that
both mention depth and have distribution links.


They have depth values in the measurement tables, but 
in most cases depth will be in two Darwin Core fields 
that currently do not feed into variableMeasured.

It is part of the archive which is in distribution. 
See https://ipt.vliz.be/eurobis/archive.do?r=smhi-zoobenthos-reg 
for example which has >1M measurements.

These are Darwin Core Archive formats with the metadata
and table values.  These have tooling for them like 
https://python-dwca-reader.readthedocs.io/en/latest/tutorial.html
which can read and understand these archives.  

After installing and playing with this package for a few minutes
it was able to read the archives and scan on things like 
DarwinCore term: http://rs.tdwg.org/dwc/terms/maximumDepthInMeters.

Doing this for all archives in OBIS might be a bit much.  Though I 
don't know how many dwca files there are in the distribution
links.  It can be discussed further if needed.

At that point then, doing things like 

```python
core_df['maximumDepthInMeters'].max()  # 353.5 meters
```

is straightforward to process.  

## OBIS API leveraging

There's no way currently to get depth statistics by dataset from the API except by going through all records
but I wouldn't recommend that.
One thing you could do is get dataset lists for depth slices,
eg https://api.obis.org/dataset?startdepth=5000&enddepth=6000
This is not the best approach since you have to query by ranges and get the related resources it seems.
However, there is a parquet (and csv) export from https://obis.org/data/access/ .  Pieter said
that the parquet has depth in the form of the darwin
core fields minimumDepthInMeters and maximumDepthInMeters.   So this might be the best route.
Pieter doesn't have time to work on this right away, but it might be easy for us to make an
"auxiliary" graph that we can test with and also share with Pieter.  In the hopes it helps
him integrate the values into the production service eventually.
I am hoping that id in the parquet is the JSON-LD @id like https://obis.org/dataset/24e96d02-8909-4431-bc61-8cf8eadc9b7a
If that is the case this will be very easy!  I am currently pulling down the parquet (18 Gb)  and
will report what I find.


## References

* https://github.com/iodepo/odis-arch/blob/master/book/thematics/depth/index.md
* https://github.com/iodepo/odis-in/tree/master/SPARQL/OBIS (this document)