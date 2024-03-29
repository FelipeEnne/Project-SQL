-- SELECT within SELECT

-- 1)
-- List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Romania')

--  Answer 
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')



-- 2)
-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

--  Answer  
SELECT name FROM world
  WHERE gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom') and continent = 'Europe'



-- 3)
-- List the name and continent of countries in the continents containing either Argentina or Australia. 
-- Order by name of the country.

--  Answer  
SELECT name, continent FROM world
  WHERE continent = (SELECT continent  FROM world WHERE name='Argentina') 
  OR continent = (SELECT continent  FROM world WHERE name='Australia')
ORDER BY name 



-- 4)
-- Which country has a population that is more than Canada but less than Poland?
-- Show the name and the population.

-- Answer  
SELECT name, population FROM world
  WHERE population > (SELECT population FROM world WHERE name='Canada ') 
  AND population < (SELECT population FROM world WHERE name='Poland')



-- 5)
-- Show the name and the population of each country in Europe. Show the population as a 
-- percentage of the population of Germany.


--  Answer  
SELECT name, CONCAT(
             ROUND(
            (population/(SELECT population FROM world WHERE 
             name='Germany'))*100
             , 0)
            ,'%')
FROM world
  WHERE continent = 'Europe'




-- 6)
-- Which countries have a GDP greater than every country in Europe? [Give the name only.] 
-- (Some countries may have NULL gdp values)

--  Answer  
SELECT name FROM world
  WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent='Europe')



-- 7)
-- Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, population FROM world x
  WHERE population >= ALL
    (SELECT population FROM world y
        WHERE y.continent=x.continent
          AND population>0)

--  Answer  
SELECT continent,name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area >0)



-- 8)
-- List each continent and the name of the country that comes first alphabetically.

--  Answer  
SELECT continent, name FROM world x
  WHERE name <= ALL(SELECT name FROM world y
        WHERE y.continent=x.continent ORDER BY name)
ORDER BY continent



-- 9)
-- Find the continents where all countries have a population <= 25000000.
-- Then find the names of the countries associated with these continents. 
-- Show name, continent and population.

--  Answer  
SELECT name, continent, population FROM world x
  WHERE 25000000 >= ALL
    (SELECT population FROM world y
        WHERE y.continent=x.continent)




-- 10)
-- Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910,
-- not including 1910) together with winners of a 'Literature' prize in a later year 
-- (after 2004, including 2004)

--  Answer  
SELECT name, continent FROM world x
  WHERE population >= ALL
    (SELECT population*3 FROM world y
        WHERE y.continent=x.continent AND y.name <> x.name)

