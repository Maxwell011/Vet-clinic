
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


-- QUESTIONS RELATED TO VISITS AND VETS - DAY 4
-- Who was the last animal seen by William Tatcher?
SELECT v.name as vet, a.name as animal, vis.date_of_visit FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
WHERE vis.date_of_visit = (select max(date_of_visit) FROM visits WHERE vets_id=1) 
ORDER BY vis.date_of_visit desc;

-- How many different animals did Stephanie Mendez see
SELECT count(a.name) FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
WHERE v.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT v.name, s.name FROM specializations sp
INNER JOIN species s
  ON s.id = sp.species_id
RIGHT JOIN vets v
  ON v.id = sp.vets_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT v.name, a.name, vis.date_of_visit FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
WHERE v.name = 'Stephanie Mendez' and date_of_visit BETWEEN 'April 1, 2020' and 'August 30, 2020';

-- What animal has the most visits to vets?

SELECT a.name, count(a.name) FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
GROUP BY a.name
order by count desc
limit 1;


-- Who was Maisy Smith's first visit?

SELECT  a.name, v.name, date_of_visit FROM visits vis
INNER JOIN animals a
   ON a.id = vis.animals_id
INNER JOIN vets v 
   ON v.id = vis.vets_id
WHERE vis.date_of_visit = (select min(date_of_visit) FROM visits WHERE vets_id = 2)
order by date_of_visit;  

-- Details for most recent visit: animal information, vet information, and date of visit.

SELECT a.name, v.name, date_of_visit  FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
WHERE date_of_visit = (select max(date_of_visit) FROM visits);

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT v.name, count(a.name) FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
WHERE v.id not in (select vets_id FROM specializations)
GROUP BY v.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT v.name, s.name, count(a.species_id) FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
INNER JOIN species s
  ON s.id = a.species_id
WHERE v.name = 'Maisy Smith'
GROUP BY (v.name, s.name)
order by count desc
limit 1;

