const snarkjs = require("snarkjs");
const fs = require("fs");
const path = require('path');
const { exit } = require("process");

// e.g. npm run prove offline_compute_js/offline_compute.wasm offline_compute_js/offline_compute_final.zkey input.json

var myArgs = process.argv.slice(2);
var wasmpath = myArgs[0];
var provekey = myArgs[1];
var inputfile = myArgs[2];

if(!wasmpath) {
  console.log("Please provide an wasmpath as input parameter!");
  console.log("Usage: npm run prove 'wasmpath' 'provekey' 'inputfile'");
  process.exit(1);
}

if(!provekey) {
    console.log("Please provide an provekey as input parameter!");
    console.log("Usage: npm run prove 'wasmpath' 'provekey' 'inputfile'");
    process.exit(1);
  }

if(!inputfile) {
  console.log("Please provide an inputfile as input parameter!");
  console.log("Usage: npm run prove 'wasmpath' 'provekey' 'inputfile'");
  process.exit(1);
}


console.log("");
console.log("GENERAL INFO");
console.log("Creating prove");
console.log("Wasm path : ", wasmpath);
console.log("Provekey : ", provekey);
console.log("Input file : ", inputfile);

async function main() {

    console.log("current path : ",process.cwd());
    
    // Paths to the .wasm file and proving key
    const wasmPath = path.join(process.cwd(), wasmpath);
    //console.log("Wasm path full: ", wasmPath);
    const provingKeyPath = path.join(process.cwd(), provekey);
    //console.log("Provekey full : ", provingKeyPath);
    const inputFilePath = path.join(process.cwd(), inputfile);
    const inputs = JSON.parse(fs.readFileSync(inputFilePath));
    //console.log("Input file : ", inputs);
    
    // Generate a proof of the circuit and create a structure for the output signals
    const { proof, publicSignals } = await snarkjs.plonk.fullProve(inputs, wasmPath, provingKeyPath);
    
    let data = JSON.stringify(proof);
    fs.writeFileSync('proof.json', data);

    let dataPublicSignals = JSON.stringify(publicSignals);
    fs.writeFileSync('publicSignals.json', dataPublicSignals);

    console.log("proof : ",proof);
    console.log("Public Signals : ",publicSignals);
    console.log ("Proof generation finished");

//    const vkeypathFull = path.join(process.cwd(), 'offline_compute_js/verification_key.json');
//    const vkey = JSON.parse(fs.readFileSync(vkeypathFull));

    // verification
//    const res = await snarkjs.plonk.verify(vkey, publicSignals, proof);
//    console.log("Verification result : ",res);

    exit(0);
}

main();


