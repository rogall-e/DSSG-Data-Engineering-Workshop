import duckdb
import os

root_path = os.path.dirname(__file__)
duckdb_path = os.path.join(root_path, 'pokemon.duckdb')

con = duckdb.connect(database=duckdb_path)

# create load schema on duckdb if not exists
load_schema_name = 'pokemon_load'
con.sql(f"CREATE SCHEMA IF NOT EXISTS {load_schema_name}")

# write csv to duckdb
csv_name = 'pokemon__masterdata'
con.execute(f"CREATE OR REPLACE TABLE {load_schema_name}.{csv_name} AS SELECT * FROM read_csv('{root_path}/{csv_name}.csv', AUTO_DETECT=TRUE);")

# # write json to duckdb
json_name = 'pokemon__donations'
con.execute(f"CREATE OR REPLACE TABLE {load_schema_name}.{json_name} AS SELECT * FROM read_json('{root_path}/{json_name}.json', AUTO_DETECT=TRUE);")