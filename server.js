// берём Express
var express = require('express');

// создаём Express-приложение
var app = express();

// создаём маршрут для главной страницы
// http://localhost:8080/
app.get('/', function(req, res) {
    res.sendfile('C:\\Users\\Home\\Desktop\\BaseCamp\\Cinema\\Front-end\\basecamp_frontend_app\\index.html');
});

// запускаем сервер на порту 8080
app.listen(8888);
// отправляем сообщение
console.log('Сервер стартовал!');