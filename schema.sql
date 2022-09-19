/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (

create database vet_clinic;
create table animals(
    id int primary key generated by default as identity, 
    name varchar(100), date_of_birth date, escape_attempts int, 
    neutered boolean, weight_in_kg decimal(5,2));

 alter table animals add species varchar(100);

 CREATE TABLE owners(id int generated by default as identity primary key not null, full_name varchar(100), age int);
 CREATE TABLE species (id int generated by default as identity primary key not null, name varchar(100));

 alter table animals add foreign key (species_id) references species;
 alter table animals add foreign key (owner_id) references owners;

 CREATE TABLE vets (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80),
	age int,
	date_of_graduation date);
    CREATE TABLE specializations (
	vet_id INTEGER REFERENCES vets(id),
	species_id INTEGER REFERENCES species(id)
);

create table visits (vet_id int references vets(id),animal_id int references animals(id),date_of_visit date;
);
create table specializations (vet_id int references vets(id),species_id int references species(id));



alter table animals ADD owner_id INTEGER REFERENCES owners(id)

--  create owners table
create table owners (
	id SERIAL PRIMARY KEY,
@@ -61,4 +58,8 @@ CREATE TABLE visits (
	vet_id INTEGER REFERENCES vets(id),
	animal_id INTEGER REFERENCES animals(id),
	date_of_visit DATE
);
-- add email field on owners table
alter table owners add COLUMN email varchar(120);

  -- performance audit

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits WHERE animal_id = 4
-- the above query returns an execution time of 4380 ms
CREATE INDEX visits_animal_id_idx ON visits (animal_id);
-- after creating the index, the query execution time is Execution Time: 770.499 ms




EXPLAIN ANALYZE SELECT * FROM visits WHERE vet_id = 2;
-- the above query returns an execution time of 1060.80 ms

CREATE INDEX visits_vet_id_idx ON visits (vet_id);
-- after creating the index, the query  Execution Time: 799.856 ms
 ms

