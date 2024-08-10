-- CASE 1 Menghitung total pendapatan perbulan
SELECT EXTRACT(MONTH FROM tgl_transaksi) AS bulan,
	SUM(jumlah_pembayaran) AS total_pendapatan 
FROM sales
GROUP BY bulan

-- Menyimpan query untuk menghitung total pendapatan ke dalam view
CREATE VIEW total_transaksi_bulanan AS
SELECT EXTRACT(MONTH FROM tgl_transaksi) AS bulan,
	SUM(jumlah_pembayaran) AS total_pendapatan 
FROM sales
GROUP BY bulan

SELECT * FROM total_transaksi_bulanan

-- Menampilkan daftar views yg sudah dibuat
SELECT
	table_schema AS schema,
	table_name AS view
FROM
	information_schema.views
WHERE
	table_schema NOT IN('information_schema','pg_catalog')
ORDER BY
	schema ASC,
	view ASC
	
-- CASE 2 Menghitung rata2 penjualan dari tiap kategori produk
SELECT 
	CASE WHEN SUBSTRING(id_barang,1,3)='S10' 
	THEN 'elektronik' 
	ELSE 'alat masak'
	END AS kategori,
	AVG(jumlah_pembayaran) AS avg_pembayaran 
FROM sales
GROUP BY kategori
HAVING AVG(jumlah_pembayaran) < (SELECT AVG(jumlah_pembayaran)FROM sales)

-- Menyimpan output query ke dlm materialized view
CREATE MATERIALIZED VIEW avg_penjualan_produk
AS
SELECT 
	CASE WHEN SUBSTRING(id_barang,1,3)='S10' 
	THEN 'elektronik' 
	ELSE 'alat masak'
	END AS kategori,
	AVG(jumlah_pembayaran) AS avg_pembayaran 
FROM sales
GROUP BY kategori
HAVING AVG(jumlah_pembayaran) < (SELECT AVG(jumlah_pembayaran)FROM sales)

SELECT * FROM avg_penjualan_produk	


-- CASE 3 Menghitung total belanja setelah diskon
SELECT 
	id_transaksi,
	jumlah_pembayaran * (1-(diskon::float/100)) AS belanja_setelah_diskon
FROM sales

-- Membuat fungsi utk menghitung total belanja setelah diskon
CREATE FUNCTION belanja_setelah_diskon(
	jumlah_pembayaran INT, diskon INT)

RETURNS INT
LANGUAGE plpgsql

AS
$$
DECLARE
	diskon_in_percent float;
	total_bayar float;

BEGIN
	diskon_in_percent = diskon::float/100;
	total_bayar = jumlah_pembayaran * (1-diskon_in_percent);
	RETURN total_bayar;
END
$$;

-- Menggunakan fungsi belanja setelah diskon
SELECT
	id_transaksi,
	jumlah_pembayaran,
	diskon,
	belanja_setelah_diskon(jumlah_pembayaran, diskon)
FROM sales

-- Menampilkan daftar fungsi yang sudah dibuat
SELECT
	routine_name
FROM
	information_schema.routines
WHERE
	routine_type = 'FUNCTION'
AND
	Routine_schema = 'public';