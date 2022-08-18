/*Queries that provide answers to the questions from all projects.*/

/* all animals whose name ends with 'mon'*/
SELECT * FROM animals WHERE name LIKE '%mon';

/* List the name of all animals born between 2016 and 2019*/
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016%-01-01' AND '2019-12-31';

/* List the name of all animals that are neutered and have less than 3 escape attempts.*/
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

/* List the date of birth of all animals named either "Agumon" or "Pikachu"*/
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

/* List name and escape attempts of animals that weigh more than 10.5kg*/
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

/* Find all animals that are neutered*/
SELECT * FROM animals WHERE neutered = true;

/* Find all animals not named Gabumon.*/
SELECT * FROM animals WHERE name != 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals 
with the weights that equals precisely 10.4kg or 17.3kg)*/
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species='pokemon' WHERE species = '';

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT COUNT(*) FROM animals WHERE escape_attempts > 0 AND neutered = true;
SELECT COUNT(*) FROM animals WHERE escape_attempts > 0 AND neutered = false;

-- What is the minimum and maximum weight of each type of animal?
SELECT MIN(weight_kg) FROM animals;
SELECT MAX(weight_kg) FROM animals;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

-- Update operation
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;

-- Delete operation
DELETE FROM animals;
SELECT COUNT(*) FROM animals;
DELETE FROM animals WHERE date_of_birth >= '2022-01-01';

-- Savepoint and update operation
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

-- Project part 3

-- What animals belong to Melody Pond?
SELECT animals.name, owners.full_name As Owner 
FROM animals 
JOIN owners ON animals.owner_id = owners.id
WHERE animals.owner_id = 4;

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name, species.name As Species
FROM animals
JOIN species ON animals.species_id = species.id
WHERE animals.species_id = 1;

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name, COUNT(animals.species_id)
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name, animals.name
FROM animals
LEFT JOIN owners ON owners.id = animals.owner_id
WHERE owners.id = 2 AND animals.owner_id = 2;

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT owners.full_name AS Owner, animals.name
FROM animals
JOIN owners ON animals.owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Dean Winchester')
WHERE escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.owner_id) AS animal_count
FROM animals
JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY animal_count DESC LIMIT 1;
