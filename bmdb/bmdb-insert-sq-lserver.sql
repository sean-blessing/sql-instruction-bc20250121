-- BMDB data
-- insert Movie records
USE BMDB
Go

SELECT *
  FROM Movie;

INSERT INTO Movie (Title, Year, Rating, Director)
VALUES ('Step Brothers', 2008, 'R', 'Adam McKay'),
       ('Elf', 2003, 'PG', 'Jon Favreau');

INSERT INTO Actor (FirstName, LastName, Gender, BirthDate)
 VALUES('Will', 'Ferrell', 'M', '1967-07-16'),
	   ('Zooey', 'Deschanel', 'F', '1980-01-17'),
	   ('Peter', 'Dinklage', 'M', '1969-06-11'),
	   ('John C.', 'Reilly', 'M', '1965-05-24'),
	   ('Mary', 'Steenburgen', 'F', '1953-02-08');

INSERT INTO Credit (MovieID, ActorID, Role)
VALUES
	(2, 1, 'Buddy'),
	(2, 2, 'Jovie'),
	(2, 3, 'Miles Finch'),
	(2, 5, 'Emily Hobbs'),
	(1, 1, 'Brennan Huff'),
	(1, 4, 'Dale Doback'),
	(1, 5, 'Nancy Huff');
