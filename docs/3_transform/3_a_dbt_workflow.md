## A DBT Workflow

To get a full overview of DBTs capabilities, please check out the **[DBT Documentation](https://docs.getdbt.com/docs/introduction)**.

A typical DBT workflow starts with creating some DBT **models** (*= SQL statements*) in your model folder:

``` 
models
├── pokemon__model_a.sql
├── pokemon__model_b.sql
├── pokemon__model_c.sql
└── schema.yml
```

In the `schema.yml` file, you can write some documentation on your models and define tests. For example:

```yaml
version: 2
models:
- name: pokemon__model_a
  description: This table is super nice!
  columns:
    - name: pokemon_id
      desription: Unique identifier for a pokemon.
      tests:
        - unique
        - not_null
```

With this .yaml we are saying, that the column `pokemon_id` in the model `pokemon__model_a` should be unique and not null. 

DBT will then automatically test this for us and throw an error, if the test fails.

After creating your models, you can create your models with the following commands:

```bash
dbt run     # creates all models
dbt test    # runs all tests
dbt build   # runs both commands for each model
```

DBT has now executed all your models in the correct order and created the corresponding tables in your database.