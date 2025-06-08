
# NOTES FOR CIRCOM CALCULATING FIBONACCI

# install circom
https://docs.circom.io/getting-started/installation/ 

### compile the circuit and generate test proof
./run.sh

## NODEJS
### generate proof with nodejs
npm run prove fibonacci_js/fibonacci.wasm fibonacci_js/fibonacci_final.zkey input.json

### verify proof with nodejs
npm run verify fibonacci_js/verification_key.json publicSignals.json proof.json

## SOLIDITY
cd fibonacci_js

### generate solidity smart contract
snarkjs zkey export solidityverifier fibonacci_final.zkey verifier.sol

### generate test call for solidity smart contract
snarkjs generatecall
