
# NOTES FOR CIRCOM BASIC

### A very simple demo rollup circom example

# Blogs on basic rollups:
https://hackernoon.com/how-to-implement-a-minimalist-nft-zkrollup-with-circom-and-snarkjs   
https://victoryeo-62924.medium.com/zero-knowledge-rollup-using-circom-for-beginner-276ff1a96d5b    
### demo use-case
only sparse merkle tree validation, no signature verification
- initally NFT 1 in address 100
- initally NFT 2 in address 200
- transaction: moving NFT 1 to address 200

# install circom
https://docs.circom.io/getting-started/installation/ 

### compile the circuit and generate test proof
./run.sh

## NODEJS
### generate proof with nodejs
npm run prove  rollup_js/rollup.wasm rollup_js/rollup_final.zkey input.json

### verify proof with nodejs
npm run verify rollup_js/verification_key.json publicSignals.json proof.json

## SOLIDITY
cd rollup_js

### generate solidity smart contract
snarkjs zkey export solidityverifier rollup_final.zkey verifier.sol

### generate test call for solidity smart contract
snarkjs generatecall
