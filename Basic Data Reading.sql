-- To check the database structure, type .schema in Terminal
-- To run the file, type .read filename.sql in Terminal
-- To read database, type sqlite3 filename.sqlite3 in Terminal
-- To quit from the database, type .quit in Terminal
-- To make format nicer, type .mode columns, and .headers on in Terminal

-- 1. Read data from SQL, single table

-- SELECT __ FROM __: select colums from 
-- Get the first and last name of every player in the database.
SELECT first_name, last_name FROM players;

-- ORDER BY varname DESC: sort by variable, from high to low
-- LIMIT 1: select only the first line
-- Show a list of all teams by year and number of wins, starting with fewest wins
SELECT year,name,wins FROM teams ORDER BY wins;

-- Which three teams had the losingest seasons?
SELECT name,wins,losses FROM teams ORDER BY losses DESC LIMIT 3;

-- WHERE var > 100: filter based on conditions (<,>,==,etc.)
-- What teams have won more than 100 games in a single season, chronologically?
SELECT year,name,wins FROM teams WHERE wins > 100 ORDER BY year;

-- What was the last team (and year) to play at U.S. Cellular Field?
SELECT year,name FROM teams WHERE park == "U.S. Cellular Field" 
ORDER BY year DESC LIMIT 1;

-- COUNT(varname): the count function
-- AVG(varname): the average function
-- GROUP BY varname: group by the variable
-- How many teams played in the league in each year?
SELECT year, COUNT(name) FROM teams GROUP BY year

-- For each team, what is the average number of wins per season, in the 21st century?
SELECT name,AVG(wins) FROM teams WHERE year > 2000 GROUP BY name

-- In the modern era (1960-present), how many regular season games did the best team win each season?
SELECT year,name,MAX(wins) FROM teams WHERE year > 1960 GROUP BY year ORDER BY MAX(wins) DESC
