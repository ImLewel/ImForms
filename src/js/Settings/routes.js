'use strict'

module.exports = (expServer) => {
  const indexController = require('./../Controller/indexController.js');
  const optionsController = require('../Controller/optionsController');
  
  expServer.route('/').get(indexController.index);

  expServer.route('/options/get').get(optionsController.get);
  expServer.route('/options/post').post(optionsController.add);
  expServer.route('/options/getId').get(optionsController.getById);
  expServer.route('/options/getQId').get(optionsController.getByQstnId);
  expServer.route('/options/updId').put(optionsController.updateById);
  expServer.route('/options/delId').delete(optionsController.deleteById);
  expServer.route('/options/delQId').delete(optionsController.deleteByQstnId);
}