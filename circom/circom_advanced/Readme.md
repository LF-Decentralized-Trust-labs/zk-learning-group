
# NOTES FOR CIRCOM (MORE) ADVANCED PATTERN

### An example with for combining different templates and metaprogrammings

# install circom
https://docs.circom.io/getting-started/installation/ 

### compile the circuit and generate test proof
./run.sh

## NODEJS
### generate proof with nodejs
npm run prove  advanced_js/advanced.wasm advanced_js/advanced_final.zkey input.json

### verify proof with nodejs
npm run verify advanced_js/verification_key.json publicSignals.json proof.json

## SOLIDITY
cd advanced_js

### generate solidity smart contract
snarkjs zkey export solidityverifier advanced_final.zkey verifier.sol

### generate test call for solidity smart contract
snarkjs generatecall
