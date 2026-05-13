-- File: term_project_queries_views_security.sql
USE term_project_giovanni_steva;

-- ==========================================
-- 1. QUERIES (Requirement: Top 100 & Joins)
-- ==========================================

-- Select top 100 players
SELECT * FROM Player ORDER BY Overall DESC LIMIT 100;

-- Join Statement: Select top 100 players with their Teams
SELECT p.Name, t.TeamName, p.Overall, t.League
FROM Player p
JOIN PlayerTeam pt ON p.PlayerID = pt.PlayerID
JOIN Team t ON pt.TeamID = t.TeamID
ORDER BY p.Overall DESC
LIMIT 100;

-- Aggregate: Summarize dataset by Nationality
SELECT Nationality, COUNT(*) as PlayerCount, AVG(Overall) as AvgRating
FROM Player
GROUP BY Nationality
HAVING PlayerCount > 50
ORDER BY AvgRating DESC;

-- ==========================================
-- 2. VIEW (Requirement: Useful Information)
-- ==========================================

CREATE OR REPLACE VIEW vw_HighPotentialProspects AS
SELECT Name, Age, Overall, Potential, (Potential - Overall) as GrowthRoom, Nationality
FROM Player
WHERE Age < 23 AND Potential > 85;

-- ==========================================
-- 3. SECURITY (Requirement: Roles & Privileges)
-- ==========================================

-- Create the role
CREATE ROLE IF NOT EXISTS 'DataAnalyst';

-- Grant SELECT only (no update, insert, delete)
GRANT SELECT ON term_project_giovanni_steva.* TO 'DataAnalyst';

-- Create users and assign the role
CREATE USER IF NOT EXISTS 'analyst_1'@'localhost' IDENTIFIED BY 'Pass123!';
CREATE USER IF NOT EXISTS 'analyst_2'@'localhost' IDENTIFIED BY 'Pass456!';

GRANT 'DataAnalyst' TO 'analyst_1'@'localhost', 'analyst_2'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;