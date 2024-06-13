# CFG-Helen-Allen-Full-Stack

## Assignment 3  - GAMER RANCH DATABASE in SQL

### _Using MySQL and Workbench_


```
Please see below a diagram of the database and it's relationships
```
## Scenario

An online video game store needed a functional databse to keep track of their VIP players (aka members), stock, orders etc.
Using MySQL I have created a database that stores all the different games they keep in house, the stock quantity at any given time, the orders they get from customers, reviews from the customers and finally they specifally requested some help with low stock preventing orders. They often have customers complaining that they try to order but the game is out of stock.

To help we have created a series of queries that keep on top of their stock, some very simple queries show the tables as they are in the database, but we have also included some more complex queriers that help with specific questions. For exmaple they want to view stock levels info, in alphabetical order by quantiity, fewest in stock first to check what needs to be ordered.

Or, finding the top rated games, using order by Count to see at the top of the list, the game with the most 5 star ratings. So that popular games can be kept in stock, as they are more regularly purchased.

To further help with the issue of low stock, an alert has been created , so that when you run this function it highlights the games that are low in stock, based on a predteremined minimum, that the shop can decide and change based on their needs. When an item is low in stock an error message is saved.

Finally, there is a procedure that helps with new orders, and are a couple of scenarios for ordering products when they are in stock and when they are not.

##
### Below here you can see an overview of the database with the relationships, and data types. 
- Keys represent the primary key
- Red diamonds represent Foreign keys


<img src="Database model.jpg" >


## 
# <p align="center"> Thank you!</p>
