const snarkjs = require("snarkjs");
const fs = require("fs");
const path = require('path');
const { exit } = require("process");

// e.g. npm run verify offline_compute_js/verification_key.json publicSignals.json proof.json

var myArgs = process.argv.slice(2);
var vkeypath = myArgs[0];
var inputfilepath = myArgs[1];
var proofpath = myArgs[2];

if(!vkeypath) {
  console.log("Please provide an vkeypath as input parameter!");
  console.log("Usage: npm run prove 'vkeypath' 'inputfilepath' 'proofpath'");
  process.exit(1);
}

if(!inputfilepath) {
    console.log("Please provide an inputfilepath as input parameter!");
    console.log("Usage: npm run prove 'vkeypath' 'inputfilepath' 'proofpath'");
    process.exit(1);
  }

if(!proofpath) {
  console.log("Please provide an proofpath as input parameter!");
  console.log("Usage: npm run prove 'vkeypath' 'inputfilepath' 'proofpath'");
  process.exit(1);
}


console.log("");
console.log("GENERAL INFO");
console.log("Verifying proof");
console.log("Verification key path : ", vkeypath);
console.log("Input file path : ", inputfilepath);
console.log("Proof path : ", proofpath);

async function main() {

    console.log("current path : ",process.cwd());
    
    // Paths to the .wasm file and proving key
    const vkeypathFull = path.join(process.cwd(), vkeypath);
    const vkey = JSON.parse(fs.readFileSync(vkeypathFull));
    const inputfilepathFull = path.join(process.cwd(), inputfilepath);
    const inputs = JSON.parse(fs.readFileSync(inputfilepathFull));
    const proofpathFull = path.join(process.cwd(), proofpath);
    const proof = JSON.parse(fs.readFileSync(proofpathFull));

    console.log("Verify ");
    console.log("key : ", vkey);
    console.log("inputs : ", inputs);
    console.log("proof : ", proof);
    // verification
    const res = await snarkjs.plonk.verify(vkey, inputs, proof);
    
    console.log("Verification result : ",res);
    exit(0);
}

main();


