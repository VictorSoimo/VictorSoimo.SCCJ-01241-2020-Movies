
-- instance of creating a table: `movierating`


CREATE TABLE movierating(
	`ratingid` INT(11),
	`addedby` INT(11)


);

-- removing the table `movierating` because it is redundant

DROP TABLE movierating;

-- alter columns on table movie and name them appropriately
ALTER TABLE movie
CHANGE `ratingid` `ratingid` INT(11) NOT NULL;

ALTER TABLE movie
CHANGE `genre` `genreid` INT(11) NOT NULL,
DROP INDEX `genre`, -- dropping indexes and adding new ones
ADD KEY `genre`(genreid);

ALTER TABLE movie
CHANGE `productioncost` `costid` FLOAT;

 -- changing table name
ALTER TABLE `language` RENAME `movielanguage`;



-- inner joins

SELECT `users`.`firstname`, `users`.`lastname` 
FROM `users` 
INNER JOIN `moviecast` 
ON `users`.`userid` = `moviecast`.`addedby`;

-- inner join variation

SELECT `firstname`, `lastname` 
FROM `users` 
INNER JOIN `moviecast` 
ON `addedby` AS `m`, `userid` AS `u`
WHERE `m` = `u`;



-- adding not null constraint to column castid on table movies

ALTER TABLE `movie`.`movie`
  CHANGE `castid` `castid` INT (11) NOT NULL;
-- removing column `movieid` from table actors.

ALTER TABLE `movie`.`actors` 
DROP COLUMN `movieid`,
DROP INDEX `movieid`;

SELECT * FROM `actors`;

-- sub queries
-- i want to see the people who added the movies on the system, but i want to see all the movies regardless

SELECT *,
(SELECT CONCAT(firstname,' ',lastname)  FROM `users`
WHERE `users`.`userid` = `movie`.`addedby`) AS `userwhoadded`
FROM movie;

-- creating views for movies by the language they use
CREATE VIEW userview1
AS
SELECT*,
(SELECT languagename FROM movielanguage 
WHERE `movielanguage`.`languageid` = `movie`.`languageid`)movielingo -- using sub query instead of inner join
FROM movie;

-- inner join on more than one TABLE
SELECT *,
movielanguage.addedby,
users.username AS whoaddedmovie
FROM movie
INNER JOIN movielanguage ON `movie`.`languageid` = movielanguage.`languageid`
INNER JOIN users ON `movie`.`addedby` = users.`userid`;



  -- diaplaying the view
SELECT * FROM userview1;

-- stored procedures
-- creating procedure to view moview by their language

CREATE PROCEDURE sp_getmovielingo ()

	SELECT* FROM userview1;
-- calling the proceudure
CALL sp_getmovielingo;

-- creating procedure to add new actor

CREATE PROCEDURE sp_addactor(
	$firstname VARCHAR(50),
	$lastname  VARCHAR(50),
	$stagename VARCHAR(50),
	$addedby INT(11)
)

INSERT INTO `movie`.`actors` (`firstname`,`lastname`,`stagename`,`adddedby`)
VALUES ($firstname, $lastname, $stagename, $addedby);

-- calling sp_addactor
CALL sp_addactor('victor','miranji','miranji',NULL);


