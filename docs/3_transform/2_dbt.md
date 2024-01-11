## DBT - Data Build Tool

**[DBT](https://www.getdbt.com/)** is a tool, which helps us to manage our data transformation logic. 

Using dbt is at easy as writing some SQL statements and running them in the correct order with only **one command**. DBT will then take care of the rest.

Next to executing SQL in the correct order, DBT also has some other nice features. Some examples:

- DBT has knowledge of your data **lineage**
- DBT can **test** your data
- DBT helps with writing **documention** on your data
- DBT facilitates the use of the **DRY** principle (*Don't Repeat Yourself*)

### One word on the DRY principle (aka *jinja templating*)

DBT enables the use of *jinja templating*. This means, that you can use variables and loops in your SQL statements.

This is especially useful, if you have to repeat the same logic over and over again.

So instead of writing the same SQL statement multiple times, you can use a variable and loop over it.

Here is an example:

```sql
-- This is a jinja variable
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
{% set my_favorite_columns = ['column_a', 'column_b', 'column_c'] %}

-- This is a jinja loop
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
SELECT 
    {% for item in my_variable %}
        item {%- if not loop.last %},{% endif %}
    {% endfor %}
FROM 
    my_schema.my_table

-- This compiles to this:
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
SELECT 
    column_a, 
    column_b, 
    column_c
FROM
    my_schema.my_table
```

You can also store jinja templates as so called **macros** and call them kinda like functions in your SQL statements. 

The most famous use of jinja in DBT is the `ref()` function, which is used to reference other DBT models:

```sql
-- With the ref() function you can reference other DBT models:
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
SELECT 
    *
FROM 
    {{ ref(my_table) }} 

-- This compiles to this:
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
SELECT 
    *
FROM
    my_schema.my_table
```

More on that here: **[DBT Macros](https://docs.getdbt.com/docs/build/jinja-macros)**