-- File: create-db-template.sql
CREATE DATABASE IF NOT EXISTS term_project_giovanni_steva
    DEFAULT CHARACTER SET = 'utf8mb4';

USE term_project_giovanni_steva;

-- 1. Base Table: Player
CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Nationality VARCHAR(50),
    Overall INT,
    Potential INT,
    Hits INT DEFAULT 0
);

-- 2. Base Table: Positions
CREATE TABLE Positions (
    PositionID INT AUTO_INCREMENT PRIMARY KEY,
    PositionName VARCHAR(10) NOT NULL UNIQUE,
    PositionCategory VARCHAR(20)
);

-- 3. Base Table: Team
CREATE TABLE Team (
    TeamID INT AUTO_INCREMENT PRIMARY KEY,
    TeamName VARCHAR(100) NOT NULL UNIQUE,
    Country VARCHAR(50),
    League VARCHAR(100)
);

-- 4. Junction Table: Player-Positions (Many-to-Many)
CREATE TABLE PlayerPositions (
    PlayerID INT,
    PositionID INT,
    PRIMARY KEY (PlayerID, PositionID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID) ON DELETE CASCADE,
    FOREIGN KEY (PositionID) REFERENCES Positions(PositionID) ON DELETE CASCADE
);

-- 5. Junction Table: Player-Team (Many-to-Many / History)
CREATE TABLE PlayerTeam (
    PlayerTeamID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerID INT,
    TeamID INT,
    StartYear INT, -- Using INT for better Python compatibility
    EndYear INT,
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID) ON DELETE CASCADE,
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID) ON DELETE CASCADE
);