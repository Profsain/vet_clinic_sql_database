/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-03-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-17', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-18', 0, false, -11.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, -5.70);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, -45.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.40);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true, 22.00);

-- Add record to oweners table
INSERT INTO owners(full_name, age)
VALUES('Sam Smith', 34),
      ('Jennifer Orwell', 19),
      ('Bob', 45),
      ('Melody Pond', 77),
      ('Dean Winchester', 14),
      ('Jodie Whittaker', 38);

-- Add record to species table
INSERT INTO species(name)
VALUES('Pokemon')
      ('Digimon');

-- Update species_id with values
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS '';

-- Update owner_id with values
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

-- Insert record into vets table
INSERT INTO vets (name, age, date_of_graduation)
VALUES('Vet William Tatcher', 45, '2000-04-23'),
      ('Vet Maisy Smith', 26, '2019-01-17'),
      ('Vet Stephanie Mendez', 26, '1981-05-04'),
      ('Vet Jack Harkness', 38, '2008-06-18');

-- Update specializations
INSERT INTO specializations(vet_fk_id, species_fk_id)
VALUES(1, 1);
INSERT INTO specializations(vet_fk_id, species_fk_id)
VALUES(2, 2);
INSERT INTO specializations(vet_fk_id, species_fk_id)
VALUES(2, 1);
INSERT INTO specializations(vet_fk_id, species_fk_id)
VALUES(4, 2);

-- Update visits
INSERT INTO visits(animals_fk_id, vets_fk_id, visit_date)
VALUES(1, 1, '2020-05-24');
INSERT INTO visits(animals_fk_id, vets_fk_id, visit_date)
VALUES(1, 3, '2020-06-22');
INSERT INTO visits(animals_fk_id, vets_fk_id, visit_date)
VALUES(2, 4, '2021-02-02'),
      (3, 2, '2020-01-05'),
      (3, 2, '2020-03-08'),
      (3, 2, '2020-05-14'),
      (4, 3, '2021-05-04'),
      (5, 4, '2021-02-24'),
      (6, 2, '2019-12-21'),
      (6, 1, '2020-08-10'),
      (6, 2, '2021-04-07'),
      (7, 3, '2019-09-29'),
      (8, 4, '2020-10-03'),
      (8, 4, '2020-11-04'),
      (11, 2, '2019-01-24'),
      (11, 2, '2019-05-15'),
      (11, 2, '2020-02-27'),
      (11, 2, '2020-08-03'),
      (9, 3, '2020-05-24'),
      (9, 1, '2021-01-11');
