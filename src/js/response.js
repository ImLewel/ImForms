'use strict'

exports.status = (values, res, _code) => {
  const data = {
    "code": _code,
    "values": values,

  }
  res.json(data);
  res.end();
}