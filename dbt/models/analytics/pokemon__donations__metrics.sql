select 
    sum(total_number_of_pokemon_donaters) as total_number_of_pokemon_donaters,
    sum(total_amount_donated_eur) as total_amount_donated_eur,
    sum(total_amount_donated_eur)::dec / sum(total_number_of_pokemon_donaters)::dec as average_donation_amount_eur_per_pokemon_donator
from 
    {{ ref("pokemon__masterdata__donations") }}
