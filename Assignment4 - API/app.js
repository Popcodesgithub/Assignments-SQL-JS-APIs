//Setup 
require('dotenv').config();
const pool = require('./db/pool')
const express = require('express');
const app =express();

app.use(express.json());

// Listen for requests
app.listen(3000);

//Requests
app.get("/" , (req, res) => {
    res.render('index');
});

//return all the reviews from the table reviews in DB.
app.get('/REVIEWS', async (req, res) => {
    try {
      const [result] = await pool.query('select * from REVIEWS')
    res.json(result)
    } catch (err) {
    res.status(500).json({ message: 'Problem - Check you have entered the data correctly' })
    }
});

//insert a new review to the table 'reviews' in DB.
app.post('/REVIEWS', async (req, res) => {
    const body = req.body;
    const {FullName, Game, Rating, Review } = body;
    if (!FullName || !Game || !Rating || !Review) {
    res.status(400).json({message: 'Bad request'})
    return
    }
    try {
    await pool.query(
        "insert into REVIEWS (FullName, Game, Rating, Review) values (?, ?, ?, ?)",
        [FullName, Game,  Rating, Review]
    );
    res.status(201).send({message: 'Review successfully created'})
    } catch (err) {
    res.status(500).json({ message: 'Problem - Check you have entered the data correctly' })
    }
});

//Delete a review from the table 'reviews' in DB, when the user gives their full name.
app.delete('/REVIEWS', async (req, res) => {
    const { FullName } = req.body;
    console.log(req.body);

    if (!FullName) {
        res.status(400).json({ message: 'Bad request' });
        return;
    }

    try {
        const [result] = await pool.query(
            "delete from REVIEWS where FullName = ?", [FullName]
        );

        if (result.affectedRows === 0) {
            res.status(404).json({ message: 'Review not found' });
        } else {
            res.status(200).send({ message: 'Review successfully deleted' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Problem - Check you have entered the data correctly' });
    }
});