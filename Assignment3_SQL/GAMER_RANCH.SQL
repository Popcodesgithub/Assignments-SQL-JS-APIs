drop database if exists GAMER_RANCH;

CREATE DATABASE GAMER_RANCH;

USE GAMER_RANCH;

-- Create table 1
CREATE TABLE GAMES
(Game VARCHAR(100) PRIMARY KEY NOT NULL, Price FLOAT);
INSERT INTO GAMES
(Game, Price)
VALUES
( 'Call of Duty', 79.99),
( 'Rocket League', 59.99),
( 'Fortnite', 69.99),
('Counter Strike 2', 59.99),
( 'FIFA', 59.99),
( 'Grand Theft Auto', 69.99),
( 'NBA 2K', 59.99),
('Overwatch', 69.99);

-- Create table 2 including constraints for phone number and a default for location.
CREATE TABLE VIP_PLAYERS
(P_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT, First_Name VARCHAR(50), Last_Name VARCHAR(50), Location VARCHAR(50) DEFAULT 'UNKNOWN', Email VARCHAR(150) NOT NULL, Phone_Number VARCHAR(10)CHECK (Phone_Number BETWEEN 0 and 9999999999));
INSERT INTO VIP_PLAYERS
(First_Name, Last_Name, Location, Email, Phone_Number)
VALUES
( 'Idris', 'Elba', 'London', 'idriselba@gamestore.com', 0123862846),
( 'Roberto', 'Benigni', 'Milan', 'benignirob123@gamestore.com', 017689364),
( 'Jean', 'Reno', 'Paris', 'jeanreno@gamestore.com', 0467284761),
( 'Marian','Cotillard', 'Paris', 'marianparis@gamestore.com', 0764864532),
( 'Rosamund', 'Pike', 'London', 'londonpike@gamestore.com', 0784382987),
( 'Peelope', 'Cruz', 'Madrid', 'penecruz@gamestore.com', 0756835287),
( 'Anne', 'Hathaway', 'Brooklyn', 'annehathaway@gamestore.com', 0543654376),
( 'Antonio', 'Banderas', 'Madrid', 'antband@gamestore.com', 0765438765);

-- Create table 3
CREATE TABLE STOCK
(S_ID INT PRIMARY KEY AUTO_INCREMENT, Quantity INT, game VARCHAR(100) NOT NULL, FOREIGN KEY(Game) REFERENCES GAMES(Game), Minimum INT );

INSERT INTO STOCK
(Quantity, game, Minimum)
VALUES
( 2, 'Call of Duty',1),
( 4, 'Rocket League', 1),
( 2, 'Fortnite', 2), -- our most popular game!
( 3, 'Counter Strike 2', 1),
( 3, 'Grand Theft Auto', 1),
( 1, 'FIFA', 1),
( 8, 'NBA 2K', 1),
( 3, 'Overwatch', 1);

-- Create table 4  (DOP is 'date of purchase').
CREATE TABLE ORDERS
(O_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT, Quantity INT, DOP TIMESTAMP DEFAULT CURRENT_TIMESTAMP,game VARCHAR(100) NOT NULL, FOREIGN KEY(Game) REFERENCES GAMES(Game), P_ID INT NOT NULL, FOREIGN KEY(P_ID) REFERENCES VIP_PLAYERS(P_ID));

INSERT INTO ORDERS
( Quantity, DOP,game, P_ID )
VALUES
( 1,'2023-02-28' ,'Rocket League', 1),
( 1,'2023-04-12' , 'Fortnite', 1),
( 1, '2023-05-09' ,'FIFA', 2),
( 1,'2023-01-25' , 'Fortnite', 3),
( 1, '2023-12-28' ,'Fortnite', 4),
( 1, '2023-11-13' ,'Fortnite', 5),
( 1,'2023-05-28' , 'Overwatch', 6),
( 1, '2023-06-18' ,'NBA 2K', 7),
( 1, '2023-01-07' ,'Counter Strike 2', 7);

-- Create table 4 with constraints for the rating
CREATE TABLE REVIEWS
(R_ID INT PRIMARY KEY, game VARCHAR(100) NOT NULL, FOREIGN KEY(Game) REFERENCES GAMES(Game), P_ID INT NOT NULL, FOREIGN KEY(P_ID) REFERENCES VIP_PLAYERS(P_ID), Rating INT NOT NULL CHECK (Rating BETWEEN 0 AND 5));

INSERT INTO REVIEWS
(R_ID, game, P_ID, Rating)
VALUES
(1, 'Fortnite', 1, 5),
(2, 'Rocket League', 2, 2),
(3, 'Fortnite', 3, 5),
(4, 'Fortnite', 4, 5),
(5, 'Call of Duty', 5, 5),
(6, 'Fortnite', 6, 5),
(7, 'Rocket League', 7, 3),
(8, 'Call of Duty', 7, 5);

-- Find the game name and price, in alphabetical order.
SELECT Game, Price FROM GAMES 
ORDER BY Game;

