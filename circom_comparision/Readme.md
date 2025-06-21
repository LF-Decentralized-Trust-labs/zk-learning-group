
# NOTES FOR CIRCOM COMPARISION

# install circom
https://docs.circom.io/getting-started/installation/ 

### compile the circuit and generate test proof
./run.sh

## NODEJS
### generate proof with nodejs
npm run prove  comparision_js/comparision.wasm comparision_js/comparision_final.zkey input.json

### verify proof with nodejs
npm run verify comparision_js/verification_key.json publicSignals.json proof.json

## SOLIDITY
cd comparision_js

### generate solidity smart contract
snarkjs zkey export solidityverifier comparision_final.zkey verifier.sol

### generate test call for solidity smart contract
snarkjs generatecall
