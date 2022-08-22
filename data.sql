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

-- insert into specializations
INSERT INTO specializations(vet_fk_id, species_fk_id)
VALUES((SELECT id FROM vets WHERE vets.name = 'Vet William Tatcher'), (SELECT id FROM species WHERE species.name = 'Pokemon')),
      ((SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez'), (SELECT id FROM species WHERE species.name = 'Pokemon')),
      ((SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez'), (SELECT id FROM species WHERE species.name = 'Digimon')),
      ((SELECT id FROM vets WHERE vets.name = 'Vet Jack Harkness'), (SELECT id FROM species WHERE species.name = 'Digimon'));
      


-- insert records into visits table
INSERT INTO visits(animals_fk_id, vets_fk_id, visit_date)
VALUES((SELECT id FROM animals WHERE animals.name = 'Agumon'), (SELECT id FROM vets WHERE vets.name = 'Vet William Tatcher'), '2020-05-24'),
      ((SELECT id FROM animals WHERE animals.name = 'Agumon'), (SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez'), '2020-06-22'),
      ((SELECT id FROM animals WHERE animals.name = 'Gabumon'), (SELECT id FROM vets WHERE vets.name = 'Vet Jack Harkness'), '2021-02-02'),
      ((SELECT id FROM animals WHERE animals.name = 'Pikachu'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2020-01-05'),
      ((SELECT id FROM animals WHERE animals.name = 'Pikachu'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2020-03-08'),
      ((SELECT id FROM animals WHERE animals.name = 'Pikachu'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2020-05-14'),
      ((SELECT id FROM animals WHERE animals.name = 'Devimon'), (SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez'), '2021-05-04'),
      ((SELECT id FROM animals WHERE animals.name = 'Charmander'), (SELECT id FROM vets WHERE vets.name = 'Vet Jack Harkness'), '2021-02-24'),
      ((SELECT id FROM animals WHERE animals.name = 'Plantmon'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2019-12-21'),
      ((SELECT id FROM animals WHERE animals.name = 'Plantmon'), (SELECT id FROM vets WHERE vets.name = 'Vet William Tatcher'), '2020-08-10'),
      ((SELECT id FROM animals WHERE animals.name = 'Plantmon'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2021-04-07'),
      ((SELECT id FROM animals WHERE animals.name = 'Squirtle'), (SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez'), '2019-09-29'),
      ((SELECT id FROM animals WHERE animals.name = 'Agumon'), (SELECT id FROM vets WHERE vets.name = 'Vet Jack Harkness'), '2020-10-03'),
      ((SELECT id FROM animals WHERE animals.name = 'Agumon'), (SELECT id FROM vets WHERE vets.name = 'Vet Jack Harkness'), '2020-11-04'),
      ((SELECT id FROM animals WHERE animals.name = 'Boarmon'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2019-01-24'),
      ((SELECT id FROM animals WHERE animals.name = 'Boarmon'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2019-05-15'),
      ((SELECT id FROM animals WHERE animals.name = 'Boarmon'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2020-02-27'),
      ((SELECT id FROM animals WHERE animals.name = 'Boarmon'), (SELECT id FROM vets WHERE vets.name = 'Vet Maisy Smith'), '2020-08-03'),
      ((SELECT id FROM animals WHERE animals.name = 'Blossom'), (SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez'), '2020-05-24'),
      ((SELECT id FROM animals WHERE animals.name = 'Blossom'), (SELECT id FROM vets WHERE vets.name = 'Vet William Tatcher'), '2021-01-11');

-- Part 6
-- Auto generate record insert
-- This will add 3.594.280 visits considering you have 10 animals, 4 vets
INSERT INTO visits (animals_fk_id, vets_fk_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO owners (full_name, email) SELECT 'Owner ' || GENERATE_SERIES(1,2500000), 'owner_' || GENERATE_SERIES(1,2500000) || '@mail.com';