select
    pokemon_identifier as pokemon_id,
    pokemon_name,
    pokemon_type
from 
    {{ source("pokemon_sources", "pokemon__masterdata",) }}
group by 
    pokemon_identifier,
    pokemon_name,
    pokemon_type