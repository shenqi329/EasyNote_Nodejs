/**
 * Created by shenqi329 on 14/11/14.
 */


module.exports = ENResponseData;

function ENResponseData(code,data) {
	this.code = code;
	this.data = data;
}

function ENResponseData(data) {
	this.code = '000001';
	this.data = data;
}

ENResponseData.prototype.isSuccess = function(){
	return this.code == '000001';
}

ENResponseData.prototype.DEFAULT_TYPE = '000001';

