# Shapes

## About

Need to sync / coordinate with the 
[Geoshapes](https://github.com/geoschemas-org/geoshapes) repository.

[ODIS Solr Schema](https://github.com/iodepo/oih-ui/blob/main/solr/conf/schema.xml)

## Example use

The following command will pull a release graph from the OIH system and process it via a SHACL shape 
stored in GitHub.  This could also be used with various packages to generate reports like seen 
at [odis validation](https://github.com/iodepo/odis-arch/tree/schema-dev-df/workflows/output/validation) and
PDFs such as this [example report](https://github.com/iodepo/odis-arch/blob/schema-dev-df/workflows/output/validation/report_02-23-2023-06-46-07.pdf).
The details are then found in an [associated CSV document](https://github.com/iodepo/odis-arch/blob/schema-dev-df/workflows/output/validation/validationReport_02-23-2023-06-46-07.csv)


```bash

curl http://ossapi.oceaninfohub.org/public/graphs/summonedafricaioc_v1_release.rdf |   pyshacl -s https://raw.githubusercontent.com/iodepo/odis-arch/schema-dev-df/code/SHACL/oih_search.ttl -sf turtle -df n3 -f table -

```

## Resources

* [pySHACL](https://github.com/RDFLib/pySHACL)

## Examples

```bash
curl http://ossapi.oceaninfohub.org/public/graphs/summonedcioos_v1_release.rdf |   pyshacl -s https://raw.githubusercontent.com/iodepo/odis-arch/schema-dev-df/code/SHACL/typesAreURI.ttl -sf turtle -df n3 -f table -
```

local exmaple

```bash
  pyshacl -s typesAreURI.ttl -sf turtle -df nt -f table data.nt 

```


### BioDiversity topics

Must have: 

* Title
* Abstract
* Contacts
* License
* Citation

Nice to have:

* Spatial coverage
* Temporal coverage
* Taxonomic scope (I guess schema:taxonomicRange)
* Measurement types (schema:variableMeasured)
* Measurement methods (schema: measurementMethod)

## ERDDAP

This section address some of uses of SHACL for ERDDAP.  Be sure you have installed
[pyshacl](https://pypi.org/project/pyshacl/) first.   

We can pull the JSON-LD from a document with the 
following cute UNIX command.

```bash
curl -s  --header "Accept: text/html"   https://osmc.noaa.gov/erddap/info/anibos_movement_data/index.html | sed -n '/<script type=\"application\/ld+json\">/,/<\/script>/p' | sed 's/<\/script>//' | sed 's/<script type=\"application\/ld+json\">//'
```

We can save this to a file like [erddap_anibos_example.json](erddap_anibos_example.json). Note that the context in this file has been updated to 

```json
"@context": {
    "@vocab": "https://schema.org/"
  }
```

since the original context has some issues around the resolution of 
the context name space. 

We can use the pyshacl tool to test this.   A command like 

```bash
pyshacl -s ERDDAP.ttl -sf turtle -df json-ld -f table erddap_anibos_example.json
```

will test erddap_anibos_example.json using the shape graph in ERDDAP.ttl and 
provide the results in a table format.   Example of the output can be seen below.  

```bash
(.venv) ➜  shapeGraphs git:(master) ✗ pyshacl -s ERDDAP.ttl -sf turtle -df json-ld -f table erddap_anibos_example.json

+----------+
| Conforms |
+----------+
|  False   |
+----------+

+-----+----------+---------------------------+---------------------------+---------------------------+---------------------------+---------------------------+---------------------------+
| No. | Severity | Focus Node                | Result Path               | Message                   | Component                 | Shape                     | Value                     |
+-----+----------+---------------------------+---------------------------+---------------------------+---------------------------+---------------------------+---------------------------+
| 1   | Warning  | N3fda2b31d0d5458b90a7a10f | https://schema.org/contac | Contact information shoul | MinCountConstraintCompone | https://oceans.collaboriu | -                         |
|     |          | e1eb1f5d                  | ts                        | d be provided             | nt                        | m.io/voc/validation/1.0.1 |                           |
|     |          |                           |                           |                           |                           | /shacl#coreContacts       |                           |
|     |          |                           |                           |                           |                           |                           |                           |
| 2   | Warning  | N3fda2b31d0d5458b90a7a10f | https://schema.org/citati | Citation information shou | MinCountConstraintCompone | https://oceans.collaboriu | -                         |
|     |          | e1eb1f5d                  | on                        | ld be provided            | nt                        | m.io/voc/validation/1.0.1 |                           |
|     |          |                           |                           |                           |                           | /shacl#coreCitation       |                           |
|     |          |                           |                           |                           |                           |                           |                           |
| 3   | Warning  | N3fda2b31d0d5458b90a7a10f | https://schema.org/measur | measurement method check  | MinCountConstraintCompone | https://oceans.collaboriu | -                         |
|     |          | e1eb1f5d                  | ementMethod               |                           | nt                        | m.io/voc/validation/1.0.1 |                           |
|     |          |                           |                           |                           |                           | /shacl#recMesMethod       |                           |
|     |          |                           |                           |                           |                           |                           |                           |
| 4   | Warning  | N3fda2b31d0d5458b90a7a10f | -                         | Graph requires ID         | NodeKindConstraintCompone | https://oceans.collaboriu | N3fda2b31d0d5458b90a7a10f |
|     |          | e1eb1f5d                  |                           |                           | nt                        | m.io/voc/validation/1.0.1 | e1eb1f5d                  |
|     |          |                           |                           |                           |                           | /shacl#IDShape            |                           |
|     |          |                           |                           |                           |                           |                           |                           |
+-----+----------+---------------------------+---------------------------+---------------------------+---------------------------+---------------------------+---------------------------+%                             
```
       




