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

INSERT INTO Team (TeamName, Country, League) VALUES
('Tottenham Hotspur', 'England', 'Premier League'),
('Napoli', 'Italy', 'Serie A'),
('Manchester United', 'England', 'Premier League'),
('Arsenal', 'England', 'Premier League'),
('Inter', 'Italy', 'Serie A'),
('Chelsea', 'England', 'Premier League'),
('Valencia CF', 'Spain', 'La Liga'),
('Borussia Dortmund', 'Germany', 'Bundesliga'),
('Lazio', 'Italy', 'Serie A'),
('RB Leipzig', 'Germany', 'Bundesliga'),
('Ajax', 'Netherlands', 'Eredivisie'),
('Crystal Palace', 'England', 'Premier League'),
('Everton', 'England', 'Premier League'),
('Sevilla FC', 'Spain', 'La Liga'),
('Milan', 'Italy', 'Serie A'),
('Borussia Mönchengladbach', 'Germany', 'Bundesliga'),
('Hertha BSC', 'Germany', 'Bundesliga'),
('LA Galaxy', 'USA', 'MLS'),
('Atalanta', 'Italy', 'Serie A'),
('Angers SCO', 'France', 'Ligue 1'),
('Athletic Club', 'Spain', 'La Liga'),
('SL Benfica', 'Portugal', 'Primeira Liga'),
('Guangzhou Evergrande Taobao FC', 'China', 'Chinese Super League'),
('RC Celta', 'Spain', 'La Liga'),
('Bayer 04 Leverkusen', 'Germany', 'Bundesliga'),
('Real Betis', 'Spain', 'La Liga'),
('Leicester City', 'England', 'Premier League'),
('FC Porto', 'Portugal', 'Primeira Liga'),
('West Ham United', 'England', 'Premier League'),
('Paris Saint-Germain', 'France', 'Ligue 1'), 
('RCD Espanyol', 'Spain', 'La Liga'),
('River Plate', 'Argentina', 'Primera División'),
('Bayer 04 Leverkusen', 'Germany', 'Bundesliga'); 




INSERT INTO Player (PlayerID, Name, Age, Nationality, Overall, Potential, Hits) VALUES
(202126, 'Harry Kane', 27, 'England', 89, 91, 64),
(194765, 'Antoine Griezmann', 29, 'France', 89, 89, 66),
(182521, 'Toni Kroos', 30, 'Germany', 89, 89, 37),
(177003, 'Luka Modric', 34, 'Croatia', 89, 89, 31),
(176580, 'Luis Suárez', 33, 'Uruguay', 89, 89, 54),
(167495, 'Manuel Neuer', 34, 'Germany', 89, 89, 42),
(155862, 'Sergio Ramos', 34, 'Spain', 89, 89, 55),
(210257, 'Ederson', 26, 'Brazil', 88, 91, 40),
(202652, 'Raheem Sterling', 25, 'England', 88, 90, 61),
(201942, 'Roberto Firmino', 28, 'Brazil', 88, 88, 79),
(201024, 'Kalidou Koulibaly', 29, 'Senegal', 88, 90, 78),
(200145, 'Casemiro', 28, 'Brazil', 88, 89, 37),
(193080, 'De Gea', 29, 'Spain', 88, 88, 39),
(192119, 'Thibaut Courtois', 28, 'Belgium', 88, 89, 34),
(189511, 'Sergio Busquets', 32, 'Spain', 88, 88, 34),
(188567, 'Pierre-Emerick Aubameyang', 31, 'Gabon', 88, 88, 114),
(165153, 'Karim Benzema', 32, 'France', 88, 88, 51),
(162835, 'Samir Handanovic', 36, 'Slovenia', 88, 88, 13),
(152729, 'Piqué', 33, 'Spain', 88, 88, 41),
(138956, 'Giorgio Chiellini', 35, 'Italy', 88, 88, 19),
(218667, 'Bernardo Silva', 25, 'Portugal', 87, 90, 53),
(212622, 'Joshua Kimmich', 25, 'Germany', 87, 90, 82),
(212218, 'Aymeric Laporte', 26, 'France', 87, 90, 38),
(211110, 'Paulo Dybala', 26, 'Argentina', 87, 90, 95),
(200104, 'Heung Min Son', 28, 'Korea Republic', 87, 87, 75);



