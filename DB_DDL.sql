DROP TABLE IF EXISTS Contest;
DROP TABLE IF EXISTS Basket;
DROP TABLE IF EXISTS Assist;
DROP TABLE IF EXISTS Rebound;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS Game;

CREATE TABLE Game (
 GameID        INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 GameDate      DATE NOT NULL,
 GameRound     INT NOT NULL);
 
CREATE TABLE Team (
 TeamID          INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 TeamName        VARCHAR(45) NOT NULL,
 TeamRank        INT NOT NULL,
 SeasonWin       INT DEFAULT 0 NOT NULL,
 SeasonLose      INT DEFAULT 0 NOT NULL);
 
CREATE TABLE Player (
 PlayerID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
 PlayerName VARCHAR(45) NOT NULL,
 PlayerPosition VARCHAR(45) NOT NULL,
 TeamID INT NOT NULL,
 FOREIGN KEY(TeamID) REFERENCES Team(TeamID));
 
CREATE TABLE Contest (
 ContestID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
 Winner TINYINT NOT NULL,
 GameID INT NOT NULL,
 TeamID INT NOT NULL,
 FOREIGN KEY(GameID) REFERENCES Game(GameID),
 FOREIGN KEY(TeamID) REFERENCES Team(TeamID));
 
CREATE TABLE Rebound (
 ReboundID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
 GameID INT NOT NULL,
 PlayerID INT NOT NULL, 
 FOREIGN KEY(GameID) REFERENCES Game(GameID),
 FOREIGN KEY(PlayerID) REFERENCES Player(PlayerID));
 
CREATE TABLE Assist (
 AssistID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
 GameID INT NOT NULL,
 PlayerID INT NOT NULL,
 FOREIGN KEY(GameID) REFERENCES Game(GameID),
 FOREIGN KEY(PlayerID) REFERENCES Player(PlayerID));
 
CREATE TABLE Basket (
 BasketID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
 Points INT NOT NULL,
 GameID INT NOT NULL,
 PlayerID INT NOT NULL,
 FOREIGN KEY(GameID) REFERENCES Game(GameID),
 FOREIGN KEY(PlayerID) REFERENCES Player(PlayerID));