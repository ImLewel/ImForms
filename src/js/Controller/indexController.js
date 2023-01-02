'use strict'

const response = require('./../response.js');

exports.index = (req, res) => {
  response.status('Hello world', res);
}