
SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN 'January 1, 2016' AND 'December 31, 2019';
SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = TRUE;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


UPDATE animals 
SET species = 'unspecified';

UPDATE animals SET species = 'digimon'
WHERE name like '%mon';

UPDATE animals SET species = 'pokemon'
WHERE species = 'unspecified';

BEGIN;

SAVEPOINT SP1;

DELETE FROM animals;
ROLLBACK TO SP1 ;

COMMIT;

DELETE FROM animals WHERE date_of_birth > 'January 1, 2022';

BEGIN;
SAVEPOINT SP2;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT SP2;
UPDATE animals SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name) FROM animals;

SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) FROM animals 
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg)  FROM animals 
GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN 'January 1, 1990' AND 'December 31, 2000'
GROUP BY species;

-- Day 3
UPDATE  animals SET species_id = 2
WHERE name like '%mon';

UPDATE  animals SET species_id = 1
WHERE species_id IS NULL;

UPDATE  animals SET owner_id = 1
WHERE name = 'Agumon';

UPDATE  animals SET owner_id = 2
WHERE name IN ('Gabumon' , 'Pikachu');

UPDATE animals SET owner_id = 3
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

update animals SET owner_id = 5
where name in ('Angemon', 'Boarmon');


SELECT full_name, name FROM owners 
LEFT JOIN animals 
  ON owners.id = animals.owner_id
WHERE owner_id = 4;

SELECT species.name, animals.name FROM species  
LEFT JOIN animals 
  ON species.id = animals.species_id
WHERE animals.species_id = 1;

SELECT owners.full_name, animals.name FROM owners  
LEFT JOIN animals 
  ON owners.id = animals.owner_id
ORDER BY full_name;

SELECT species.name, COUNT(animals.name)  FROM species 
LEFT JOIN animals 
  ON species.id = animals.species_id
GROUP BY species.name;

SELECT owners.full_name, species.name, animals.name  FROM animals 
INNER JOIN owners
  ON owners.id = animals.owner_id
INNER JOIN species 
ON species.id = animals.species_id
WHERE owner_id = 2 AND species_id = 2;


SELECT owners.full_name,  animals.name FROM owners
LEFT JOIN animals
  ON owners.id = animals.owner_id
WHERE animals.escape_attempts = 0 AND owner_id = 5;

SELECT full_name, COUNT(name) FROM owners 
LEFT JOIN animals 
  ON animals.owner_id = owners.id
GROUP BY full_name;



