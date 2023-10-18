# DRAWG schema.org mapping exploration

## About

This is a very quick take on mapping the properties identified in by the DRAWG
to the schema.org vocabulary.  

The currently mapping is provided below.  This is just a 0th order mapping and there
several properties that could be mapped in other approaches. 


## SHACL representation

### Severity mapping

On inspection of the draft document https://docs.google.com/document/d/137qVrE7ieZAcbdbFDNSLOzmzUR6HjQQo4-_jDzRrYJ0/edit 
the _Gap analysis__ value was used to map to SHACL severity.  I have choosen to map easy to provide
items to a violation on the belief that easy items should be expected.  

Items for gap levels 2 and 3 then represent a Warning and Info level severity respectively.  Again, 
going on the approach that items that are very rare to be provided are items we should expect less, at least in 
terms of a validation test.  


| DRAWG Gap value                                | SHACL Severity |  Description |
|------------------------------------------------|----------------|----------------|
| Gap analysis: 1 - Easy to find                 |  sh:Violation  |	A constraint violation |
| Gap analysis: 2 - Difficult to find            |  sh:Warning    | A non-critical constraint violation indicating a warning |
| Gap analysis: 3 - Very difficult to find or does not exist  |  sh:Info |	A non-critical constraint violation indicating an informative message |



## Mapping 



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


