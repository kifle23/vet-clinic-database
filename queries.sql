SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;

UPDATE animals SET species = 'unspecified';
SELECT * FROM animals; 


UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals; 

UPDATE animals SET species = 'pokemon' WHERE species = 'unspecified';
SELECT * FROM animals; 

COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;

SAVEPOINT save_point;

UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;

ROLLBACK TO save_point;
SELECT * FROM animals;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;

COMMIT;
SELECT * FROM animals;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
GROUP BY neutered
ORDER BY avg_escape_attempts DESC;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

SELECT a.name 
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

SELECT a.name 
FROM animals a
JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name, a.name
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name, a.name;

SELECT s.name, COUNT(a.id) AS animal_count
FROM animals a
JOIN species s ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name 
FROM animals a
JOIN owners o ON a.owner_id = o.id
JOIN species s ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT a.name 
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts=0;

SELECT o.full_name, COUNT(a.id) AS animal_count
FROM owners o
JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY COUNT(a.id) DESC
LIMIT 1;

--1--
SELECT a.name
FROM visits v
JOIN animals a ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

--2--
SELECT COUNT(v.animal_id)
FROM visits v
JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'Stephanie Mendez';

--3--
SELECT vt.name, sp.name AS specialty
FROM vets vt
LEFT JOIN specializations s ON s.vet_id = vt.id
LEFT JOIN species sp ON sp.id = s.species_id
ORDER BY vt.name;

--4--
SELECT a.name
FROM visits v
JOIN animals a ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'Stephanie Mendez'
  AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';
  
--5--
SELECT a.name, COUNT(*) AS num_visits
FROM visits v
JOIN animals a ON a.id = v.animal_id
GROUP BY a.name
ORDER BY num_visits DESC
LIMIT 1;

--6--
SELECT a.name, v.visit_date
FROM visits v
JOIN animals a ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'Maisy Smith'
ORDER BY v.visit_date ASC
LIMIT 1;

--7--
SELECT a.name AS animal_name, vt.name AS vet_name, v.visit_date
FROM visits v
JOIN animals a ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
ORDER BY v.visit_date DESC
LIMIT 1;

--8--
SELECT COUNT(*)
FROM visits v
JOIN animals a ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
LEFT JOIN specializations s ON s.vet_id = vt.id AND s.species_id = a.species_id
WHERE s.vet_id IS NULL;

--9--
SELECT s.name, COUNT(*) AS num_treatments
FROM visits v
JOIN animals a ON v.animal_id = a.id
JOIN species s ON a.species_id = s.id
WHERE v.vet_id IN (SELECT id FROM vets WHERE name = 'Maisy Smith')
GROUP BY s.name
ORDER BY num_treatments DESC
LIMIT 1;