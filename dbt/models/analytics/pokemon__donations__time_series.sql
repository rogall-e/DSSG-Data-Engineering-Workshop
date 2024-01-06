select 
    donation_date
    , sum(donation_number_of_pokemon) as total_number_of_pokemon_donaters
    , round(sum(donation_amount_eur),2) as total_amount_donated_eur
    , round(sum(donation_amount_eur)::dec / sum(donation_number_of_pokemon)::dec,2) as average_donation_amount_eur_per_pokemon_donator
from 
    {{ source("pokemon_load", "pokemon__donations",) }}
group by 
    donation_date