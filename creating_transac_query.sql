-- Langkah #4 - Creating Transactional Query
-- 1. Mencari mobil keluaran 2015 ke atas
SELECT 
	id,
	brand,
	model,
	years,
	price
FROM cars
WHERE years >= 2015

SELECT * FROM bids

-- 2. Menambahkan satu data bid produk baru
INSERT INTO bids(car_id, customer_id, date_bid, bid_price, bid_status)
VALUES (33, 5, '2024-04-04 21:35:35.058658', 200000000, 'Sent')

ALTER SEQUENCE bids_id_seq RESTART WITH 1001
	
SELECT 
	id,
	car_id,
	customer_id,
	date_bid,
	bid_price,
	bid_status
FROM bids


-- 3. Melihat semua mobil yg dijual 1 akun dari yg paling baru
SELECT c.id, ads_id, brand, model, years, price, date_post FROM cars c
JOIN ads a on(c.ads_id = a.id)
JOIN users u on(a.user_id = u.id)
WHERE user_id = 35
ORDER BY date_post DESC


-- 4. Mencari mobil bekas yang termurah berdasarkan keyword
SELECT * FROM cars
WHERE model ILIKE '% yaris'
ORDER BY price ASC


-- 5. Mencari mobil di satu kota
SELECT c.id, brand, model, years, price, ci.name FROM cars c
JOIN ads a on(c.ads_id = a.id)
JOIN users u on(a.user_id = u.id)
JOIN cities ci on (u.city_id = ci.id)
WHERE ci.name = 'Kota Jakarta Pusat'



