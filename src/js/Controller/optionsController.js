'use strict'

const response = require('../response');
const db = require('../Settings/db');

exports.get = (req, res) => {
  db.query('SELECT * FROM `options`', (error, rows) => handler(error, rows, res));
}

exports.add = (req, res) => {
  const _query = `INSERT INTO \`options\` VALUES(${req.query.id}, ${JSON.stringify(req.query.text)}, ${req.query.iscorrect}, ${req.query.questions_id})`;
  db.query(_query, (error, data) => handler(error, data, res));
}

exports.getById = (req, res) => {
  db.query(`SELECT * FROM \`options\` WHERE id = ${req.query.id}`, 
   (error, rows) => handler(error, rows, res));
}

exports.getByQstnId = (req, res) => {
  db.query(`SELECT * FROM \`options\` WHERE questions_id = ${req.query.questions_id}`, 
    (error, rows) => handler(error, rows, res));
}

exports.updateById = (req, res) => {
  const query = `UPDATE \`options\` SET text = ${JSON.stringify(req.query.text)}, iscorrect = ${req.query.iscorrect} WHERE id = ${req.query.id}`;
  db.query(query, (error, data) => handler(error, data, res));
}

exports.deleteById = (req, res) => {
  const query = `DELETE FROM \`options\` WHERE id = ${req.query.id}`;
  db.query(query, (error, data) => handler(error, data, res));
}

exports.deleteByQstnId = (req, res) => {
  const query = `DELETE FROM \`options\` WHERE questions_id = ${req.query.questions_id}`;
  db.query(query, (error, data) => handler(error, data, res));
}

const handler = (error, data, res) => {
  if (error) response.status(error, res, 500);
  else if (data.affectedRows == 0 || data == '') response.status(data, res, 500);
  else response.status(data, res, 200);
}