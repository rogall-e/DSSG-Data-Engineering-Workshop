# DuckDB

[DuckDB](https://duckdb.org/) is an open-source analytical SQL database management system designed for high performance and efficiency. It's built to excel in handling complex analytical queries on large volumes of data while maintaining a lightweight footprint. DuckDB is known for its exceptional speed in executing queries and its ability to operate seamlessly within various environments, from laptops to large-scale server setups.

One of its standout features is its support for standard SQL queries, making it accessible to users familiar with SQL syntax. Additionally, DuckDB is optimized for read-heavy workloads, making it an ideal choice for data exploration, analytics, and research purposes.

DuckDB also provides integration with popular data science tools like Jupyter Notebooks and Pandas, facilitating a smooth workflow for analysts and data scientists. Its compatibility with Jupyter Notebooks allows for an interactive and collaborative environment where users can harness DuckDB's power alongside their code and analysis.

Moreover, DuckDB's integration with Pandas simplifies data manipulation and analysis. It enables the execution of SQL queries directly on Pandas DataFrames, providing a familiar interface for those comfortable with Pandas while leveraging DuckDB's speed and efficiency for data processing.

Another notable aspect is that it can handle various data formats such as CSV, Parquet, and others. And let's you interact with these formats through SQL queries streamlines the process of querying and analyzing diverse data sources without the need for extensive data preprocessing.

So DuckDB offers a user-friendly environment for data exploration, analysis, and manipulation. It's a great choice for those looking to leverage the power of SQL for data science and analytics.

## Using DuckDB to load a csv file

You can query a csv file directly with DuckDB. This is very useful for data exploration and analysis. 
```sql
SELECT * FROM 'flights.csv';
```
or you can create a table from a csv file and query it later on.

```sql
CREATE TABLE ontime(FlightDate DATE, UniqueCarrier VARCHAR, OriginCityName VARCHAR, DestCityName VARCHAR);
COPY ontime FROM 'flights.csv' (AUTO_DETECT true);
```

you can even write the results of a query to a csv file.

```sql
COPY (SELECT * FROM ontime) TO 'flights.csv' WITH (HEADER 1, DELIMITER '|');
```

## Using DuckDB with Pandas

You can use DuckDB with Pandas i.e. save queries into an pandas dataframe. 

```python
import duckdb
import pandas as pd

# this will create a duckdb database in memory
con = duckdb.connect(database=':memory:', read_only=False)

# this will create a table in the duckdb database
con.execute("CREATE TABLE ontime(FlightDate DATE, UniqueCarrier VARCHAR, OriginCityName VARCHAR, DestCityName VARCHAR);")

# this will copy the data from the csv file into the duckdb database
con.execute("COPY ontime FROM 'flights.csv' (AUTO_DETECT true);")

# this will query the data from the duckdb database and return a pandas dataframe
df = con.execute("SELECT * FROM ontime").df()
```

But you can also use DuckDB to query a pandas dataframe directly. 

```python
import duckdb
import pandas as pd

# load the csv file into a pandas dataframe
df = pd.read_csv('flights.csv')

# this will query the data from the pandas dataframe and return a duckdb resultset
duckdb.sql('Select * from df').fetchall()

# create a duckdb database in memory
con = duckdb.connect(database=':memory:', read_only=False)

# this will create a table in the duckdb database from the pandas dataframe
con.execute('CREATE TABLE df_table AS SELECT * FROM df')
``` 


If you want to try this out yourself and also see how it integrates into jupyter notebooks, have a look into the [Intro to DuckDB juptyer notebook](../../Intro_to_duckdb.ipynb).