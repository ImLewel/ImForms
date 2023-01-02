'use strict'

const response = require('../response');
const db = require('../Settings/db');

exports.get = (req, res) => {
  db.query('SELECT * FROM `options`', (error, rows) => {
    if (error) console.log(error);
    else response.status(rows, res);
  });
}

exports.add = (req, res) => {
  const _query = `INSERT INTO \`options\` VALUES(${req.query.id}, ${req.query.text}, ${req.query.iscorrect}, ${req.query.questions_id})`;
  db.query(_query, (error, data) => {
    if (error) console.log(error);
    else response.status(data, res);
  });
}

exports.getById = (req, res) => {
  db.query(`SELECT * FROM \`options\` WHERE id = ${req.query.id}`, (error, rows) => {
    if (error) console.log(error);
    else response.status(rows, res);
  });
}

exports.updateById = (req, res) => {
  const query = `UPDATE \`options\` SET text = ${JSON.stringify(req.query.text)}, iscorrect = ${req.query.iscorrect} WHERE id = ${req.query.id}`;
  db.query(query, (error, data) => {
    if (error) console.log(error);
    else response.status(data, res);
  });
}

exports.deleteById = (req, res) => {
  const query = `DELETE FROM \`options\` WHERE id = ${req.query.id}`;
  db.query(query, (error, data) => {
    if (error) console.log(error);
    else response.status(data, res);
  });
}

exports.deleteByQstnId = (req, res) => {
  const query = `DELETE FROM \`options\` WHERE questions_id = ${req.query.questions_id}`;
  db.query(query, (error, data) => {
    if (error) console.log(error);
    else response.status(data, res);
  });
}