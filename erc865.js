const ethAbi = require('ethereumjs-abi');
const ethUtil = require('ethereumjs-util');

// (1) Parameters
var token = "0x...";
var to = "0xA...";
var value = "100000000000000000000";
var fee = "1000000000000000000";
var nonce = 1234325;

//console.log("method: " + method);
console.log();
console.log("# (1) Parameters:");
console.log("token: " + token);
console.log("to: " + to);
console.log("value: " + value);
console.log("fee: " + fee);
console.log("nonce: " + nonce);


// (2) Hash
var hash = ethAbi.soliditySHA3(["address","address","uint","uint","uint"], [token, to, value, fee, nonce]);

console.log();
console.log("# (2) Hash: ");
console.log("hash: 0x" + hash.toString('hex'));

// (3) Sign
var privateKey = ethUtil.toBuffer('0x...');
var signer = "0x...";

var vrs = ethUtil.ecsign(hash, privateKey);
var sig = ethUtil.toRpcSig(vrs.v, vrs.r, vrs.s);

console.log();
console.log("# (3) Signature: ");
console.log("signer: " + signer);
console.log("(v,r,s): (" + vrs.v + ", " + vrs.r.toString('hex') + ", " + vrs.s.toString('hex') + ")");
console.log("sig: " + sig);
console.log();

