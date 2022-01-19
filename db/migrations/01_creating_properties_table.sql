CREATE TABLE properties(id SERIAL PRIMARY KEY, description VARCHAR(1000), name VARCHAR(100), price DECIMAL(10,2), available_from DATE, available_until DATE, owner_id VARCHAR(10);