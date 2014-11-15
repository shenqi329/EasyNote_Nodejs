/**
 * Created by shenqi329 on 14/11/14.
 */


module.exports = ENResponseData;

function ENResponseData(type,description) {
	this.type = type;
	this.description = description;
}

function ENResponseData(description) {
	this.type = '000001';
	this.description = description;
}

ENResponseData.prototype.isSuccess = function(){
	return this.type == '000001';
}

ENResponseData.prototype.DEFAULT_TYPE = '000001';

