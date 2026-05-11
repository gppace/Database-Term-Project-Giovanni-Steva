SELECT 
    PlayerID,
    Name,
    Age,
    Nationality,
    Overall,
    Potential,
    Hits
FROM Player
ORDER BY Overall DESC, Hits DESC
LIMIT 30;

SELECT 
    PositionID,
    PositionName,
    PositionCategory
FROM Positions
ORDER BY PositionID
LIMIT 30;

SELECT 
    TeamID,
    TeamName,
    Country,
    League
FROM Team
ORDER BY TeamID
LIMIT 30;

SELECT 
    PlayerID,
    PositionID
FROM PlayerPositions
ORDER BY PlayerID
LIMIT 30;

SELECT 
    PlayerTeamID,
    PlayerID,
    TeamID,
    StartYear,
    EndYear
FROM PlayerTeam
ORDER BY PlayerTeamID
LIMIT 30;

SELECT
    p.PlayerID,
    p.Name AS PlayerName,
    p.Age,
    p.Nationality,
    p.Overall,
    p.Potential,
    t.TeamName,
    t.Country AS TeamCountry,
    t.League,
    pt.StartYear,
    pt.EndYear
FROM Player p
INNER JOIN PlayerTeam pt ON p.PlayerID = pt.PlayerID
INNER JOIN Team t ON pt.TeamID = t.TeamID
ORDER BY p.Overall DESC, p.Hits DESC
LIMIT 30;

SELECT 
    COUNT(*) AS TotalPlayers,
    AVG(Overall) AS AverageOverallRating,
    MIN(Overall) AS LowestOverallRating,
    MAX(Overall) AS HighestOverallRating,
    AVG(Age) AS AveragePlayerAge,
    MIN(Age) AS YoungestPlayer,
    MAX(Age) AS OldestPlayer,
    SUM(Hits) AS TotalHits
FROM Player;

SELECT
    Nationality,
    COUNT(*) AS PlayerCount,
    AVG(Overall) AS AverageOverallRating,
    MAX(Overall) AS TopPlayerRating,
    AVG(Age) AS AverageAge
FROM Player
GROUP BY Nationality
ORDER BY PlayerCount DESC, AverageOverallRating DESC
LIMIT 10;

SELECT 
    t.TeamName,
    t.League,
    COUNT(DISTINCT p.PlayerID) AS PlayerCount,
    AVG(p.Overall) AS AverageTeamOverall,
    MAX(p.Overall) AS TopPlayerOverall,
    MIN(p.Overall) AS LowestPlayerOverall
FROM Team t
LEFT JOIN PlayerTeam pt ON t.TeamID = pt.TeamID
LEFT JOIN Player p ON pt.PlayerID = p.PlayerID
GROUP BY t.TeamID, t.TeamName, t.League
HAVING COUNT(DISTINCT p.PlayerID) > 0
ORDER BY PlayerCount DESC, AverageTeamOverall DESC;

SELECT 
    pos.PositionName,
    pos.PositionCategory,
    COUNT(DISTINCT pp.PlayerID) AS PlayerCount,
    AVG(p.Overall) AS AverageOverall
FROM Positions pos
LEFT JOIN PlayerPositions pp ON pos.PositionID = pp.PositionID
LEFT JOIN Player p ON pp.PlayerID = p.PlayerID
GROUP BY pos.PositionID, pos.PositionName, pos.PositionCategory
ORDER BY PlayerCount DESC;


CREATE OR REPLACE VIEW vw_PlayerProfiles AS
SELECT 
    p.PlayerID,
    p.Name AS PlayerName,
    p.Age,
    p.Nationality,
    p.Overall,
    p.Potential,
    p.Hits,
    GROUP_CONCAT(DISTINCT t.TeamName SEPARATOR ', ') AS Teams,
    GROUP_CONCAT(DISTINCT pos.PositionName SEPARATOR ', ') AS Positions,
    GROUP_CONCAT(DISTINCT t.League SEPARATOR ', ') AS Leagues
