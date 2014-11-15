/**
 * Created by shenqi329 on 14/11/14.
 */
/**
 * Created by shenqi329 on 14/11/14.
 */

var db = require('./easynotedb');


module.exports = User;

function User(name, password) {
	this.name = name;
	this.password = password;
}

User.prototype.isNameExist = function(callback){
	var  self = this;

	db.collection('user',function(err,collection){

		collection.find({'name':self.name}, function (err,cursor) {
			cursor.nextObject(function(err,doc){
				if(doc){
					self.id = doc._id;
					callback(true);
				}else{
					callback(false);
				}
			});
		})
	});
};

User.prototype.addOrUpdate = function(callback){
	var self = this;

	db.collection('user', function (err, collection) {
		collection.find({'name':this.name}, function (err,cursor) {
			cursor.nextObject(function(err,doc){
				if(doc){
					doc.password = self.password;
					callback(true);
				}else{
					collection.insert(self, function (docs) {
						collection.count(function(err, count) {
							console.log("There are " + count + " records.");
						});
					})
					callback(true);
				}
			});
		})
	});
};

User.prototype.open = function(){
	easynotedb.open(function(err, db) {
		db.dropDatabase(function(err, result) {
			db.collection('test1', function(err, collection) {
				// Erase all records from the collection, if any
				collection.remove({}, function(err, result) {
					// Insert 3 records
					for(var i = 0; i < 3; i++) {
						collection.insert({'a':i});
					}
					collection.count(function(err, count) {
						console.log("There are " + count + " records in the test collection. Here they are:");

						collection.find(function(err, cursor) {
							cursor.each(function(err, item) {
								if(item != null) {
									console.dir(item);
									console.log("created at " + new Date(item._id.generationTime) + "\n")
								}
								// Null signifies end of iterator
								if(item == null) {
									// Destory the collection
									collection.drop(function(err, collection) {

									});
								}
							});
						});
					});
				});
			});
		});
	});
}