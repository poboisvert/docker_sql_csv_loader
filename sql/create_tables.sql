-- Creation of restaurants table
CREATE TABLE IF NOT EXISTS restaurants (
  id INT NOT NULL,
  name varchar(500) NOT NULL,
  PRIMARY KEY (id)
);

-- Creation of customers table
CREATE TABLE IF NOT EXISTS customers (
  id INT NOT NULL,
  full_name varchar(500) NOT NULL,
  email varchar(500) NULL,
  last_contacted TIMESTAMP,
  last_contacted_medium varchar(500) NOT NULL,
  unsubscribed_from_emails BOOLEAN NOT NULL,
  PRIMARY KEY (id)
);

-- Creation of bookings table
CREATE TABLE IF NOT EXISTS bookings (
  id INT NOT NULL,
  bookings_date TIMESTAMP NOT NULL,
  customer_id INT NOT NULL,
  restaurant_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_restaurants
    FOREIGN KEY(restaurant_id) 
  REFERENCES restaurants(id)
);

COPY restaurants FROM '/data/restaurants.csv' DELIMITER ',' CSV HEADER;
COPY customers FROM '/data/customers.csv' DELIMITER ',' CSV HEADER;
COPY bookings FROM '/data/bookings.csv' DELIMITER ',' CSV HEADER;

