const app = require("express")();
const http = require("http").createServer(app);
const socketio = require("socket.io")(http);
const mongoController = require('./mongo/mongo');

const port = 3000;
const EVENT_MESSAGE = "chat-message-event";

app.get("/", (req, res) => {
    res.send(`Server is running in port ${port}`);
});

socketio.on("connection", (userSocket) => {
    console.log("Client connected");

    userSocket.on(EVENT_MESSAGE, async (data) => {
        var messageObject = JSON.parse(data);
        var emit_url = `${EVENT_MESSAGE}-${messageObject.chat_id}`;

        var message = await saveMessageToDatabase(messageObject);
        message.id = message._id;
        var result = JSON.stringify(message);
        console.log('Message: ', result);
        userSocket.broadcast.emit(emit_url, result);
        userSocket.emit(emit_url, result);
    });
});

function saveMessageToDatabase(message) {
    return mongoController.addNew(message);
}

http.listen(port);
