
# <p align="center"> Assignment 4 </p>

## Before using this code
Be sure you have npm installed the following dependencies in your JSON package: Node.js, Express.js, and mysql2 (I also installed nodemon which is a useful extension that monitors when you make changes, and restarts the server so you don't have to continually restart everytime you save). Any questions regarding versions check the package.json file in this repo.

Before the successful use of this code please make sure you check the .env.EXAMPLE file
. You must create your own version of this file on your computer, the .env.example file in this repo is just that...an example! :smirk:

Once you have created a new .env file, you will need to complete the file with your ospecific information e.g. your workbench password, the database name, your chosen port (Host and user can remain the same if you're working on your local computer). 

Finally if you change the database name or the port you are using, this must all then be updated in the app.js file in order to connect everything.

### Below here is a quick guide on how to use this code successfully:
##
## Example of how to retrieve the table in postman 
* Open postman and select new HTTP request, ensure the request type is 'GET', add your URL fot the local host e.g. "localhost:3000/REVIEWS".
* The body can remain blank but be sure to select JSON for the package type.
* Finally click send, and all the database rows will be generated in the body below.

<figure>
   <figcaption>Postman GET example</figcaption> 
   <img src="img\Postman GET example.jpg"
         alt="Postman GET example">
</figure>

* If you receive an error message in the body please double check you have correctly enetered the data. In this instance below, there is a typo in the URL so it won't load the information from the database.

<figure>
   <figcaption>Postman GET failure</figcaption> 
   <img src="img\Postman GET fail example.jpg"
         alt="Postman GET filure">
</figure>

## Example of how to insert a new review into the table using postman 
* Open postman and select new HTTP request, ensure the request type is 'POST', add your URL fot the local host e.g. "localhost:3000/REVIEWS".
* The body will need to contain the data you wish to insert in the database. See the example below for clarificaiton.
* Select JSON for the package type.
* Finally click send, and if the new row has bee successfully created you will see a confirmaiton message as in the figure.

<figure>
   <figcaption>New row successfully created in DB</figcaption> 
   <img src="img\Postman insert successful example.jpg"
         alt="New row successfully created in DB">
</figure>

> Here you can see the new row in MySQL.
<figure>
   <figcaption>New row successfully created in SQL DB</figcaption> 
   <img src="img\data successfully added in SQL.jpg"
         alt="New row successfully created in SQL DB">
</figure>

* If you receive an error message in the body please double check you have correctly enetered the data.

<figure>
   <figcaption>New row failure</figcaption> 
   <img src="img\Postman insert fail example.jpg"
         alt="New row failure">
</figure>

## Example of how to delete an exsiting review from the table using postman 
* Open postman and select new HTTP request, ensure the request type is 'DELETE', add your URL fot the local host e.g. "localhost:3000/REVIEWS".
* This query allows you to delete all posts made by one person, by selecting a persons full name.
    * Be aware, ALL reviews related to that person will be deleted.
      See the example in the figure below for clarificaiton on how to enter the full name correctly.
* Select JSON for the package type.
* Finally click send, and if the corresponding rows have been deleted in the database you will see a confirmaiton message as in the figure.

<figure>
   <figcaption>Successfully deleted item</figcaption> 
   <img src="img\Postman delete successful example.jpg"
         alt="Successfully deleted item">
</figure>

> Here you can see the row has been deleted and no longer appears in MySQL DB.
<figure>
   <figcaption>Successfully deleted item in SQL DB</figcaption> 
   <img src="img\data successfully deleted in SQL.jpg"
         alt="Successfully deleted item in SQL DB">
</figure>


* As above if you recieve an error message double check the data has been entered correctly! In the error below there was no review with this name found, the delete will fail. 

<figure>
   <figcaption>Postman DELETE failure</figcaption> 
   <img src="img\Postman DELETE fail example.jpg"
         alt="Postman DELETE failure">
</figure>

##
# <p align="center"> Thank you!</p>
