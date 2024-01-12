select
    pokemon_id,
    donation_date,
    donation_amount_eur,
    donation_number_of_pokemon
from 
    {{ source("pokemon_load", "pokemon__donations",) }}
group by 
    pokemon_id,
    donation_date,
    donation_amount_eur,
    donation_number_of_pokemon
