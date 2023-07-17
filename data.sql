INSERT INTO animals (name, date_of_birth, neutered, weight_kg, escape_attempts) 
VALUES 
    ('Agumon', '2020-02-03', true, 10.23, 0),
    ('Gabumon', '2018-11-15', true, 8, 2),
    ('Pikachu', '2021-01-07', false, 15.04, 1),
    ('Devimon', '2017-05-12', true, 11, 5);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES 
    ('Charmander', '2020-02-08', -11.0, false, 0),
    ('Plantmon', '2021-11-15', -5.7, true, 2),
    ('Squirtle', '1993-04-02', -12.13, false, 3),
    ('Angemon', '2005-06-12', -45.0, true, 1),
    ('Boarmon', '2005-06-07', 20.4, true, 7),
    ('Blossom', '1998-10-13', 17.0, true, 3),
    ('Ditto', '2022-05-14', 22.0, true, 4);

INSERT INTO owners (full_name, age) VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');

UPDATE animals a
SET species_id = s.id
FROM species s
WHERE (a.name LIKE '%mon' AND s.name = 'Digimon')
   OR (a.name NOT LIKE '%mon' AND s.name = 'Pokemon');


UPDATE animals a
SET owner_id = o.id
FROM owners o
WHERE o.full_name IN ('Sam Smith', 'Jennifer Orwell', 'Bob', 'Melody Pond', 'Dean Winchester')
  AND (
    (a.name = 'Agumon' AND o.full_name = 'Sam Smith')
    OR (a.name IN ('Gabumon', 'Pikachu') AND o.full_name = 'Jennifer Orwell')
    OR (a.name IN ('Devimon', 'Plantmon') AND o.full_name = 'Bob')
    OR (a.name IN ('Charmander', 'Squirtle', 'Blossom') AND o.full_name = 'Melody Pond')
    OR (a.name IN ('Angemon', 'Boarmon') AND o.full_name = 'Dean Winchester')
  );

INSERT INTO vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');


INSERT INTO specializations (vet_id, species_id)
SELECT v.id, s.id
FROM vets v
JOIN species s ON s.name IN ('Pokemon', 'Digimon')
WHERE v.name = 'William Tatcher' AND s.name = 'Pokemon'
   OR v.name = 'Stephanie Mendez' AND s.name IN ('Digimon', 'Pokemon')
   OR v.name = 'Jack Harkness' AND s.name = 'Digimon';

INSERT INTO visits (vet_id, animal_id, visit_date)
SELECT v.id, a.id, DATE '2020-05-24'
FROM vets v
JOIN animals a ON a.name = 'Agumon'
WHERE v.name = 'William Tatcher'

UNION ALL

SELECT v.id, a.id, DATE '2020-07-22'
FROM vets v
JOIN animals a ON a.name = 'Agumon'
WHERE v.name = 'Stephanie Mendez'

UNION ALL

SELECT v.id, a.id, DATE '2021-02-02'
FROM vets v
JOIN animals a ON a.name = 'Gabumon'
WHERE v.name = 'Jack Harkness'

UNION ALL

SELECT v.id, a.id, DATE '2020-01-05'
FROM vets v
JOIN animals a ON a.name = 'Pikachu'
WHERE v.name = 'Maisy Smith'

UNION ALL

SELECT v.id, a.id, DATE '2020-03-08'
FROM vets v
JOIN animals a ON a.name = 'Pikachu'
WHERE v.name = 'Maisy Smith'

UNION ALL

SELECT v.id, a.id, DATE '2020-05-14'
FROM vets v
JOIN animals a ON a.name = 'Pikachu'
WHERE v.name = 'Maisy Smith'

UNION ALL

SELECT v.id, a.id, DATE '2021-05-04'
FROM vets v
JOIN animals a ON a.name = 'Devimon'
WHERE v.name = 'Stephanie Mendez'

UNION ALL

SELECT v.id, a.id, DATE '2021-02-24'
FROM vets v
JOIN animals a ON a.name = 'Charmander'
WHERE v.name = 'Jack Harkness'

UNION ALL

SELECT v.id, a.id, DATE '2019-12-21'
FROM vets v
JOIN animals a ON a.name = 'Plantmon'
WHERE v.name = 'Maisy Smith'

UNION ALL

SELECT v.id, a.id, DATE '2020-08-10'
FROM vets v
JOIN animals a ON a.name = 'Plantmon'
WHERE v.name = 'William Tatcher'

UNION ALL

SELECT v.id, a.id, DATE '2021-04-07'
FROM vets v
JOIN animals a ON a.name = 'Plantmon'
WHERE v.name = 'Maisy Smith'

UNION ALL

SELECT v.id, a.id, DATE '2019-09-29'
FROM vets v
JOIN animals a ON a.name = 'Squirtle'
WHERE v.name = 'Stephanie Mendez'

UNION ALL

SELECT v.id, a.id, DATE '2020-10-03'
FROM vets v
JOIN animals a ON a.name = 'Angemon'
WHERE v.name = 'Jack Harkness'

UNION ALL

SELECT v.id, a.id, DATE '2020-11-04'
FROM vets v
JOIN animals a ON a.name = 'Angemon'
WHERE v.name = 'Jack Harkness'

UNION ALL

SELECT v.id, a.id, DATE '2019-01-24'
FROM vets v
JOIN animals a ON a.name = 'Boarmon'
WHERE v.name = 'Maisy Smith'

UNION ALL

SELECT v.id, a.id, DATE '2019-05-15'
FROM vets v
JOIN animals a ON a.name = 'Boarmon'
WHERE v.name = 'Maisy Smith'

UNION ALL

SELECT v.id, a.id, DATE '2020-02-27'
FROM vets v
JOIN animals a ON a.name = 'Boarmon'
WHERE v.name = 'Maisy Smith'

UNION ALL

SELECT v.id, a.id, DATE '2020-08-03'
FROM vets v
JOIN animals a ON a.name = 'Boarmon'
WHERE v.name = 'Maisy Smith'

UNION ALL

SELECT v.id, a.id, DATE '2020-05-24'
FROM vets v
JOIN animals a ON a.name = 'Blossom'
WHERE v.name = 'Stephanie Mendez'

UNION ALL

SELECT v.id, a.id, DATE '2021-01-11'
FROM vets v
JOIN animals a ON a.name = 'Blossom'
WHERE v.name = 'William Tatcher';


INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';