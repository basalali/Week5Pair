-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)
Select * from city
INSERT city
(name, countrycode, district, population)
VALUES('Smallville', 'USA', 'Kansas', 45001)

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.
--Select * from countrylanguage
--where language = 'kryptonese'
INSERT countrylanguage
(countrycode, language, isofficial, percentage)
Values('USA', 'Kryptonese', 0, 0.0001)


-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.
UPDATE countrylanguage
SET language = 'Krypto-babble'
Where language = 'Kryptonese'

--Select * from countrylanguage
--Where language = 'krypto-babble'

-- 4. Set the US captial to Smallville, Kansas in the country table.
UPDATE country
SET capital = 4080
WHERE code = 'USA'

Select * from country
Where code = 'USA'

-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
DELETE 
from city
Where name = 'Smallville'

--No, because capital is a Foreign key in the Country table. Cannot delete a foreign key.


-- 6. Return the US captial to Washington.
Select * from country
Where capital = 3813

UPDATE country
SET capital = 3813
WHERE code = 'USA'

-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
DELETE
from city
Where name = 'Smallville'

-- Yes, because it is no longer a foreign key for the Country table.

-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)
BEGIN Transaction

Select * From countrylanguage cl
JOIN country c ON cl.countrycode = c.code
where c.indepyear >= 1800 AND c.indepyear <=1972 AND isofficial = 0
update countrylanguage
set isofficial =
	case isofficial
	when 1 then 0
	when 0 then 1
	end

Commit;

-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4079 rows affected)


-- 10. Assuming a country's surfacearea is expressed in square miles, convert it to 
-- square meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)
