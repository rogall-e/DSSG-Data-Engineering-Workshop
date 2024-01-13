## A quick Introduction to DBT

DBT is pretty powerful and you can do a lot of fancy stuff with it. But let's keep it simple first and focus on the basic **dbt project structure** first:

``` 
my_dbt_project
├── dbt_project.yaml
├── profiles.yaml
└── models
    ├── pokemon__model_a.sql
    ├── pokemon__model_b.sql
    ├── ...
    └── schema.yaml
```

---


### `dbt_project.yaml`

In the `dbt_project.yaml`, you can define the metadata of your project. For example:

- Naming
- How to store your tables?
- Defining directories

??? note "An example model `dbt_project.yaml` file"

    ```yaml
    name: 'pokemon_analytics'
    version: '1.0.0'
    config-version: 2

    profile: 'postgres'

    model-paths: ["models"]

    target-path: "target"  
    clean-targets:         
    - "target"
    - "dbt_packages"

    models:
        pokemon_analytics:
            materialized: table
            intermediate:
            +schema: intermediate
            analytics:
            +schema: analytics
    ```
---

### `profiles.yaml`

The `profiles.yaml` holds all of your connection information. Here you can add multiple outputs (for example database environments).

??? note "An example model `profiles.yaml` file"

    ```yaml
    postgres:
    target: dev
    outputs:
        dev:
        type: postgres
        host: localhost
        port: 5432
        dbname: pokemon
        user: postgre
    ```
---

### `models/`

DBT uses the term *model* to define a sql logic. So each model represents a `.sql` file. In the models directory, you can also use subdirectories to organize your models (e.g. "finance models", "marketing models", etc.).

Within your models directory, you can also create documentation and declare tests for your models. You can do that by simply creating another `.yaml` file and fill it with the required information.

??? note "An example model `schema.yaml` file"

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

---

### `ref()`

As mentioned above, dbt is using `jinja templating` to boost your SQL development.

Maybe the most famous use of jinja in DBT is the `ref()` function, which is used to reference other DBT models. 

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

---

### Running dbt

There are multiple DBT commands to choose from. Here are the basic ones:

```bash
dbt run     # creates all models
dbt test    # runs all tests
dbt build   # runs both commands for each model
```

With `dbt run`, dbt checks your models directory and runs all of your models in the correct order.

If you want to select a specific model or directory you can use `--select`:

```bash
dbt build --select 1_staging  # runs and tests all models in the 1_staging directory
dbt build --select stg__pokemon__donations # rund and tests ONLY the model called stg__pokemon__donations
```

You can also create a webserver with all of your documentation:

```bash
dbt docs generate 
dbt docs serve
```

If you want to compile your jinja sql model, use:

```bash
dbt compile --select stg__pokemon__donations # compiles the models outputs the actual sql that runs on your database
```
