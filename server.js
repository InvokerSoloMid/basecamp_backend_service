var express = require('express');

var app = express();

app.get('/', function(req, res) {
    res.sendfile('C:\\Users\\Home\\Desktop\\BaseCamp\\Cinema\\Front-end\\basecamp_frontend_app\\index.html');
});

app.listen(8888);
