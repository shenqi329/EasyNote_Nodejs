/**
 * Created by shenqi329 on 14/11/22.
 */

var express = require('express');
var router = express.Router();

var User = require('../models/User');
var ENResponseData = require('../models/ENResponseData');
formidable = require('formidable');


router.post('/', function (req,res) {

	var chunk = '';

	req.setEncoding('utf8');
	req.addListener('data',function(postDataChunk){
		chunk += postDataChunk;
	});
	req.addListener('end', function () {
		var form = JSON.parse(chunk);
		var user = new User(form.name,form.password);
		user.isNameExist(function(isNameExist,isPasswordTrue){
			if(isNameExist){
				if(isPasswordTrue){
					var data = new ENResponseData({'exist':1,'create':0,'id':user.id});
					res.send(JSON.stringify(data));
				}else{
					var data = new ENResponseData({'exist':0,'create':0,'id':user.id});
					res.send(JSON.stringify(data));
				}

			}else{
				var data = new ENResponseData({'exist':0,'create':0});
				res.send(JSON.stringify(data));
			}
		});
	});
});

module.exports = router;