select 
    md.pokemon_id,
    md.pokemon_name,
    md.pokemon_type,
    coalesce(da.total_number_of_pokemon_donaters,0) as total_number_of_pokemon_donaters,
    coalesce(da.total_amount_donated_eur,0) as total_amount_donated_eur,
    coalesce(da.average_donation_amount_eur_per_pokemon_donator,0) as average_donation_amount_eur_per_pokemon_donator
from 
    {{ source("pokemon_load", "pokemon__masterdata",) }} md
left join 
    {{ ref("pokemon__donations__aggregated") }} da
    on md.pokemon_id = da.pokemon_id