INSERT INTO Player (PlayerID, Name, Age, Nationality, Overall, Potential, Hits) VALUES
(199556, 'Marco Verratti', 27, 'Italy', 87, 88, 45),
(195864, 'Paul Pogba', 27, 'France', 87, 88, 70),
(193041, 'Keylor Navas', 33, 'Costa Rica', 87, 87, 28),
(192387, 'Ciro Immobile', 30, 'Italy', 87, 87, 130),
(190460, 'Christian Eriksen', 28, 'Denmark', 87, 87, 48),
(189513, 'Parejo', 31, 'Spain', 87, 87, 14),
(188350, 'Marco Reus', 31, 'Germany', 87, 87, 42),
(186153, 'Wojciech Szczesny', 30, 'Poland', 87, 88, 17),
(183898, 'Ángel Di María', 32, 'Argentina', 87, 87, 41),
(182493, 'Diego Godín', 34, 'Uruguay', 87, 87, 16),
(178603, 'Mats Hummels', 31, 'Germany', 87, 87, 18),
(175943, 'Dries Mertens', 33, 'Belgium', 87, 87, 34),
(168542, 'David Silva', 34, 'Spain', 87, 87, 28),
(167948, 'Hugo Lloris', 33, 'France', 87, 87, 19),
(164240, 'Thiago Silva', 35, 'Brazil', 87, 87, 28),
(233049, 'Jadon Sancho', 20, 'England', 86, 94, 300),
(232363, 'Milan Škriniar', 25, 'Slovakia', 86, 90, 62),
(228702, 'Frenkie de Jong', 23, 'Netherlands', 86, 92, 126),
(222492, 'Leroy Sané', 24, 'Germany', 86, 90, 74),
(220440, 'Clément Lenglet', 25, 'France', 86, 90, 58),
(216267, 'Andrew Robertson', 26, 'Scotland', 86, 89, 66),
(212198, 'Bruno Fernandes', 25, 'Portugal', 86, 89, 127),
(212188, 'Timo Werner', 24, 'Germany', 86, 89, 136),
(209499, 'Fabinho', 26, 'Brazil', 86, 88, 44),
(208830, 'Jamie Vardy', 33, 'England', 86, 86, 43);


INSERT INTO Player (PlayerID, Name, Age, Nationality, Overall, Potential, Hits) VALUES
(208670, 'Hakim Ziyech', 27, 'Morocco', 86, 87, 113),
(207865, 'Marquinhos', 26, 'Brazil', 86, 90, 48),
(204485, 'Riyad Mahrez', 29, 'Algeria', 86, 86, 40),
(201535, 'Raphaël Varane', 27, 'France', 86, 89, 39),
(201399, 'Mauro Icardi', 27, 'Argentina', 86, 87, 47),
(198219, 'Lorenzo Insigne', 29, 'Italy', 86, 86, 42),
(193747, 'Koke', 28, 'Spain', 86, 86, 15),
(192505, 'Romelu Lukaku', 27, 'Belgium', 86, 87, 63),
(189509, 'Thiago', 29, 'Spain', 86, 86, 47),
(189332, 'Jordi Alba', 31, 'Spain', 86, 86, 35),
(184344, 'Leonardo Bonucci', 33, 'Italy', 86, 86, 17),
(184087, 'Toby Alderweireld', 31, 'Belgium', 86, 86, 16),
(180206, 'Miralem Pjanic', 30, 'Bosnia & Herzegovina', 86, 86, 31),
(179813, 'Edinson Cavani', 33, 'Uruguay', 86, 86, 26),
(177683, 'Yann Sommer', 31, 'Switzerland', 86, 86, 5),
(143076, 'Alejandro Gómez', 32, 'Argentina', 86, 86, 49),
(235243, 'Matthijs de Ligt', 20, 'Netherlands', 85, 92, 110),
(231866, 'Rodri', 24, 'Spain', 85, 89, 36),
(231281, 'Trent Alexander-Arnold', 21, 'England', 85, 90, 135),
(230658, 'Arthur', 23, 'Brazil', 85, 90, 64),
(230621, 'Gianluigi Donnarumma', 21, 'Italy', 85, 92, 62),
(226753, 'André Onana', 24, 'Cameroon', 85, 89, 55),
(223848, 'Sergej Milinkovic-Savic', 25, 'Serbia', 85, 90, 55),
(216594, 'Nabil Fekir', 27, 'France', 85, 87, 34);




