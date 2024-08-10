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