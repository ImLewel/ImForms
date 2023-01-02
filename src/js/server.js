const expServer = require('express')();
const port = 3500;
const bParser = require('body-parser');

expServer.use(bParser.urlencoded({extended: true}));
expServer.use(bParser.json());

const routes = require('./Settings/routes.js')
routes(expServer);

expServer.listen(port, () => console.log(`Express server started on port ${port}`));