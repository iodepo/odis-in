Common Descriptive Attributes of the Purdue University Research Repository, based on [v.05 draft](https://docs.google.com/document/d/137qVrE7ieZAcbdbFDNSLOzmzUR6HjQQo4-_jDzRrYJ0/edit?usp=sharing)

Research Data Alliance Data Repository Attributes Working Group (DRAWG)

Draft Version 0.1 as of September 2023

Authors: Michael Witt ([ORCID](https://orcid.org/0000-0003-4221-7956))

This example implementation of the DRAWG common descriptive attributes provides values and references for each of the attributes as they are expressed and exposed by the repository.

Summary: PURR presents a web interface with navigable policies, documentation, and an FAQ that describe its services and collections to its users. Some details beyond those provided below require authentication and are presented in the context of specific repository workflows. For machine access, some very basic information about the repository is provided by its OAI-PMH interface, which can also be used to harvest the metadata of datasets in Dublin Core or Qualified Dublin Core. Additional metadata is embedded in each HTML page using RDFa that provides structured metadata in the context of the page being viewed, e.g., metadata for a dataset on the landing page of the dataset. In a similar manner, metadata in RDF is furnished through embedded rel links. There is no public machine access to data offered by the repository.

1. Repository Name: Purdue University Research Repository; PURR; from front landing page and footer on every page.

1. URL: Implicit; [https://purr.purdue.edu](https://purr.purdue.edu)

1. Country: United States is implicit through contact information; [PURR - Contact Us](https://purr.purdue.edu/contact-us)

1. Language: Implicitly in English; formal language declaration in html header.

5. Institution: Purdue University; stated in footer on every page.

6. Contact: 
   - General contacts: [PURR - Contact Us](https://purr.purdue.edu/contact-us); [purr@purdue.edu](mailto:purr@purdue.edu); Research Data Office, WALC, Suite 2032, 340 Centennial Mall Drive, West Lafayette, IN 47907
   - Technical support issue reporting: [PURR - Support: Tickets: New](https://purr.purdue.edu/support/ticket/new)
8. Description: [PURR - Knowledge Base: About PURR: What is PURR?](https://purr.purdue.edu/kb/aboutpurr/whatispurr); “The Purdue University Research Repository (PURR) is a data repository for original research data produced by Purdue faculty, graduate students, and staff. PURR provides an online, collaborative working space and data-sharing platform to support the data management needs of Purdue researchers and their collaborators.”

9. Research Area: Multidisciplinary; [PURR - Knowledge Base: Sharing Data: What can I publish in PURR?](https://purr.purdue.edu/kb/sharingdata/suitablecontent); “Any Purdue researcher - faculty, staff, or student - can use PURR to publish research data on any topic.”

10. Persistent Identifiers: 
    - PURR will help new researchers create an ORCID ID and uses it in publication metadata; [PURR - Knowledge Base: Accounts: How do I link PURR to my ORCID account?](https://purr.purdue.edu/kb/accounts/orcid)

    - PURR mints DOIs for published datasets; [PURR - Knowledge Base: About PURR: What is a DOI?](https://purr.purdue.edu/kb/aboutpurr/doi) & [PURR - Two ways to share your data with PURR](https://purr.purdue.edu/sharedata)

    - PURR can optionally mint DOIs for registered datasets; [PURR - Knowledge Base: Sharing Data: How does the PURR registry work?](https://purr.purdue.edu/kb/sharingdata/registry)
12. Machine Interoperability: 
    - OAI-PMH; [PURR - Knowledge Base: Finding and Using Data: Open Archives Initiative Protocol for Metadata Harvesting](https://purr.purdue.edu/kb/finduse/oaipmh)

    - RDFa [embedded in context in web pages; not documented]

    - Project functionality (data ingest) supports sftp and Globus; [PURR - Knowledge Base: Projects and Files: How do I connect to my Project using an SFTP client?](https://purr.purdue.edu/kb/projects/connect-to-project-using-sftp-client) & [PURR - Knowledge Base: Projects and Files: How can I transfer data to PURR via Globus?](https://purr.purdue.edu/kb/projects/how-can-i-transfer-data-to-purr-via-globus)
14. Metadata: Datasets are described using Qualified Dublin Core with Library of Congress Subject Headings (LCSH) and custom keywords; [PURR - Knowledge Base: Metadata and Supporting Documents](https://purr.purdue.edu/kb/metadata) & [PURR - Knowledge Base: Metadata and Supporting Documents: What subject metadata tags does PURR use?](https://purr.purdue.edu/kb/metadata/subject-tags)

15. Curation: Submitted datasets are reviewed by PURR staff to ensure that they are complete and well-described within two business days of submission; [PURR - Publishing Data](https://purr.purdue.edu/publishingdata) & [PURR - Knowledge Base: Sharing Data: Who reviews my submitted publications?](https://purr.purdue.edu/kb/sharingdata/dataset-submission-review)

16. Terms of Deposit: 
    - Depositing data is generally referenced as publishing data by the repository.

    - Purdue students, faculty, and staff can publish up to 1G of data from each “basic” project they own without cost. This increases to 10G if a grant award is associated with a “supported” project. Additional publication storage can be purchased for $9.90/GB; [PURR - Knowledge Base: Sharing Data: What can I publish in PURR?](https://purr.purdue.edu/kb/sharingdata/suitablecontent) & [PURR - PURR Project Space Allocation and Pricing](https://purr.purdue.edu/pricing)

    - Legal language spells out the rights granted and liabilities in Terms of Deposit; [PURR - Purdue University Research Repository (PURR) Terms of Deposit](https://purr.purdue.edu/legal/termsofdeposit)

    - Additional restrictions are placed on data that may be covered by IRB, HIPAA, FERPA, or government export control; [PURR - Knowledge Base: Sharing Data: Can I use PURR with sensitive or restricted data such as IRB, HIPAA, and FERPA?](https://purr.purdue.edu/kb/sharingdata/sensitivedata) & [PURR - Knowledge Base: Licenses and Restrictions: Does PURR have data restrictions?](https://purr.purdue.edu/kb/licensingrestrictions/data-restrictions)
18. Terms of Access: 
    - The use of the repository, data and services are covered in legal language in a Terms of Use, [PURR - Purdue University Research Repository (PURR) Terms of Use](https://purr.purdue.edu/legal/terms)

    - Depositors are able to publish data under an embargo of up to 10 years; [PURR - Knowledge Base: Sharing Data: Can I publish my data under an embargo?](https://purr.purdue.edu/kb/sharingdata/embargo)

    - Some datasets are registered and may be available outside of the repository; [PURR - Knowledge Base: Sharing Data: How does the PURR registry work?](https://purr.purdue.edu/kb/sharingdata/registry)
20. Dataset Use Licence: 
    - Open access; “Explore the open data behind Purdue's world-class research.”; [https://purr.purdue.edu](https://purr.purdue.edu/)

    - Depositors ascribed a license from a list available from the repository that governs the use of the data. Depositors may request a different license by submitting a support ticket, and the license will be reviewed and approved or not for use; [PURR - Knowledge Base: Licenses and Restrictions: Licenses Used in PURR](https://purr.purdue.edu/kb/licensingrestrictions/licenses) & [PURR - Knowledge Base: Licenses and Restrictions: Choosing a License](https://purr.purdue.edu/kb/licensingrestrictions/choosingalicense).
22. Certification: Currently reported as being in progress; [PURR - Knowledge Base: Preservation: What is a Trustworthy Digital Repository?](https://purr.purdue.edu/kb/preservation/what-is-a-trustworthy-digital-repository)

23. Preservation Policy: 
    - PURR commits to preserving data for a minimum of 10 years. At the end of 10 years, data are remanded to the university library and managed under its collections policies; [PURR - PURR Digital Preservation Policy](https://purr.purdue.edu/legal/digitalpreservation)

    - Preservation strategies and actions are outlined in a preservation strategic plan; [PURR - PURR Preservation Strategic Plan](https://purr.purdue.edu/legal/preservation-strategies)

    - Three levels of preservation support are described and based on whether or not recommended file formats are used; [PURR - File Format Recommendations](https://purr.purdue.edu/legal/file-format-recommendations) & [PURR - Preservation Support Policy](https://purr.purdue.edu/legal/preservation-support-policy)

    - PURR uses MetaArchive, which is a member organization and preservation infrastructure that is based on LOCKSS; [PURR - Knowledge Base: About PURR: How often is my data backed up?](https://purr.purdue.edu/kb/aboutpurr/data-backup)
