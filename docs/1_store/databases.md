# Storing Data

As you might imagine, storing data in key in data disciplines, so there is no way around this today. You can store data in tons of ways and we do not need to explain you all as you are most likely familiar with lots of them. Today we will therefore focus on one data storing solution that we hope is a good start into data warehousing: [DuckDB](https://duckdb.org/).

You might have heard of SQLite before. DuckDB is very similar to SQLite, but it is optimized for analytical queries. It is also very easy to use and you can run it on your laptop.

Think of DuckDB as a spreadsheet that is stored on your computer. You can run queries against it and you can also connect to it from other tools. We could also use Excel or Google Sheets for this, but DuckDB is a bit more powerful and it is also free and open source. The most relevant advantage for us is that we can run SQL queries against it. This will be very useful for us later on.

<!-- ![file-formats](../assets/img/placeholder.webp) -->

## Why SQL is great.
We know that you probably love your pandas. But today there will be no fluffy stuff for you. We will use SQL. SQL is the most widely used language for data analysis and it is also the most widely used language for data warehousing. It is a very powerful language and it is also very easy to learn. This also means that lots of other people outside of the data bubble have at least some knowledge of SQL. Software engineers, product managers, business analysts, and many others. This makes SQL a great tool to communicate with other people in your company and get people on board in answering questions with data.

**We want things to be boring!** 
Boring things have tons of benefits. They tend to stay boring in the same way which means they will work the same way in 5 or 10 or 20 years. At least chances are much higher.

<!-- ## The right tools for the right job. -->

### SQL Syntax in 5 minutes. aka. DML, DDL, DCL...
When you look at the SQL Syntax you may notice that at least most simple things will be tackled quite similar all the time. Of course you still have freedom to do things a bit different in SQL. But I would claim that chances are much higher for two people to write the same SQL code for a given task compared to them writting the same Pandas code. 

#### 1.Creating a Table:
=== "SQL"

    ``` sql 
    CREATE TABLE Employees (
        ID INT,
        Name VARCHAR(50),
        Age INT
    );
    ```

=== "Pandas"

    ``` Python
    import pandas as pd
    df = pd.DataFrame(columns=['ID', 'Name', 'Age'])
    ```

#### 2.Inserting Data:
=== "SQL"

    ``` sql 
    INSERT INTO Employees (ID, Name, Age)
    VALUES (1, 'John', 30),
          (2, 'Jane', 25),
          (3, 'Smith', 35);
    ```

=== "Pandas"

    ``` Python
    data = {'ID': [1, 2, 3],
            'Name': ['John', 'Jane', 'Smith'],
            'Age': [30, 25, 35]}
    df = pd.DataFrame(data)
    ```

#### 3.Querying Data:
=== "SQL"

    ``` sql 
    SELECT * FROM Employees;
    ```

=== "Pandas"

    ``` Python
    print(df)
    ```

#### 4. Aggregations
### Comparison to Pandas
