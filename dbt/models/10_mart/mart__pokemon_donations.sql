select
    pd.pokemon_id,
    pm.pokemon_name,
    pm.pokemon_type,
    pd.donation_date,
    pd.donation_amount_eur,
    pd.donation_number_of_pokemon
from 
    {{ ref("stg__pokemon__donations") }} pd 
join 
    {{ ref("stg__pokemon__masterdata") }} pm