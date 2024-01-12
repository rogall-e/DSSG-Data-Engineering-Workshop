select 
    pokemon_id,
    pokemon_name,
    pokemon_type,
    sum(donation_number_of_pokemon) as total_number_of_pokemon_donaters,
    sum(donation_amount_eur) as total_amount_donated_eur,
    sum(donation_amount_eur)::dec / sum(donation_number_of_pokemon)::dec as average_donation_amount_eur_per_pokemon_donator
from 
    {{ ref("mart__pokemon_donations") }}
group by 
    pokemon_id,
    pokemon_name,
    pokemon_type
