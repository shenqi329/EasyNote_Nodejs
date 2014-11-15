/**
 * Created by shenqi329 on 14/11/14.
 */

var Db = require('mongodb').Db;
var Connection = require('mongodb').Connection;
var Server = require('mongodb').Server;

var host = 'localhost';
var port = Connection.DEFAULT_PORT;


console.log("Connecting to " + host + ":" + port);
var easynotedb = new Db('easynote_db', new Server(host, port, {}), {native_parser:true});

easynotedb.open(function(err,db){
	if(err){
		throw err;
	}
	console.log('mongodb connected');
});

module.exports = easynotedb;
