SELECT id, listing_url, name, 30 - availability_30 AS booked_out_30, 
CAST(REPLACE(REPLACE(price, '$', ''), ',', '') AS UNSIGNED) AS price_clean,
CAST(REPLACE(REPLACE(price, '$', ''), ',', '') * (30 - availability_30) AS UNSIGNED) AS proj_rev_30

-- this is to account for the troll "postings" but not postings
FROM listings WHERE availability_365 > 0 ORDER BY proj_rev_30 DESC LIMIT 20;
