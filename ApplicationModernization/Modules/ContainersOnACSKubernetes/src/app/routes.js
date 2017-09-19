var Todo = require('./models/todo');

function getTodos(res) {
    Todo.find(function (err, todos) {

        // if there is an error retrieving, send the error. nothing after res.send(err) will execute
        if (err) {
            console.log("Error finding item: " + err);
            res.send(err);
        }

        res.json(todos); // return all todos in JSON format
    });
};

module.exports = function (app) {

    // api ---------------------------------------------------------------------
    // get all todos
    app.get('/api/todos', function (req, res) {
        // use mongoose to get all todos in the database
        getTodos(res);
    });

    // create todo and send back all todos after creation
    app.post('/api/todos', function (req, res) {

        console.log("Creating todo: " + req.body.text);

        // create a todo, information comes from AJAX request from Angular
        Todo.create({
            text: req.body.text,
            done: false
        }, function (err, todo) {
            if (err) {
                console.log("Error creating item: " + err);
                res.send(err);
            }

            // get and return all the todos after you create another
            getTodos(res);
        });

    });

    // delete a todo
    app.delete('/api/todos/:todo_id', function (req, res) {

        console.log("Deleting todo: " + req.params.todo_id);
        
        Todo.remove({
            _id: req.params.todo_id
        }, function (err, todo) {
            if (err) {
                console.log("Error deleting item: " + err);
                res.send(err);
            }
            getTodos(res);
        });
    });

    // application -------------------------------------------------------------
    app.get('*', function (req, res) {

        console.log("Loading single view file from: " + __dirname + '/public/index.html');
        
        res.sendFile(__dirname + '/public/index.html'); // load the single view file (angular will handle the page changes on the front-end)
    });
};
