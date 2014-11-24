/**
 * Created by shenqi329 on 14/11/13.
 */
var express = require('express');
var router = express.Router();

var User = require('../models/User');
var ENResponseData = require('../models/ENResponseData');


router.get('/:username', function(req, res) {
    console.log(req.params.username);

    var json = new Object();
    json.username = req.params.username;
    json.password = "16";

    res.send(JSON.stringify(json));
});

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
                var data = new ENResponseData({'exist':1,'create':0,'id':user.id});
                res.send(JSON.stringify(data));
            }else{
                user.addOrUpdate(function(isSuccess){
                    var data = new ENResponseData({'exist':0,'create':1});
                    res.send(JSON.stringify(data));
                });
            }
        });
    });
});

router.post('/changepw',function(req,res){

    var user = new User(req.body.name,req.body.password);

    user.isNameExist(function(isNameExist,isPasswordTrue){
        if(isNameExist){
            user.addOrUpdate(function (isSuccess) {
                if(isSuccess){
                    var data = new ENResponseData({'exist':1,'change':1});
                    res.send(JSON.stringify(data));
                }
            });
        }else{
            var data = new ENResponseData({'exist':0,'change':0});
            res.send(JSON.stringify(data));
        }
    });
});


module.exports = router;