INSERT INTO Player (PlayerID, Name, Age, Nationality, Overall, Potential, Hits) VALUES
(216460, 'José María Giménez', 25, 'Uruguay', 85, 89, 34),
(212190, 'Niklas Süle', 24, 'Germany', 85, 90, 42),
(208421, 'Saúl', 25, 'Spain', 85, 89, 39),
(206113, 'Serge Gnabry', 25, 'Germany', 85, 87, 79),
(205600, 'Samuel Umtiti', 26, 'France', 85, 88, 42),
(204963, 'Carvajal', 28, 'Spain', 85, 85, 24),
(198706, 'Luis Alberto', 27, 'Spain', 85, 86, 27),
(198176, 'Stefan de Vrij', 28, 'Netherlands', 85, 86, 19),
(197965, 'Pizzi', 30, 'Portugal', 85, 85, 14),
(197781, 'Isco', 28, 'Spain', 85, 85, 25),
(192629, 'Iago Aspas', 32, 'Spain', 85, 85, 10),
(192563, 'Bernd Leno', 28, 'Germany', 85, 87, 30),
(189596, 'Thomas Müller', 30, 'Germany', 85, 85, 23),
(189242, 'Coutinho', 28, 'Brazil', 85, 85, 49),
(189117, 'Roman Bürki', 29, 'Switzerland', 85, 86, 10),
(187961, 'Paulinho', 32, 'Brazil', 85, 85, 22),
(185122, 'Péter Gulácsi', 30, 'Hungary', 85, 86, 14),
(183711, 'Jordan Henderson', 30, 'England', 85, 85, 41),
(181291, 'Georginio Wijnaldum', 29, 'Netherlands', 85, 85, 40),
(177413, 'Axel Witsel', 31, 'Belgium', 85, 85, 26),
(173731, 'Gareth Bale', 31, 'Wales', 85, 85, 69),
(172871, 'Jan Vertonghen', 33, 'Belgium', 85, 85, 26),
(168651, 'Ivan Rakitic', 32, 'Croatia', 85, 85, 38),
(167664, 'Gonzalo Higuaín', 32, 'Argentina', 85, 85, 24),
(135507, 'Fernandinho', 35, 'Brazil', 85, 85, 14);



INSERT INTO Player (PlayerID, Name, Age, Nationality, Overall, Potential, Hits) VALUES
(41236, 'Zlatan Ibrahimovic', 38, 'Sweden', 85, 85, 189),
(235790, 'Kai Havertz', 21, 'Germany', 84, 93, 176),
(231677, 'Marcus Rashford', 22, 'England', 84, 89, 104),
(231478, 'Lautaro Martínez', 22, 'Argentina', 84, 91, 138),
(226790, 'Wilfred Ndidi', 23, 'Nigeria', 84, 88, 36),
(220814, 'Lucas Hernández', 24, 'France', 84, 89, 47),
(213345, 'Kingsley Coman', 24, 'France', 84, 88, 65),
(212462, 'Alex Telles', 27, 'Brazil', 84, 85, 42),
(212194, 'Julian Brandt', 24, 'Germany', 84, 88, 51),
(210243, 'Ricardo Pereira', 26, 'Portugal', 84, 86, 28),
(226456, 'Pablo Fornals', 24, 'Spain', 79, 85, 7),
(226229, 'Thilo Kehrer', 23, 'Germany', 79, 84, 31),
(225309, 'Nadiem Amiri', 23, 'Germany', 79, 85, 19),
(224309, 'Joan Jordán', 26, 'Spain', 79, 84, 10),
(224254, 'Cristian Pavón', 24, 'Argentina', 79, 85, 23),
(223724, 'Stefan Lainer', 27, 'Austria', 79, 80, 2),
(223113, 'Krzysztof Piatek', 25, 'Poland', 79, 84, 30),
(222943, 'Jony', 29, 'Spain', 79, 79, 11),
(222709, 'Petros', 31, 'Brazil', 79, 79, 2),
(222028, 'Julian Weigl', 24, 'Germany', 79, 82, 13),
(221491, 'Nico Elvedi', 23, 'Switzerland', 79, 84, 18),
(221479, 'Dominic Calvert-Lewin', 23, 'England', 79, 84, 11),
(221445, 'Wu Lei', 28, 'China PR', 79, 79, 16),
(220883, 'Rafael Santos Borré', 24, 'Colombia', 79, 85, 17),
(220523, 'Yerry Mina', 25, 'Colombia', 79, 83, 14);


