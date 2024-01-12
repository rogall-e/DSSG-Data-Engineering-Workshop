select
    pokemon_identifier as pokemon_id,
    pokemon_name,
    pokemon_type
from 
    {{ source("pokemon_load", "pokemon__masterdata",) }}
group by 
    pokemon_id,
    pokemon_name,
    pokemon_type