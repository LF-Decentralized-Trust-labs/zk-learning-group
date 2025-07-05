
# NOTES FOR CIRCOM SUDOKU

### A 3x3 sudoku game example 

# install circom
https://docs.circom.io/getting-started/installation/ 

### compile the circuit and generate test proof
./run.sh

## NODEJS
### generate proof with nodejs
npm run prove  sudoku_js/sudoku.wasm sudoku_js/sudoku_final.zkey input.json

### verify proof with nodejs
npm run verify sudoku_js/verification_key.json publicSignals.json proof.json

## SOLIDITY
cd sudoku_js

### generate solidity smart contract
snarkjs zkey export solidityverifier sudoku_final.zkey verifier.sol

### generate test call for solidity smart contract
snarkjs generatecall