INSERT INTO Player (PlayerID, Name, Age, Nationality, Overall, Potential, Hits) VALUES
(220408, 'Lucas Ocampos', 26, 'Argentina', 79, 82, 16),
(220040, 'André Almeida', 29, 'Portugal', 79, 79, 2),
(219683, 'Andreas Christensen', 24, 'Denmark', 79, 83, 16),
(219625, 'Mikel Merino', 24, 'Spain', 79, 84, 18),
(219547, 'Moussa Marega', 29, 'Mali', 79, 79, 11),
(219330, 'Jonathan Tah', 24, 'Germany', 79, 84, 20),
(219318, 'Djené', 28, 'Togo', 79, 80, 4),
(219299, 'Nélson Semedo', 26, 'Portugal', 79, 82, 31),
(219229, 'Ander Capa', 28, 'Spain', 79, 79, 6),
(219110, 'Renato Augusto', 32, 'Brazil', 79, 79, 5),
(218585, 'Lucas Torreira', 24, 'Uruguay', 79, 84, 23),
(218339, 'Emerson', 25, 'Brazil', 79, 82, 14);

SELECT * FROM Positions;



INSERT INTO Positions (PositionName, PositionCategory) VALUES
('LB', 'Defender'),
('RB', 'Defender'),
('CDM', 'Midfielder'),
('CAM', 'Midfielder'),
('RM', 'Midfielder'),
('LM', 'Midfielder');


INSERT INTO PlayerPositions (PlayerID, PositionID) VALUES
-- Harry Kane (ST)
(202126, 2),

-- Antoine Griezmann (ST|CF|LW)
(194765, 2),
(194765, 3),

-- Toni Kroos (CM)
(182521, 6),

-- Luka Modric (CM)
(177003, 6),

-- Luis Suárez (ST)
(176580, 2),

-- Manuel Neuer (GK)
(167495, 5),

-- Sergio Ramos (CB)
(155862, 4),

-- Ederson (GK)
(210257, 5),

-- Raheem Sterling (RW|LW)
(202652, 1),
(202652, 3),

-- Roberto Firmino (CF)
-- CF maps to ST (PositionID 2)
(201942, 2),

-- Kalidou Koulibaly (CB)
(201024, 4),

-- Casemiro (CDM)
(200145, 9),

-- De Gea (GK)
(193080, 5),

-- Thibaut Courtois (GK)
(192119, 5),

-- Sergio Busquets (CDM)
(189511, 9),

-- Aubameyang (ST|LM)
(188567, 2),
(188567, 12),

-- Karim Benzema (ST|CF)
(165153, 2),

-- Samir Handanovic (GK)
(162835, 5),

-- Piqué (CB)
(152729, 4),

-- Giorgio Chiellini (CB)
(138956, 4),

-- Bernardo Silva (CM|CAM|RW)
(218667, 6),
(218667, 10),
(218667, 1),

-- Joshua Kimmich (RB|CDM|CM)
(212622, 8),
(212622, 9),
(212622, 6),

-- Aymeric Laporte (CB)
(212218, 4),

-- Paulo Dybala (CAM|CF)
(211110, 10),
(211110, 2),

-- Heung Min Son (LM|CF)
(200104, 12),
(200104, 2),

-- Marco Verratti (CDM|CM)
(199556, 9),
(199556, 6),

-- Paul Pogba (CDM|CM)
(195864, 9),
(195864, 6),

-- Keylor Navas (GK)
(193041, 5),

-- Ciro Immobile (ST)
(192387, 2),

-- Christian Eriksen (RM|CM|CAM)
(190460, 11),
(190460, 6),
(190460, 10),

-- Parejo (CM)
(189513, 6),

-- Marco Reus (CAM|CF)
(188350, 10),
(188350, 2),

-- Szczesny (GK)
(186153, 5),

-- Ángel Di María (RW|LW)
(183898, 1),
(183898, 3),

-- Diego Godín (CB)
(182493, 4),

-- Mats Hummels (CB)
(178603, 4),

