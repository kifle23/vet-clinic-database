CREATE DATABASE vet_clinic;
CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(10,2)
);
ALTER TABLE animals ADD COLUMN species VARCHAR(255);

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);


ALTER TABLE animals DROP COLUMN species;


ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);


ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);


CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
  vet_id INTEGER REFERENCES vets(id),
  animal_id INTEGER REFERENCES animals(id),
  visit_date DATE,
  PRIMARY KEY (vet_id, animal_id, visit_date)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visits_animal_id_idx ON visits (animal_id);

CREATE INDEX visits_vet_id_idx ON visits (vet_id);

CREATE INDEX owners_email_idx ON owners (email);

CREATE MATERIALIZED VIEW visit_by_vet_id AS SELECT * FROM visits where vet_id = 2;


