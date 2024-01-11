## How to get create Metrics from Raw Data?

To create such KPIs, we need to **transform** our raw data into something more meaningful.

A typical workflow might look like this:

<br />
<div style="text-align: center;">
```mermaid
flowchart LR
    SA(Raw Data) --- Q1[Transformation]:::empty
    Q1 --> T1(Metric)
    classDef empty width:150px,height:0px;
```
</div>
<br />

Transformation can be anything (*Aggregations, Joins, Calculations, etc.*) and can also be executed in many different ways. 

How the logic of a transformation is done, depends on the use case, your business questions and requirements.

One of the preferred ways of encoding transformation logic in the data world is **SQL**. 

As mentioned before, SQL is a very powerful and easy to learn language. So it makes sense to also use it for our transformations.

Typically, we would write different SQL statements with different kind of transformations and execute them in the correct order:

<br />
<div style="text-align: center;">
```mermaid
flowchart LR
    SA(Source A) --- Q1[SQL Query 1]
    Q1 --> T1([Table 1])

    SB(Source B) --- Q2[SQL Query 2]
    Q2 --> T2([Table 2])

    T1 --- Q[SQL Query 3]
    T2 --- Q
    Q --> T3([Table 3])
```
</div>
<br />

In this example, we have two different sources, which we first want to transform (e.g. do some cleaning or filtering) and then join into a new table.

As you can imagine, this can get quite complex and hard to maintain. Especially if you have many different sources and transformations.

But worry no longer, there is a solution for this problem: **[DBT](https://www.getdbt.com/)**