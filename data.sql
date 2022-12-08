/* Populate database with sample data. */

INSERT INTO animals (
name, date_of_birth, escape_attempts, neutered, weight_kg
 ) 
 VALUES 
('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8),
('Pikachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true, 11),
('Charmander', '2020-02-08', 0, false, -11),
('Squirtle', '1993-02-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17),
('Plantmon', '2017-10-05', 3, true, 5.7),
('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners ( full_name, age ) 
 VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species ( name ) 
 VALUES 
('Pokemon'),
('Digimon');

INSERT INTO vets ( name, age, date_of_graduation ) 
 VALUES 
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');


INSERT INTO specializations
VALUES
  (1, 1),
   (1, 3),
  (2, 3),
  (2, 4);

 INSERT INTO visits
VALUES (1, 4, 'February 24, 2021'),
 (2, 3,  'September 29, 2019'),
 (3, 1,  'January 11, 2021'),
 (3, 3,  'May 24, 2020' ),
 (4, 4,  'October 3, 2020'),
 (4, 4,  'November 4, 2020'),
 (5, 2,  'January 24, 2019'),
 (5, 2,  'May 15, 2019'),
 (5, 2,  'February 27, 2020'),
 (5, 2,   'August 3, 2020'),
 (6, 1, 'May 24, 2020'),
 (6, 3, 'July 22, 2020'),
 (7, 4, 'February 2, 2021'),
 (8, 2, 'January 5, 2020'),
 (8, 2, 'March 8, 2020'),
 (8, 2, 'May 14, 2020'),
 (9, 3, 'May 4, 2021'),
 (10, 1, 'August 10, 2020'),
 (10, 2, 'April 7, 2021'),
 (10, 2, 'December 21, 2019');



