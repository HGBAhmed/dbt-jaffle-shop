with source as (
    -- dbt va dynamiquement remplacer cette ligne par le vrai chemin Snowflake
    select * from {{ source('jaffle_shop_raw', 'raw_customers') }}
),

renamed as (
    select
        id as customer_id,
        first_name,
        last_name
    from source
)

select * from renamed