-- Dries Mertens (ST|CF)
(175943, 2);



INSERT INTO PlayerPositions (PlayerID, PositionID) VALUES
-- David Silva (CM|CAM)
(168542, 6),
(168542, 10),

-- Hugo Lloris (GK)
(167948, 5),

-- Thiago Silva (CB)
(164240, 4),

-- Jadon Sancho (RM|LM|CAM)
(233049, 11),
(233049, 12),
(233049, 10),

-- Milan Škriniar (CB)
(232363, 4),

-- Frenkie de Jong (CM)
(228702, 6),

-- Leroy Sané (LW)
(222492, 3),

-- Clément Lenglet (CB)
(220440, 4),

-- Andrew Robertson (LB)
(216267, 7),

-- Bruno Fernandes (CM|CAM)
(212198, 6),
(212198, 10),

-- Timo Werner (ST)
(212188, 2),

-- Fabinho (CDM)
(209499, 9),

-- Jamie Vardy (ST)
(208830, 2),

-- Hakim Ziyech (CAM|RW)
(208670, 10),
(208670, 1),

-- Marquinhos (CB|CDM)
(207865, 4),
(207865, 9),

-- Riyad Mahrez (RM|RW)
(204485, 11),
(204485, 1),

-- Raphaël Varane (CB)
(201535, 4),

-- Mauro Icardi (ST)
(201399, 2),

-- Lorenzo Insigne (LM|CF|LW)
(198219, 12),
(198219, 2),
(198219, 3),

-- Koke (RM|LM|CM)
(193747, 11),
(193747, 12),
(193747, 6),

-- Romelu Lukaku (ST)
(192505, 2),

-- Thiago (CDM|CM)
(189509, 9),
(189509, 6),

-- Jordi Alba (LB)
(189332, 7),

-- Leonardo Bonucci (CB)
(184344, 4),

-- Toby Alderweireld (CB)
(184087, 4),

-- Miralem Pjanic (CDM|CM)
(180206, 9),
(180206, 6),

-- Edinson Cavani (ST)
(179813, 2),

-- Yann Sommer (GK)
(177683, 5),

-- Alejandro Gómez (ST|CAM|CF)
(143076, 2),
(143076, 10),

-- Matthijs de Ligt (CB)
(235243, 4),

-- Rodri (CDM|CM)
(231866, 9),
(231866, 6),

-- Trent Alexander-Arnold (RB)
(231281, 8),

-- Arthur (CM)
(230658, 6),

-- Gianluigi Donnarumma (GK)
(230621, 5),

-- André Onana (GK)
(226753, 5),

-- Sergej Milinkovic-Savic (CDM|CM|CAM)
(223848, 9),
(223848, 6),
(223848, 10),

-- Nabil Fekir (ST|RM|CAM)
(216594, 2),
(216594, 11),
(216594, 10),

-- José María Giménez (CB)
(216460, 4),

-- Niklas Süle (CB)
(212190, 4),

-- Saúl (LB|LM|CM)
(208421, 7),
(208421, 12),
(208421, 6),

-- Serge Gnabry (RM|LM|RW)
(206113, 11),
(206113, 12),
(206113, 1),

-- Samuel Umtiti (CB)
(205600, 4),

-- Carvajal (RB)
(204963, 8);


USE term_project_giovanni_steva;

INSERT INTO PlayerPositions (PlayerID, PositionID) VALUES
-- Luis Alberto (CM|CAM|CF)
(198706, 6),
(198706, 10),
(198706, 2),

-- Stefan de Vrij (CB)
(198176, 4),

-- Pizzi (RM|CM)
(197965, 11),
(197965, 6),

-- Isco (CM|CAM|LW)
(197781, 6),
(197781, 10),
(197781, 3),

-- Iago Aspas (ST|RW)
(192629, 2),
(192629, 1),

-- Bernd Leno (GK)
(192563, 5),

-- Thomas Müller (RM|CAM|RW)
(189596, 11),
(189596, 10),
(189596, 1),

-- Coutinho (CM|CAM|LW)
(189242, 6),
(189242, 10),
(189242, 3),

-- Roman Bürki (GK)
(189117, 5),

-- Paulinho (CDM|CM|CAM)
(187961, 9),
(187961, 6),
(187961, 10),

