var express = require('express');
var app = express();
var path = require('path');

app.use(express.static(path.join(__dirname, "./static")));

app.listen(8000, function() {
 console.log("listening for players/teams on port 8000");
})