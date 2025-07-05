
# NOTES FOR CIRCOM SUDOKU

### A 9x9 sudoku game example 

# install circom
https://docs.circom.io/getting-started/installation/ 

### compile the circuit and generate test proof
./run.sh

## NODEJS
### generate proof with nodejs
npm run prove  sudokufull_js/sudokufull.wasm sudokufull_js/sudokufull_final.zkey input.json

### verify proof with nodejs
npm run verify sudokufull_js/verification_key.json publicSignals.json proof.json

## SOLIDITY
cd sudokufull_js

### generate solidity smart contract
snarkjs zkey export solidityverifier sudokufull_final.zkey verifier.sol

### generate test call for solidity smart contract
snarkjs generatecall