-- Péter Gulácsi (GK)
(185122, 5),

-- Jordan Henderson (CDM|CM)
(183711, 9),
(183711, 6),

-- Georginio Wijnaldum (CDM|CM)
(181291, 9),
(181291, 6),

-- Axel Witsel (CDM|CM)
(177413, 9),
(177413, 6),

-- Gareth Bale (ST|RW|LW)
(173731, 2),
(173731, 1),
(173731, 3),

-- Jan Vertonghen (LB|CB)
(172871, 7),
(172871, 4),

-- Ivan Rakitic (CM)
(168651, 6),

-- Gonzalo Higuaín (ST)
(167664, 2),

-- Fernandinho (CB|CDM)
(135507, 4),
(135507, 9),

-- Zlatan Ibrahimovic (ST)
(41236, 2),

-- Kai Havertz (RM|CAM)
(235790, 11),
(235790, 10),

-- Marcus Rashford (ST|LM)
(231677, 2),
(231677, 12),

-- Lautaro Martínez (ST)
(231478, 2),

-- Wilfred Ndidi (CDM|CM)
(226790, 9),
(226790, 6),

-- Lucas Hernández (LB|CB)
(220814, 7),
(220814, 4),

-- Kingsley Coman (RM|LM|LW)
(213345, 11),
(213345, 12),
(213345, 3),

-- Alex Telles (LB)
(212462, 7),

-- Julian Brandt (LM|CM|CAM)
(212194, 12),
(212194, 6),
(212194, 10),

-- Ricardo Pereira (RB)
(210243, 8),

-- Pablo Fornals (RM|LM|CAM)
(226456, 11),
(226456, 12),
(226456, 10),

-- Thilo Kehrer (RB|CB)
(226229, 8),
(226229, 4),

-- Nadiem Amiri (CM|CAM)
(225309, 6),
(225309, 10),

-- Joan Jordán (CDM|CM|CAM)
(224309, 9),
(224309, 6),
(224309, 10),

-- Cristian Pavón (LM|RW|LW)
(224254, 12),
(224254, 1),
(224254, 3),

-- Stefan Lainer (RB)
(223724, 8),

-- Krzysztof Piatek (ST)
(223113, 2),

-- Jony (LM)
(222943, 12),

-- Petros (CDM|CM)
(222709, 9),
(222709, 6),

-- Julian Weigl (CB|CDM|CM)
(222028, 4),
(222028, 9),
(222028, 6),

-- Nico Elvedi (RB|CB)
(221491, 8),
(221491, 4),

-- Dominic Calvert-Lewin (ST)
(221479, 2),

-- Wu Lei (ST|RM|LM)
(221445, 2),
(221445, 11),
(221445, 12),

-- Rafael Santos Borré (ST)
(220883, 2),

-- Yerry Mina (CB)
(220523, 4),

-- Mattia Caldara (CB)
(220477, 4),

-- Munir (ST|RW|LW)
(220253, 2),
(220253, 1),
(220253, 3),

-- Ante Rebic (ST|CAM|LW)
(220018, 2),
(220018, 10),
(220018, 3),

-- Baptiste Santamaria (CDM|CM)
(219792, 9),
(219792, 6),

-- Stanislav Lobotka (CDM|CM)
(216435, 9),
(216435, 6),

-- Capa (RB)
(216189, 8);




