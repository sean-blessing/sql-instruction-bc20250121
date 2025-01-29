-- ch7
-- update and delete

SELECT *
  FROM Movie;

-- insert a test/dummy record
INSERT INTO Movie (Title, Year, Rating, Director)
 VALUES ('Test', 2025, 'R', 'Test Director');

-- get record by ID (primary key)
SELECT *
  FROM Movie
 WHERE ID = 4;

-- update Test movie to Test Movie 2, year 2026
UPDATE Movie
   SET Title = 'Test 2',
       Year = 2026
 WHERE ID = 4;

-- delete 
DELETE MOVIE
  WHERE ID = 4;

-- Actor table
SELECT *
  FROM Actor;

INSERT INTO Actor (FirstName, LastName, Gender, BirthDate)
 VALUES('Will', 'Ferrell', 'M', '1967-07-16'),
	   ('Zooey', 'Deschanel', 'F', '1980-01-17'),
	   ('Peter', 'Dinklage', 'M', '1969-06-11'),
	   ('John C.', 'Reilly', 'M', '1965-05-24'),
	   ('Mary', 'Steenburgen', 'F', '1953-02-08');

-- add credits
SELECT *
  FROM Actor;
SELECT *
  FROM Movie;
-- credits:
-- Elf (2):
--	Will Ferrell (1) - Buddy
--  Zooey Deschanel (2) - Jovie
--  Peter Dinklage (3) - Miles Finch
--  Mary S (5) - Emily Hobbs
-- Step Brothers (1)
--  Will Ferrell (1) - Brennan Huff
--  John C Reilly (4) - Dale Doback
--  Mary S (5) - Nancy Huff

INSERT INTO Credit (MovieID, ActorID, Role)
VALUES
	(2, 1, 'Buddy'),
	(2, 2, 'Jovie'),
	(2, 3, 'Miles Finch'),
	(2, 5, 'Emily Hobbs'),
	(1, 1, 'Brennan Huff'),
	(1, 4, 'Dale Doback'),
	(1, 5, 'Nancy Huff');

Select *
  FROM Credit;

-- show credits - movie, actor, and the role
SELECT Title, CONCAT(FirstName, ', ', LastName) AS Actor, Role
  FROM Credit C
  JOIN Movie M ON M.ID = C.MovieID
  JOIN Actor A ON A.ID = C.ActorID;

-- copy the movie table into MovieCopy
SELECT *
  INTO MovieCopy
  FROM Movie;