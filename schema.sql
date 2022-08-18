/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg FLOAT(2),
);

-- Add new column to table
ALTER TABLE animals
ADD specis VARCHAR(150);

-- Owners table
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(250),
    age INT,
    PRIMARY KEY(id));

-- Species table
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    PRIMARY KEY(id),);

ALTER TABLE animals DROP COLUMN species;

-- Add species_id column
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals 
ADD FOREIGN KEY (species_id)
REFERENCE species(id);

-- Add owner_id column
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals
ADD FOREIGN KEY(owner_id)
REFERENCE owners(id);

-- Add vets table
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

-- M:M relationship table vet:species
CREATE TABLE specializations (
    vet_fk_id INT REFERENCES vets(id),
    species_fk_id INT REFERENCES species(id)
);

-- M:M relationship animals:vets
CREATE TABLE visits (
    animals_fk_id INT REFERENCES animals(id),
    vets_fk_id INT REFERENCES vets(id),
    visit_date DATE
);
