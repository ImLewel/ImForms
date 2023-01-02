const mysql = require('mysql2');

const connection = mysql.createConnection({
	host : 'localhost',
	database : 'mydb',
	user : 'root',
	password : '1111'
});

connection.connect((error) => {
  if (error) console.log('DB connection error\n' + error);
  else console.log('DB connection successful');
});

module.exports = connection;