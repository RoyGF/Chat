var mongoose = require("mongoose");

var income_message = new mongoose.Schema({
    chat_id: String,
    author: { name: String, id: String },
    body: String,
});

var user = new mongoose.Schema({
    name: String,
    email: String,
    token: String,
});

module.exports = {
    Income_message: mongoose.model("Income_message", income_message),
    User: mongoose.model("User", user),
};
