# SQL Syntax in 5 minutes. aka. DML, DDL, DCL...
When you look at the SQL Syntax you may notice that at least most simple things will be tackled quite similar all the time. Of course you still have freedom to do things a bit different in SQL. But I would claim that chances are much higher for two people to write the same SQL code for a given task compared to them writting the same Pandas code. 


SQL is split into three different categories:

- DDL (Data Definition Language): CREATE, ALTER, and DROP
- DML (Data Manipulation Language): SELECT, INSERT, UPDATE, and DELETE
- DCL (Data Control Language): GRANT and REVOKE


#### 1.Creating a Table:
=== "SQL"

    ``` sql 
    CREATE TABLE Employees (
        ID INT,
        Name VARCHAR(50),
        Age INT,
        Group VARCHAR(50)
    );
    ```

=== "Pandas"

    ``` Python
    import pandas as pd
    df = pd.DataFrame(columns=['ID', 'Name', 'Age', 'Group'])
    ```

#### 2.Inserting Data:
=== "SQL"

    ``` sql 
    INSERT INTO Employees (ID, Name, Age, Group)
    VALUES (1, 'John', 30, 'A'),
          (2, 'Jane', 25, 'B'),
          (3, 'Smith', 35, 'A');
    ```

=== "Pandas"

    ``` Python
    data = {'ID': [1, 2, 3],
            'Name': ['John', 'Jane', 'Smith'],
            'Age': [30, 25, 35]}
            'Group': ['A', 'B', 'A']}
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
=== "SQL"

    ``` sql 
    SELECT AVG(Age) as AverageAge, MAX(Age) as MaxAge
    FROM Employees
    GROUP BY Group;
    ```

=== "Pandas"

    ``` Python
    grouped_df = df.groupby('Group').mean()
    ```


#### 5. Permissions
=== "SQL"

    ``` sql
    GRANT SELECT, INSERT, UPDATE, DELETE ON employees TO user1;
    ```

=======

