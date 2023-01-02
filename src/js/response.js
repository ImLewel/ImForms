'use strict'

exports.status = (values, res) => {
  const data = {
    "code": 200,
    "values": values,

  }
  res.json(data);
  res.end();
}