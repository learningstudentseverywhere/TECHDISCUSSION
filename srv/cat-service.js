const cds = require('@sap/cds');
var SchoolServiceHandler = require('./Handler/SchoolServiceHandler');
var CollegeSeriveHandler = require('./Handler/CollegeServiceHandler');


module.exports = cds.service.impl(
    async function(){


    SchoolServiceHandler(this,cds);
    CollegeSeriveHandler(this,cds);

});