var controller = {
    addNew: function (qry, model) {
        return new Promise(function (resolve, reject) {
            var object = new model(qry);
            object.save(function (err, s) {
                if (err) {
                    reject(err);
                } else {
                    console.log("done", s.id);
                    resolve(s.id);
                }
            });
        });
    },

    update: function (qry, update, model) {
        return new Promise(function (resolve, reject) {
            model.updateOne(
                qry,
                update
            )(function (err, s) {
                console.log("done", s);
                resolve(s);
            });
        });
    },

    list: function (qry, model) {
        return new Promise(function (resolve, reject) {
            model.find(qry, function (err, info) {
                if (err) {
                    reject(err);
                }
                resolve(info);
            });
        });
    },

    remove: function (qry, model) {},
};

module.exports = controller;
