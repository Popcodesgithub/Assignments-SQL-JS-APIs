drop database if exists GAMER_RANCH;

CREATE DATABASE GAMER_RANCH;

USE GAMER_RANCH;

-- Create table with constraints for the rating
CREATE TABLE REVIEWS
(R_ID INT PRIMARY KEY AUTO_INCREMENT, FullName VARCHAR (50) NOT NULL, Game VARCHAR(100) NOT NULL, Rating INT NOT NULL CHECK (Rating BETWEEN 0 AND 5), Review VARCHAR(400));

INSERT INTO REVIEWS
(R_ID, FullName, Game, Rating, Review)
VALUES
(1, 'Penelope Cruz','Fortnite',5, 'Amazing!'),
(2, 'Idris Elba' , 'Rocket League',2, 'only ok'),
(3, 'Rosamund Pike','Fortnite', 5, 'Just wow!'),
(4, 'Anne Hathaway','Fortnite',5,'So fun :)'),
(5, 'Roberto Benigni','Call of Duty',5, 'My new fav!'),
(6, 'Antonio Banderas','Fortnite',5, 'The best game, I/ve played in a a while'),
(7, 'Venus Williams','Rocket League', 3, 'It/s good but HUGE learning curve'),
(8, 'Rosa Diaz','Call of Duty', 5, 'Fantastic!');
