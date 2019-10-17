-- Write queries to return the following:
-- The following queries utilize the "world" database.

-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
-- (36 rows)
SELECT * FROM city
SELECT * FROM country

SELECT ct.name, ct.district, ct.population FROM city ct
JOIN  country cr ON ct.countrycode = cr.code
WHERE continent = 'Europe' and ct.population > 1000000
	

-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
-- (2 rows)
SELECT * FROM city
SELECT * FROM countrylanguage

SELECT ct.name, ct.countrycode, ct.population FROM city ct
Join countrylanguage cl ON ct.countrycode = cl.countrycode
Where language = 'French' AND ct.population > 1000000 AND cl.isofficial = 1


-- 3. The name of the countries and continents where the language Javanese is spoken
-- (1 row)
SELECT * FROM country
SELECT * FROM countrylanguage

SELECT name, continent FROM country cr
JOIN countrylanguage cl ON cr.code = cl.countrycode
Where language = 'Javanese'

-- 4. The names of all of the countries in Africa that speak French as an official language
-- (5 row)
SELECT * FROM country cr
SELECT * FROM countrylanguage cl

SELECT name FROM country cr
JOIN countrylanguage cl ON cr.code	= cl.countrycode
Where cr.continent = 'Africa' AND cl.language = 'French' AND isofficial = 1


-- 5. The average city population of cities in Europe
-- (average city population in Europe: 287,684)
SELECT * FROM city
SELECT * FROM country

SELECT AVG(ct.population) FROM city ct
JOIN country cr ON ct.countrycode = cr.code
Where cr.continent = 'Europe'

-- 6. The average city population of cities in Asia
-- (average city population in Asia: 395,019)
SELECT * FROM city
SELECT * FROM country

SELECT AVG(ct.population) FROM city ct
JOIN country cr ON ct.countrycode = cr.code
Where cr.continent = 'Asia'

-- 7. The number of cities in countries where English is an official language
-- (number of cities where English is official language: 523)
SELECT * FROM city
SELECT * FROM countrylanguage

SELECT count(*) FROM city ct
JOIN countrylanguage cl ON cl.countrycode = ct.countrycode
Where cl.language = 'English' AND cl.isofficial = 1

-- 8. The average population of cities in countries where the official language is English
-- (average population of cities where English is official language: 285,809)
SELECT * FROM city
SELECT * FROM country

SELECT AVG(ct.population) AvgPop FROM city ct
JOIN countrylanguage cl ON cl.countrycode = ct.countrycode
Where cl.language = 'English' AND cl.isofficial = 1

-- 9. The names of all of the continents and the population of the continent’s largest city
-- (6 rows, largest population for North America: 8,591,309)
SELECT * FROM city
SELECT * FROM country

SELECT continent, Max(ct.population) AvgPop  FROM country cr
JOIN city ct ON  ct.countrycode = cr.code
GROUP BY continent


-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city’s country
-- (29 rows)
SELECT ct.name FROM city ct
JOIN country cr ON ct.countrycode = cr.code
JOIN countrylanguage cl ON cl.countrycode = ct.countrycode
WHERE cr.continent = 'South America' AND ct.population > 1000000 AND cl.isofficial = 1
