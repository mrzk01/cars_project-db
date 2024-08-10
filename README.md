# Relational Database & SQL Project: Penjualan Mobil Bekas Online

## Objektif Project.
- Tujuan Utama: Membangun basis data relasional untuk website penjualan mobil bekas.
- Fitur Utama: Menyediakan fitur untuk pendaftaran pengguna, pengelolaan iklan, pencarian mobil, dan penawaran harga.
- Proses: Mendesain skema database, menginput data dummy, dan menganalisis data untuk memastikan fungsi dan efektivitas sistem.
- Cakupan Proyek: Fokus pada pengembangan database, bukan transaksi pembelian.

## Designing The Database:
-  Membuat  Struktur Tabel.
-  Tentukan fields dan keys untuk tiap tabel
-  Identifikasi Relasi

## Implementing The Design.
![](images/erd_cars_project.png)

### Syntax DDL queries
```sql
CREATE TABLE cities(
	id INT PRIMARY KEY,
	name VARCHAR (100) NOT NULL
);

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	city_id INT NOT NULL,
	name VARCHAR (100) UNIQUE NOT NULL,
	contact VARCHAR (50) NOT NULL,
	CONSTRAINT fk_city_id
		FOREIGN KEY (city_id)
		REFERENCES cities(id)
);

CREATE TABLE customers(
	id SERIAL PRIMARY KEY,
	name VARCHAR (100) UNIQUE NOT NULL,
	email VARCHAR (50) NOT NULL,
	contact VARCHAR (100) NOT NULL
);

CREATE TABLE ads(
	id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	title VARCHAR (200) NOT NULL,
	description TEXT DEFAULT 'No description',
	CONSTRAINT fk_user_id
		FOREIGN KEY (user_id)
		REFERENCES users(id)
);

CREATE TABLE cars(
	id SERIAL PRIMARY KEY,
	ads_id INT NOT NULL,
	brand VARCHAR (100) NOT NULL,
	model VARCHAR (200) NOT NULL,
	body_type VARCHAR (100) NOT NULL,
	transmission VARCHAR (50) NOT NULL,
	color VARCHAR (50)NOT NULL,
	price NUMERIC NOT NULL,
	distance VARCHAR (50) NOT NULL,
	years INT NOT NULL,
	date_post TIMESTAMP NOT NULL,
	CONSTRAINT fk_ads_id
		FOREIGN KEY (ads_id)
		REFERENCES ads(id)
);


CREATE TABLE bids(
	id SERIAL PRIMARY KEY, 
	customer_id INT NOT NULL,
	car_id INT NOT NULL,
	date_bid TIMESTAMP NOT NULL,
	bid_price INT NOT NULL,
	bid_status VARCHAR (50) NOT NULL,
	CONSTRAINT fk_customer_id
		FOREIGN KEY (customer_id)
		REFERENCES customers(id),
	CONSTRAINT fk_car_id
		FOREIGN KEY (car_id)
		REFERENCES cars(id)
);

SELECT * FROM customers
```

## Populating the database.
Kita akan menggunakan Faker di python untuk membuat data yang mirip seperti data asli. Sebagai contoh berikut pembuatan data dummy untuk customers
```python
!pip install Faker
!pip install tabulate

# Import Library yang akan digunakan
from faker import Faker
from tabulate import tabulate

import csv

FAKER = Faker('id_ID')

"""# Membuat dummy data

### Dummy data customers
"""

def show_data(table):
  tab = tabulate(tabular_data=table, headers = table.keys(), tablefmt="psql", numalign = "center")
  print(tab)

def customers_table(n_cust, is_print):


  # Buat table
  table = {}
  table["id"] = [i+1 for i in range(n_cust)]
  table["name"] = [FAKER.name() for i in range(n_cust)]
  table["email"] = [FAKER.email() for i in range(n_cust)]
  table["kontak"] = [FAKER.numerify('+628##-####-####') for i in range(n_cust)]

  # Print table
  if is_print:
    show_data(table)

  return table

# membuat data table users
customers1_table = customers_table(100, True)
```

```python
"""# Simpan menjadi file csv"""

def save_to_csv(data, nama_file):

  # Membuat file csv
    with open(f'{nama_file}.csv', mode='w', newline='') as file:
        # Membuat writer csv
        writer = csv.writer(file)

        # write header csv
        writer.writerow(data.keys())

        # mengetahui panjang data
        len_Data = len(list(data.items())[0][1])

        # write data ke file csv
        for i in range(len_Data):
            row = []
            for key in data.keys():
                row.append(data[key][i])
            writer.writerow(row)

# menyimpan data customers dlm bentuk csv
save_to_csv(data = customers1_table,
            nama_file='customers')
```
- Uraikan bagaimana meng-generate dummy dataset
![](images/import data dummy.png)
- Uraikan bagaimana cara menginputkan data ke dalam database menggunakan pgAdmin 4. 

## Retrieve data
- Cantumkan contoh transactional dan analytical query yang telah dibuat.
