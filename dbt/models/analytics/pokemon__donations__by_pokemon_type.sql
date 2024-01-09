select 
    pokemon_type,
    sum(total_number_of_pokemon_donaters) as total_number_of_pokemon_donaters,
    round(sum(total_amount_donated_eur),2) as total_amount_donated_eur,
    round(sum(total_amount_donated_eur)::dec / sum(total_number_of_pokemon_donaters)::dec,2) as average_donation_amount_eur_per_pokemon_donator
from 
    {{ ref("pokemon__masterdata__donations") }}
group by 
    pokemon_type
