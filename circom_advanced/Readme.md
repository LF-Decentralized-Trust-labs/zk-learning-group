
# NOTES FOR CIRCOM BASIC

# install circom
https://docs.circom.io/getting-started/installation/ 

### compile the circuit and generate test proof
./run.sh

## NODEJS
### generate proof with nodejs
npm run prove  demo1_js/demo1.wasm demo1_js/demo1_final.zkey input.json

### verify proof with nodejs
npm run verify demo1_js/verification_key.json publicSignals.json proof.json

## SOLIDITY
cd demo1_js

### generate solidity smart contract
snarkjs zkey export solidityverifier demo1_final.zkey verifier.sol

### generate test call for solidity smart contract
snarkjs generatecall