INSERT INTO PlayerTeam (PlayerID, TeamID, StartYear, EndYear) VALUES
(202126, 9, 2021, NULL),
(194765, 1, 2021, NULL),
(182521, 8, 2021, NULL),
(177003, 8, 2021, NULL),
(176580, 1, 2021, NULL),
(167495, 7, 2021, NULL),
(155862, 8, 2021, NULL),
(210257, 6, 2021, NULL),
(202652, 6, 2021, NULL),
(201942, 4, 2021, NULL),
(201024, 10, 2021, NULL),
(200145, 8, 2021, NULL),
(193080, 11, 2021, NULL),
(192119, 8, 2021, NULL),
(189511, 1, 2021, NULL),
(188567, 12, 2021, NULL),
(165153, 8, 2021, NULL),
(162835, 13, 2021, NULL),
(152729, 1, 2021, NULL),
(138956, 2, 2021, NULL),
(218667, 6, 2021, NULL),
(212622, 7, 2021, NULL),
(212218, 6, 2021, NULL),
(211110, 2, 2021, NULL),
(200104, 9, 2021, NULL),
(199556, 3, 2021, NULL),
(195864, 11, 2021, NULL),
(193041, 3, 2021, NULL),
(192387, 17, 2021, NULL),
(190460, 16, 2021, NULL),
(189513, 15, 2021, NULL),
(188350, 16, 2021, NULL),
(186153, 2, 2021, NULL),
(183898, 3, 2021, NULL),
(182493, 13, 2021, NULL),
(178603, 16, 2021, NULL),
(175943, 10, 2021, NULL),
(168542, 6, 2021, NULL),
(167948, 9, 2021, NULL),
(164240, 3, 2021, NULL),
(233049, 16, 2021, NULL),
(232363, 13, 2021, NULL),
(228702, 1, 2021, NULL),
(222492, 6, 2021, NULL),
(220440, 1, 2021, NULL),
(216267, 4, 2021, NULL),
(212198, 11, 2021, NULL),
(212188, 18, 2021, NULL),
(209499, 4, 2021, NULL),
(208830, 35, 2021, NULL),
(208670, 19, 2021, NULL),
(207865, 3, 2021, NULL),
(204485, 6, 2021, NULL),
(201535, 8, 2021, NULL),
(201399, 3, 2021, NULL),
(198219, 10, 2021, NULL),
(193747, 5, 2021, NULL),
(192505, 13, 2021, NULL),
(189509, 7, 2021, NULL),
(189332, 1, 2021, NULL),
(184344, 2, 2021, NULL),
(184087, 9, 2021, NULL),
(180206, 2, 2021, NULL),
(179813, 3, 2021, NULL),
(177683, 24, 2021, NULL),
(143076, 27, 2021, NULL),
(235243, 2, 2021, NULL),
(231866, 6, 2021, NULL),
(231281, 4, 2021, NULL),
(230658, 1, 2021, NULL),
(230621, 23, 2021, NULL),
(226753, 19, 2021, NULL),
(223848, 17, 2021, NULL),
(216594, 34, 2021, NULL),
(216460, 5, 2021, NULL),
(212190, 7, 2021, NULL),
(208421, 5, 2021, NULL),
(206113, 7, 2021, NULL),
(205600, 1, 2021, NULL),
(204963, 8, 2021, NULL),
(198176, 13, 2021, NULL),
(197965, 30, 2021, NULL),
(197781, 8, 2021, NULL),
(192629, 32, 2021, NULL),
(192563, 12, 2021, NULL),
(189596, 7, 2021, NULL),
(189242, 7, 2021, NULL),
(189117, 16, 2021, NULL),
(187961, 31, 2021, NULL),
(185122, 18, 2021, NULL),
(183711, 4, 2021, NULL),
(181291, 4, 2021, NULL),
(177413, 16, 2021, NULL),
(173731, 8, 2021, NULL),
(172871, 9, 2021, NULL),
(168651, 1, 2021, NULL),
(167664, 2, 2021, NULL),
(135507, 6, 2021, NULL),
(41236, 23, 2021, NULL),
(235790, 33, 2021, NULL),
(231677, 11, 2021, NULL),
(231478, 13, 2021, NULL),
(226790, 35, 2021, NULL),
(220814, 7, 2021, NULL),
(213345, 7, 2021, NULL),
(212462, 36, 2021, NULL),
(212194, 16, 2021, NULL),
(210243, 35, 2021, NULL),
(226456, 37, 2021, NULL),
(226229, 3, 2021, NULL),
(225309, 33, 2021, NULL),
(224309, 22, 2021, NULL),
(224254, 26, 2021, NULL),
(223724, 24, 2021, NULL),
(223113, 25, 2021, NULL),
(222943, 17, 2021, NULL),
(222709, 999, 2021, NULL), 
(222028, 30, 2021, NULL),
(221491, 24, 2021, NULL),
(221479, 21, 2021, NULL),
(221445, 39, 2021, NULL),
(220883, 40, 2021, NULL),
(220523, 21, 2021, NULL),
(220477, 27, 2021, NULL),
(220253, 22, 2021, NULL),
(220018, 23, 2021, NULL),
(219792, 28, 2021, NULL),
(216435, 10, 2021, NULL),
(216189, 29, 2021, NULL);

