CREATE DATABASE term_project_giovanni_steva
    DEFAULT CHARACTER SET = 'utf8mb4';

USE term_project_giovanni_steva


CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Nationality VARCHAR(50),
    Overall INT,
    Potential INT,
    Hits INT
);

CREATE TABLE Positions (
    PositionID INT AUTO_INCREMENT PRIMARY KEY,
    PositionName VARCHAR(10) NOT NULL,
    PositionCategory VARCHAR(20)
);

CREATE TABLE Team (
    TeamID INT AUTO_INCREMENT PRIMARY KEY,
    TeamName VARCHAR(100) NOT NULL,
    Country VARCHAR(50),
    League VARCHAR(100)
);

CREATE TABLE PlayerPositions (
    PlayerID INT,
    PositionID INT,

    PRIMARY KEY (PlayerID, PositionID),

    FOREIGN KEY (PlayerID)
        REFERENCES Player(PlayerID),

    FOREIGN KEY (PositionID)
        REFERENCES Positions(PositionID)
);

CREATE TABLE PlayerTeam (
    PlayerTeamID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerID INT,
    TeamID INT,
    StartYear YEAR,
    EndYear YEAR,

    FOREIGN KEY (PlayerID)
        REFERENCES Player(PlayerID),

    FOREIGN KEY (TeamID)
        REFERENCES Team(TeamID)
);

USE term_project_giovanni_steva;

INSERT INTO Player (PlayerID, Name, Age, Nationality, Overall, Potential, Hits) VALUES
(1, 'Lionel Messi', 33, 'Argentina', 93, 93, 224),
(2, 'Cristiano Ronaldo', 35, 'Portugal', 92, 92, 209),
(3, 'Neymar Jr', 28, 'Brazil', 91, 91, 158),
(4, 'Virgil van Dijk', 28, 'Netherlands', 90, 91, 96),
(5, 'Jan Oblak', 27, 'Slovenia', 91, 93, 89),
(6, 'Kevin De Bruyne', 28, 'Belgium', 91, 91, 146),
(7, 'Robert Lewandowski', 31, 'Poland', 91, 91, 128),
(8, 'Eden Hazard', 29, 'Belgium', 91, 91, 145),
(9, 'Alisson', 27, 'Brazil', 90, 92, 88),
(10, 'Mohamed Salah', 27, 'Egypt', 90, 90, 150);

INSERT INTO Positions (PositionID, PositionName, PositionCategory) VALUES
(1, 'RW', 'Forward'),
(2, 'ST', 'Forward'),
(3, 'LW', 'Forward'),
(4, 'CB', 'Defender'),
(5, 'GK', 'Goalkeeper'),
(6, 'CM', 'Midfielder');


INSERT INTO Team (TeamID, TeamName, Country, League) VALUES
(1, 'FC Barcelona', 'Spain', 'La Liga'),
(2, 'Juventus', 'Italy', 'Serie A'),
(3, 'Paris Saint-Germain', 'France', 'Ligue 1'),
(4, 'Liverpool', 'England', 'Premier League'),
(5, 'Atlético Madrid', 'Spain', 'La Liga'),
(6, 'Manchester City', 'England', 'Premier League'),
(7, 'FC Bayern München', 'Germany', 'Bundesliga'),
(8, 'Real Madrid', 'Spain', 'La Liga');


INSERT INTO PlayerPositions (PlayerID, PositionID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 2),
(8, 3),
(9, 5),
(10, 1);


INSERT INTO PlayerTeam (PlayerID, TeamID, StartYear, EndYear) VALUES
(1, 1, 2021, NULL),
(2, 2, 2021, NULL),
(3, 3, 2021, NULL),
(4, 4, 2021, NULL),
(5, 5, 2021, NULL),
(6, 6, 2021, NULL),
(7, 7, 2021, NULL),
(8, 8, 2021, NULL),
(9, 4, 2021, NULL),
(10, 4, 2021, NULL);
