/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals 
ADD species varchar(100)

ALTER TABLE animals DROP COLUMN species;

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(100),
    age int
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar(100)
);

ADD species_id int

ALTER TABLE animals ADD species_id int REFERENCES species(id);

ALTER TABLE animals ADD owner_id int REFERENCES owners(id);
