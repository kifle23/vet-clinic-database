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