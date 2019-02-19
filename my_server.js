'use strict'

let express = require('express');

let app = express();

app.get('/', function(req, res) {
    res.sendfile('C:\\Users\\Home\\Desktop\\BaseCamp\\Cinema\\Front-end\\basecamp_frontend_app\\index.html');
});

console.log("Server running!");

app.listen(8888);

const config = {
    user: 'postgres',
    database: 'cinema',
    password: 'vertolotik',
    port: 5432
};

const pg = require('pg');


const pool = new pg.Pool(config);

pool.connect((err) => {
    if(err)
        console.log('DB connection failed \n Error :' + JSON.stringify(err, undefined, 2));
    else
        console.log('DB connect successfully')
});
