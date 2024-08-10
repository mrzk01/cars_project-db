-- Langkah #5 - Creating Analytical Query
-- 1. Ranking popularitas model mobil berdasarkan jumlah bid
SELECT 
	model,
	COUNT(b.id) AS count_bid
FROM cars c
JOIN bids b on(c.id = b.car_id)
GROUP BY model
ORDER BY count_bid DESC


-- 2. Membandingkan harga mobil berdasarkan harga rata-rata per kota.
SELECT 
	ci.name,
	brand,
	model,
	years,
	price,
	AVG(price) OVER(PARTITION BY ci.name) as avg_car_city
FROM cars c
JOIN ads a on(ads_id = a.id)
JOIN users u on(user_id = u.id)
JOIN cities ci on(city_id = ci.id)
ORDER BY model 

-- 3. cari perbandingan tanggal cust melakukan bid dengan bid selanjutnya beserta harga tawar yang diberikan
WITH ranked_bids AS(
SELECT
	model,
	customer_id,
	date_bid,
	bid_price
FROM bids 
JOIN cars c on(car_id = c.id)
WHERE model = 'Toyota Yaris'
)
SELECT 
	model,
	customer_id as first_cust_id,
	LEAD(customer_id) OVER(ORDER BY date_bid) as next_cust_id,
	date_bid as first_bid_date,
	LEAD(date_bid) OVER(ORDER BY date_bid) as next_bid_date,
	bid_price as first_bid_price,
	LEAD(bid_price) OVER(ORDER BY date_bid) as next_bid_price
FROM ranked_bids;


-- 4. Membandingkan persentase perbedaan rata-rata harga mobil berdasarkan modelnya dan rata-rata harga bid yang ditawarkan oleh customer pada 6 bulan terakhir
WITH bid_6months AS(
	SELECT
		ca.model,
		ca.price,
		b.bid_price
	FROM cars ca
	JOIN bids b on(ca.id = b.car_id)
	WHERE b.date_bid >= CURRENT_DATE - INTERVAL '6 months'
),
avg_calculations AS(
	SELECT
		model,
		AVG(price) OVER(PARTITION BY model) as avg_price,
		AVG(bid_price) OVER(PARTITION BY model) as avg_bid_6month 
	FROM bid_6months
),
differences AS(
	SELECT
		model,
		avg_price,
		avg_bid_6month,
		avg_price - avg_bid_6month as difference
	FROM avg_calculations
)
SELECT
	model,
	avg_price,
	avg_bid_6month,
	difference,
	difference/avg_price * 100 as difference_percent
FROM differences
GROUP BY model, avg_price, avg_bid_6month, difference;


-- 5. Membuat window function rata-rata harga bid sebuah merk dan model mobil selama 6 bulan terakhir
WITH recent_bids AS (
    SELECT
        c.brand,
        c.model,
        b.bid_price,
        DATE_TRUNC('month', b.date_bid) AS month_start
    FROM cars c
    JOIN bids b ON c.id = b.car_id
    WHERE b.date_bid >= CURRENT_DATE - INTERVAL '6 months'
)
SELECT
    brand,
    model,
    COALESCE(AVG(bid_price) FILTER (WHERE month_start = DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 month'), 0) AS m_min_1,
    COALESCE(AVG(bid_price) FILTER (WHERE month_start = DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '2 months'), 0) AS m_min_2,
    COALESCE(AVG(bid_price) FILTER (WHERE month_start = DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '3 months'), 0) AS m_min_3,
    COALESCE(AVG(bid_price) FILTER (WHERE month_start = DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '4 months'), 0) AS m_min_4,
    COALESCE(AVG(bid_price) FILTER (WHERE month_start = DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '5 months'), 0) AS m_min_5,
    COALESCE(AVG(bid_price) FILTER (WHERE month_start = DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '6 months'), 0) AS m_min_6
FROM recent_bids
GROUP BY brand, model
ORDER BY brand, model;





