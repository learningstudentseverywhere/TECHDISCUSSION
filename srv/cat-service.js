const cds = require('@sap/cds');
var SchoolServiceHandler = require('./Handler/SchoolServiceHandler');

module.exports = cds.service.impl(
    async function(){


    SchoolServiceHandler(this,cds);
   

});