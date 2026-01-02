pragma circom 2.0.0;

/*
Minimal rollup circuit for demonstration
*/  

include "node_modules/circomlib/circuits/smt/smtprocessor.circom";
include "node_modules/circomlib/circuits/poseidon.circom";

// simple transaction verifier, with no signature verifcation
// nftID is transferred to target address without verifing the address
template TransactionVerifier(nLevels) {

    // todo: bind the old address with cryptographic key
    signal input oldAddress;

    signal input targetAddress;
    signal input nftID;

    signal input oldRoot;
    signal input siblings[nLevels];
    signal input newRootInput;

    signal output newRoot;

    component smtVerifier = SMTProcessor(nLevels);
    //component poseidon = Poseidon(2);

    // verify the transfer request
    // TODO

    // verify the SMT update

    smtVerifier.fnc[0] <== 0;
    smtVerifier.fnc[1] <== 1;

    smtVerifier.oldRoot <== oldRoot;
    smtVerifier.siblings <== siblings;
    smtVerifier.oldKey <== nftID;
    smtVerifier.oldValue <== oldAddress;
    smtVerifier.isOld0 <== 0; 
    smtVerifier.newKey <== nftID;
    smtVerifier.newValue <== targetAddress;

    newRoot <== smtVerifier.newRoot; 
    newRootInput === newRoot;
}

// one transaction rollup
component main {public [oldAddress,targetAddress,nftID,oldRoot,newRootInput]} = TransactionVerifier(3);

