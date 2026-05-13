USE term_project_giovanni_steva;

SELECT * FROM Player ORDER BY Overall DESC LIMIT 100;
SELECT * FROM Team LIMIT 100;
SELECT * FROM Positions LIMIT 100;
SELECT * FROM PlayerTeam LIMIT 100;
SELECT * FROM PlayerPositions LIMIT 100;

-- Join Statement: Select top 100 players with their Teams

SELECT 
    p.Name AS PlayerName, 
    t.TeamName, 
    p.Overall, 
    p.Nationality
FROM Player p
JOIN PlayerTeam pt ON p.PlayerID = pt.PlayerID
JOIN Team t ON pt.TeamID = t.TeamID
ORDER BY p.Overall DESC
LIMIT 100;


SELECT Nationality, COUNT(*) as PlayerCount, AVG(Overall) as AvgRating
FROM Player
GROUP BY Nationality
HAVING PlayerCount > 50
ORDER BY AvgRating DESC;


CREATE OR REPLACE VIEW vw_HighPotentialProspects AS
SELECT Name, Age, Overall, Potential, (Potential - Overall) as GrowthRoom, Nationality
FROM Player
WHERE Age < 23 AND Potential > 85;
SELECT * FROM vw_highpotentialprospects LIMIT 100;


CREATE ROLE IF NOT EXISTS 'DataAnalyst';

GRANT SELECT ON term_project_giovanni_steva.* TO 'DataAnalyst';

CREATE USER IF NOT EXISTS 'analyst_1'@'localhost' IDENTIFIED BY 'Pass123!';
CREATE USER IF NOT EXISTS 'analyst_2'@'localhost' IDENTIFIED BY 'Pass456!';

GRANT 'DataAnalyst' TO 'analyst_1'@'localhost', 'analyst_2'@'localhost';

SET DEFAULT ROLE 'DataAnalyst' FOR 'analyst_1'@'localhost';
SET DEFAULT ROLE 'DataAnalyst' FOR 'analyst_2'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'analyst_1'@'localhost';
SHOW GRANTS FOR 'analyst_2'@'localhost';