select
    *
from
    city
where
    city.CountryCode = (
        select
            code
        from
            country
        where
            country.Name = 'afghanistan'
    );