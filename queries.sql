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

-- part 4

-- Who was the last animal seen by William Tatcher?
SELECT vets.name AS Vet, animals.name AS Animals, visit_date
FROM visits
JOIN vets ON vets.id = visits.vets_fk_id
JOIN animals ON vets_fk_id = (SELECT id FROM vets WHERE vets.name = 'Vet William Tatcher')
AND animals.id = visits.animals_fk_id
ORDER BY visit_date DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT vets.name AS Vet, animals.name AS Animals
FROM visits
JOIN vets ON vets.id = visits.vets_fk_id
JOIN animals ON vets_fk_id = (SELECT id FROM vets WHERE vets.name = 'Vet Stephanie Mendez')
AND animals.id = visits.animals_fk_id;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name AS Vets, species.name AS specialties
FROM  specializations
JOIN vets ON vets.id = specializations.vet_fk_id
JOIN species ON species.id = specializations.species_fk_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT vets.name AS Vets, animals.name AS Animals, visit_date
FROM visits
JOIN animals ON animals.id = visits.vets_fk_id
JOIN vets ON vets.id = visits.vets_fk_id
AND vets.name = 'Vet Stephanie Mendez'
AND visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name AS Animals, COUNT(animals_fk_id)
FROM visits
JOIN animals ON animals.id = visits.animals_fk_id
GROUP BY animals.name
ORDER BY COUNT(animals_fk_id) DESC
LIMIT 1; 

-- Who was Maisy Smith's first visit?
SELECT vets.name AS Vets, animals.name AS Animals, visit_date
FROM visits
JOIN vets ON vets.id = visits.vets_fk_id
JOIN animals ON animals.id = visits.animals_fk_id
AND vets.name = 'Vet Maisy Smith'
ORDER BY visit_date
LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT *
FROM visits
JOIN animals ON animals.id = visits.animals_fk_id
JOIN vets ON vets.id = visits.vets_fk_id
ORDER BY visit_date DESC
LIMIT 1; 

-- How many visits were with a vet that did not specialize in that animal's species
SELECT COUNT(*)
FROM vets
JOIN visits ON visits.vets_fk_id = vets.id
JOIN animals ON visits.animals_fk_id = animals.species_id
JOIN specializations ON vets.id = specializations.vet_fk_id
WHERE NOT specializations.species_fk_id = animals.id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name
FROM animals
JOIN species ON species.id = animals.species_id
JOIN visits ON visits.animals_fk_id = animals.id
JOIN vets ON vets.id = visits.vets_fk_id AND vets.name = 'Vet Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(species_id) DESC
LIMIT 1;



/* PROJECT WK 2 DAY 1 */

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits WHERE animals_fk_id = 4;

EXPLAIN ANALYZE SELECT * FROM visits WHERE vets_fk_id = 2;

EXPLAIN ANALYZE SELECT * FROM owners WHERE email = 'owner_18327@mail.com';

-- Create index to improve performance
CREATE INDEX animals_id_idx ON visits(animals_fk_id ASC);

CREATE INDEX vets_id_idx ON visits(vets_fk_id ASC);

CREATE INDEX email_idx ON owners(email ASC);