var mongoose = require('mongoose');
var models = require('../models/models.js');

var mongoUri = "mongodb://localhost:27017/game-of-thrones";

mongoose.set('useFindAndModify', false);
mongoose.set('useCreateIndex', true);
mongoose.set('useUnifiedTopology', true);
mongoose.connect(mongoUri, {useNewUrlParser: true});

db = mongoose.connection;

db.once('open', function() {
    console.log('database connected');
});

var controller = {
    addNew: function(model) {
        return new Promise(function(resolve, reject) {
            var object = new models.Income_message(model);

            object.save(function(err, s){
                if (err) {
                    reject(err);
                } else {
                    model.id = s._id;
                    resolve(s);
                }
            });
        });
    },
    
}

module.exports = controller;

