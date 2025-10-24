pragma circom 2.0.0;

template Sum(nInputs) {
    signal input in[nInputs];
    signal output out;

    signal partialSum[nInputs];
    partialSum[0] <== in[0];
    
    for (var i=1; i<nInputs; i++) {
        partialSum[i] <== partialSum[i-1] + in[i];
    }

    out <== partialSum[nInputs-1];
}
