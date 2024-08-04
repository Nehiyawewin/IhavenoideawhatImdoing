const express = require('express');
const router = express.Router();

let messages = [];

router.get('/', (req, res) => {
    res.json(messages);
});

router.post('/', (req, res) => {
    const message = req.body;
    messages.push(message);
    res.status(201).json(message);
});

module.exports = router;
