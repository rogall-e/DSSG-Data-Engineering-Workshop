# Data Sources
Almost everything that you gives you structured information in some way can act as a data source for your data ingestion.
We already discussed spreadsheets but there is much more. You can get data from databases, APIs, files, and many more:

- Static Files (e.g. CSV, JSON, XML, ...)
- APIs (e.g. REST, GraphQL, ...) -> That also serve something like JSON
- other Databases (e.g. Postgres, MySQL, ...)

![internal-sketch](../assets/img/data-sources.png)

!!! note
    There might be differences between internal and external data sources. For example, you might be able to access your internal databases directly, but you might have to use an API to access external data sources and have no idea about the implementation details of the data.
