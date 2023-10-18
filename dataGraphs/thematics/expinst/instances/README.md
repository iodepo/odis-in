# DRAWG schema.org mapping exploration

: Note:  This is a work in prgress
: The mapping and validation approaches are still actively being improved

## About

This is a very quick take on mapping the properties identified in by the DRAWG
to the schema.org vocabulary.  

The currently mapping is provided below.  This is just a 0th order mapping and there
several properties that could be mapped in other approaches. 

## Mapping 

The mapping of DRAWG properties was agains the [schema.org/Organization](https://schema.org/Organization)
type.  Many of the properties map director to those in that type.  Properties like
name, url, description etc, can be easily mapped.  

Some items are less obvious.  Items like _Terms of Deposit_ or _Curation_ are harder to 
map.  In this simple version, the property _schema.org/publicationPrinciples_ has been 
used to indicate a link to a document hosted by the organization to detail these
approaches.

Some of these, however, might be able to be mapped to a set of types 
and properties that more explicately represent the data in the vocabulary
rather than a simple "see this link" approach.



| Attribute               | Mapping |
|------------------------|---------|
| Repository Name        | schema:name                  |
| URL                    | schema:url                   |
| Country                | schema:address               |
| Language               | schema:language              |
| Institution            | schema:member                |
| Contact                | schema:contactPoint          |
| Description            | schema:description           |
| Research Area          | schema:keywords              |
| Persistent Identifiers | schema:identifier            |
| Machine Interoperability| schema:publicationPrinciples |
| Metadata               | schema:publicationPrinciples |
| Curation               | schema:publicationPrinciples |
| Terms of Deposit       | schema:publicationPrinciples |
| Terms of Access        | schema:publicationPrinciples |
| Dataset Use License    | schema:publicationPrinciples |
| Certification          | schema:hasCertificate        |
| Preservation Policy    | schema:publicationPrinciples |



## SHACL representation

A nice benefit of a machine readable representation is that there methods 
for validation.  RDF graphs are no exception and there are mutliple ways and approaches
for validation. The one selected here is the [Shapes Constraint Language (SHACL)](https://www.w3.org/TR/shacl/).

SHACL allows us to define a set of conditions we expect to find in a data graph. A simple 
set of these conditions has been built for the draft mapping to demonstrate this.

We can then use a wide range of SHACL processor implementation to test this. For this case
we have selected [pySHACL](https://github.com/RDFLib/pySHACL).


```bash
❯ pyshacl -s RDA_DWAG_shape.ttl -sf turtle -df json-ld -f table oceaninfohub.json
+----------+
| Conforms |
+----------+
|   True   |
+----------+
```

### Invalid case

More interesting might be a case where there are errors.   An example of this is below
where some of the properties are removed. 



```bash
❯ pyshacl -s RDA_DWAG_shape.ttl -sf turtle -df json-ld -f table ../dataGraphs/thematics/expinst/instances/oceaninfohubBAD.json
+----------+
| Conforms |
+----------+
|  False   |
+----------+

+-----+-----------+------------------------+---------------------------+---------------------------+---------------------------+---------------------------+-------+
| No. | Severity  | Focus Node             | Result Path               | Message                   | Component                 | Shape                     | Value |
+-----+-----------+------------------------+---------------------------+---------------------------+---------------------------+---------------------------+-------+
| 1   | Violation | https://git.raw/x/id/1 | https://schema.org/name   | Name is required          | MinCountConstraintCompone | https://oceans.collaboriu | -     |
|     |           |                        |                           |                           | nt                        | m.io/voc/validation/1.0.1 |       |
|     |           |                        |                           |                           |                           | /shacl#nameResourceProper |       |
|     |           |                        |                           |                           |                           | ty                        |       |
|     |           |                        |                           |                           |                           |                           |       |
| 2   | Violation | https://git.raw/x/id/1 | https://schema.org/descri | Resource must have a desc | MinCountConstraintCompone | https://oceans.collaboriu | -     |
|     |           |                        | ption                     | ription                   | nt                        | m.io/voc/validation/1.0.1 |       |
|     |           |                        |                           |                           |                           | /shacl#descriptionResourc |       |
|     |           |                        |                           |                           |                           | eProperty                 |       |
|     |           |                        |                           |                           |                           |                           |       |
+-----+-----------+------------------------+---------------------------+---------------------------+---------------------------+---------------------------+-------+%
```



### Severity mapping

On inspection of the draft document https://docs.google.com/document/d/137qVrE7ieZAcbdbFDNSLOzmzUR6HjQQo4-_jDzRrYJ0/edit 
the _Gap analysis__ value was used to map to SHACL severity.  I have choosen to map easy to provide
items to a violation on the belief that easy items should be expected.  

Items for gap levels 2 and 3 then represent a Warning and Info level severity respectively.  Again, 
going on the approach that items that are very rare to be provided are items we should expect less, at least in 
terms of a validation test.  

An example of running the SHACL shape graph against the draft implementation would result, in a valid case,
with the following. 


| DRAWG Gap value                                | SHACL Severity |  Description |
|------------------------------------------------|----------------|----------------|
| Gap analysis: 1 - Easy to find                 |  sh:Violation  |	A constraint violation |
| Gap analysis: 2 - Difficult to find            |  sh:Warning    | A non-critical constraint violation indicating a warning |
| Gap analysis: 3 - Very difficult to find or does not exist  |  sh:Info |	A non-critical constraint violation indicating an informative message |



