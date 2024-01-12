select
    pokemon_id,
    donation_date,
    donation_amount_eur,
    donation_number_of_pokemon
from 
    {{ source("pokemon_sources", "pokemon__donations",) }}
group by 
    pokemon_id,
    donation_date,
    donation_amount_eur,
    donation_number_of_pokemon
