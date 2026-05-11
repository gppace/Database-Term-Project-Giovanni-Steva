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