-- View VIP Player Membership info, in alphabetical order by Last name  .
SELECT * FROM VIP_PLAYERS 
ORDER BY Last_Name;

-- View stock levels info, in alphabetical order by quantiity, (fewest in stock first to check what needs ordering).
SELECT * FROM STOCK 
ORDER BY Quantity;

-- View processed orders, in cronological order with the latest order at the top of the list.
SELECT * FROM ORDERS 
ORDER BY DOP DESC;

-- View stock levels info, in alphabetical order by quantiity, (fewest in stock first to check what needs ordering).
SELECT * FROM REVIEWS
ORDER BY RATING;

DELETE FROM VIP_PLAYERS WHERE First_Name = 'Antonio' AND Last_Name = 'Banderas';
SELECT * FROM VIP_PLAYERS;

-- Find the game name for each order made in London, in alphabetical order.
SELECT g.* FROM GAMES g
JOIN ORDERS o
ON g.Game  = o.game
JOIN VIP_PLAYERS p 
ON o.P_ID = p.P_ID 
WHERE p.Location = 'London' 
ORDER BY Game;

-- View reviews from customers, but we see this select is not very useful because although it orders by rating it doesn't group the games together and it's difficult to understand
SELECT * FROM REVIEWS
ORDER BY RATING DESC;
-- which is the highest rated game. INSTEAD below is a join which is much more useful!

-- Find the top rated games, using order by Count to see at the top of the list, the game with the most 5 star ratings.
SELECT r.game, COUNT(r.game) AS Total, r.Rating
FROM REVIEWS r
JOIN GAMES g
ON r.game  = g.Game 
WHERE r.Rating = 5 
GROUP BY Game
ORDER BY Total DESC;

-- Find the total number of orders for each location, in descending order.
SELECT g.*, SUM(Quantity) AS Total FROM GAMES g
JOIN ORDERS o
ON g.Game  = o.game
JOIN VIP_PLAYERS p 
ON o.P_ID = p.P_ID 
WHERE p.Location = 'Paris' 
GROUP BY Game
ORDER BY Total DESC;

/*Creating an alert for low stock items, and an alert message. The output shows only 1 FIFA and only 2 FORTNITE left in stock. 
They show up with different quantities because the minimum has previously been set. 
Since Fortnite is the most popular game the minimum is set to 2, whereas the other are all set to 1. 
This Alert then returns the low stock items in alphabetical order.
*/
CREATE TABLE ALERT_LOW_STOCK
(game VARCHAR(150)PRIMARY KEY NOT NULL, FOREIGN KEY(Game) REFERENCES GAMES(Game), AlertType VARCHAR(50) NULL, AlertDescription VARCHAR(255) NULL);

INSERT INTO ALERT_LOW_STOCK (game, AlertType, AlertDescription)
    SELECT game, Quantity, 
        CONCAT('There is only ', Quantity, ' ', game, ' ','left in stock')
    FROM STOCK
    WHERE Quantity <= Minimum;
SELECT * FROM ALERT_LOW_STOCK ORDER BY Game;

/*Creating a procedure for a new order, this first checks there is enough stock to prcoess the ordedr, if not there is an error.
    Oherwise, the prcoedure will continue to insert the new order into the order table using today's date and reduce the stock quantity by the value of the order. 
*/
DROP PROCEDURE IF EXISTS AddNewOrder;
DELIMITER //

CREATE PROCEDURE AddNewOrder(
	IN p_quantity INT,
    IN p_game VARCHAR(100),
    IN p_pid INT
)
BEGIN
    DECLARE current_stock INT;

    START TRANSACTION;

    SELECT Quantity INTO current_stock
    FROM STOCK
    WHERE Game = p_game
    FOR UPDATE;

    IF current_stock < p_quantity THEN
        ROLLBACK;
    ELSE
        INSERT INTO ORDERS (Quantity, DOP, Game, P_ID)
        VALUES (p_quantity,CURDATE(), p_game, p_pid);

        UPDATE STOCK
        SET Quantity = Quantity - p_quantity
        WHERE Game = p_game;

        COMMIT;
    END IF;
END //
DELIMITER ;

/* The below sceanrio will play out a new order by verifying the current stock for 'Fortnite' our most popular game.
   Then calling the new procedure AddNewOrder from above, to process a new order for Fortnite.
   Finally I want to see the new order and check the stock has been correctly updated. 
*/

SELECT * FROM STOCK WHERE game = 'Grand Theft Auto';
CALL AddNewOrder (1,'Grand Theft Auto', 1);
SELECT * FROM ORDERS ORDER BY DOP DESC;
SELECT * FROM STOCK WHERE game = 'Grand Theft Auto';

/* The below sceanrio will play out a new order by verifying the current stock for 'Fortnite' our most popular game.
   Unfortunately, we do not have enough in stock to process the order and so there will be no changes made (this can be seen in the log,
   it indicates 0 rows were affected byt the procdure). 
*/

CALL AddNewOrder (1,'Overwatch', 1);
