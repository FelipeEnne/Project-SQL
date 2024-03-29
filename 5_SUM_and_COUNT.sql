-- SUM and COUNT

-- 1)
-- Show the total population of the world.
SELECT SUM(population)
FROM world

--  Answer 



-- 2)
-- List all the continents - just once each.

--  Answer  
SELECT DISTINCT continent
FROM world


-- 3)
-- Give the total GDP of Africa

--  Answer  
SELECT SUM(gdp)
 FROM world
  WHERE continent = 'Africa'



-- 4)
-- How many countries have an area of at least 1000000

-- Answer  
SELECT COUNT(name)
 FROM world
  WHERE area >= 1000000



-- 5)
-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')

--  Answer  
SELECT SUM(population )
 FROM world
  WHERE name IN ('Estonia', 'Latvia', 'Lithuania')



-- 6)
-- For each continent show the continent and number of countries.

--  Answer  
SELECT continent, COUNT(name)
  FROM world
 GROUP BY continent


-- 7)
-- For each continent show the continent and number of countries with populations of at least 10 million.

--  Answer  
SELECT continent, COUNT(name)
  FROM world
 WHERE population>=10000000
 GROUP BY continent


-- 8)
-- List the continents that have a total population of at least 100 million.

--  Answer  
SELECT continent
  FROM world
GROUP BY continent
HAVING SUM(population)>= 100000000