FROM Player p
LEFT JOIN PlayerTeam pt ON p.PlayerID = pt.PlayerID
LEFT JOIN Team t ON pt.TeamID = t.TeamID
LEFT JOIN PlayerPositions pp ON p.PlayerID = pp.PlayerID
LEFT JOIN Positions pos ON pp.PositionID = pos.PositionID
GROUP BY p.PlayerID;

CREATE OR REPLACE VIEW vw_ElitePlayers AS
SELECT 
    p.PlayerID,
    p.Name,
    p.Age,
    p.Overall,
    p.Potential,
    (p.Potential - p.Overall) AS GrowthPotential,
    CASE 
        WHEN p.Overall >= 90 THEN 'World Class'
        WHEN p.Overall >= 85 THEN 'Elite'
        WHEN p.Overall >= 80 THEN 'Very Good'
        ELSE 'Good'
    END AS PlayerTier,
    t.TeamName,
    t.League,
    p.Hits
FROM Player p
LEFT JOIN PlayerTeam pt ON p.PlayerID = pt.PlayerID
LEFT JOIN Team t ON pt.TeamID = t.TeamID
WHERE p.Overall >= 85;

CREATE OR REPLACE VIEW vw_TeamRosterSummary AS
SELECT 
    t.TeamID,
    t.TeamName,
    t.Country,
    t.League,
    COUNT(DISTINCT p.PlayerID) AS RosterSize,
    AVG(p.Overall) AS AverageOverall,
    MAX(p.Overall) AS TopPlayerOverall,
    MIN(p.Overall) AS LowestPlayerOverall,
    SUM(p.Hits) AS TotalTeamHits
FROM Team t
LEFT JOIN PlayerTeam pt ON t.TeamID = pt.TeamID
LEFT JOIN Player p ON pt.PlayerID = p.PlayerID
GROUP BY t.TeamID, t.TeamName, t.Country, t.League;

CREATE OR REPLACE VIEW vw_PlayerPerformance AS
SELECT 
    p.PlayerID,
    p.Name,
    p.Overall,
    p.Age,
    CASE 
        WHEN p.Age < 24 THEN 'Young Prospect'
        WHEN p.Age < 30 THEN 'Prime'
        ELSE 'Veteran'
    END AS AgeCategory,
    CASE 
        WHEN p.Hits > 150 THEN 'Very High Demand'
        WHEN p.Hits > 100 THEN 'High Demand'
        WHEN p.Hits > 50 THEN 'Moderate Demand'
        ELSE 'Low Demand'
    END AS DemandLevel,
    p.Hits,
    p.Nationality
FROM Player p
WHERE p.Overall >= 85;

CREATE ROLE DataAnalystRole;

GRANT SELECT ON term_project_giovanni_steva.Player TO DataAnalystRole;
GRANT SELECT ON term_project_giovanni_steva.Team TO DataAnalystRole;
GRANT SELECT ON term_project_giovanni_steva.Positions TO DataAnalystRole;
GRANT SELECT ON term_project_giovanni_steva.PlayerTeam TO DataAnalystRole;
GRANT SELECT ON term_project_giovanni_steva.PlayerPositions TO DataAnalystRole;
GRANT SELECT ON term_project_giovanni_steva.vw_PlayerProfiles TO DataAnalystRole;
GRANT SELECT ON term_project_giovanni_steva.vw_ElitePlayers TO DataAnalystRole;
GRANT SELECT ON term_project_giovanni_steva.vw_TeamRosterSummary TO DataAnalystRole;
GRANT SELECT ON term_project_giovanni_steva.vw_PlayerPerformance TO DataAnalystRole;


CREATE USER 'analyst_user1'@'localhost' IDENTIFIED BY 'SecurePassword123!';
CREATE USER 'analyst_user2'@'localhost' IDENTIFIED BY 'SecurePassword456!';
CREATE USER 'analyst_user3'@'localhost' IDENTIFIED BY 'SecurePassword789!';

GRANT DataAnalystRole TO 'analyst_user1'@'localhost';
GRANT DataAnalystRole TO 'analyst_user2'@'localhost';
GRANT DataAnalystRole TO 'analyst_user3'@'localhost';

FLUSH PRIVILEGES;
