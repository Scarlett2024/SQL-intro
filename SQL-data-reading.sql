-- To check the database structure, type .schema in Terminal
-- To run the file, type .read filename.sql in Terminal
-- To read database, type sqlite3 filename.sqlite3 in Terminal
-- To quit from the database, type .quit in Terminal
-- To make format nicer, in Terminal type .mode columns, and .headers on

-- 1. Read data from SQL, Single table

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
-- AVG(varname): the average function; others include MAX(varname), MIN(varname) etc.
-- GROUP BY varname: group by the variable
-- How many teams played in the league in each year?
SELECT year, COUNT(name) FROM teams GROUP BY year

-- For each team, what is the average number of wins per season, in the 21st century?
SELECT name,AVG(wins) FROM teams WHERE year > 2000 GROUP BY name

-- In the modern era (1960-present), how many regular season games did the best team win each season?
SELECT year,name,MAX(wins) FROM teams WHERE year > 1960 GROUP BY year ORDER BY MAX(wins) DESC


-- 2. Read data from SQL, Multiple Tables

-- INNER JOIN table1 ON table1.varname = table2.varname (Take the joint part from both sides)
-- How many lifetime hits does Barry Bonds have?
SELECT players.id, players.first_name, players.last_name, SUM(stats.hits) 
FROM players INNER JOIN stats ON stats.player_id = players.id
WHERE players.first_name = 'Barry' AND players.last_name = 'Bonds';

-- What are the first and last names of the players who 
-- played for the 2020 Chicago Cubs? 
SELECT players.first_name, players.last_name 
FROM stats INNER JOIN teams ON teams.id = stats.team_id 
INNER JOIN players ON players.id = stats.player_id 
WHERE teams.year == 2020 AND teams.name == "Chicago Cubs";


-- Who hit the most home runs in 2019, and what team did they play for?
SELECT teams.name, players.first_name, players.last_name, stats.home_runs 
FROM stats INNER JOIN teams ON teams.id = stats.team_id 
INNER JOIN players ON players.id = stats.player_id   
WHERE teams.year == 2019 ORDER BY stats.home_runs DESC LIMIT 1;

-- Who was the leading home run hitter for each team in 2019?
SELECT teams.name, players.first_name, players.last_name, MAX(stats.home_runs) 
FROM stats INNER JOIN teams ON teams.id = stats.team_id 
INNER JOIN players ON players.id = stats.player_id 
WHERE teams.year == 2019 GROUP BY teams.name;

