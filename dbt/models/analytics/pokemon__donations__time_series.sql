select 
    donation_date
    , sum(donation_number_of_pokemon) as total_number_of_pokemon_donaters
    , sum(donation_amount_eur) as total_amount_donated_eur
    , sum(donation_amount_eur)::dec / sum(donation_number_of_pokemon)::dec as average_donation_amount_eur_per_pokemon_donator
from 
    {{ source("pokemon_load", "pokemon__donations",) }}
group by 
    donation_date