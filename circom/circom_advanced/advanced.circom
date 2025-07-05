pragma circom 2.0.0;

/*
Advanced circuit for demonstration
*/  

// include module from circom circomlib
include "node_modules/circomlib/circuits/comparators.circom";

template Square() {

    signal input in;
    signal greater;
    signal isNull;
    signal output out;
    
    // check if zero, if zero it is one
    // import component GreaterEqThan
    component ge = GreaterEqThan(252);
    ge.in[0] <== in;
    ge.in[1] <== 1;
    greater <== ge.out;
    // import component isNull
    component isnull = IsZero();
    isnull.in <== in;
    isNull <== isnull.out; 
    // tbd

    out <== in * in;
}

template SumOfSquares() {
    signal input a;
    signal input b;
    signal output out;

    // template initiation with the component keyword
    component sq1 = Square();
    component sq2 = Square();

    // wiring the components together
    sq1.in <== a;
    sq2.in <== b;

    out <== sq1.out + sq2.out;
}

template SumOfSquaresm(n) {
    signal input a[n];
    signal input expectedOut;
    signal output out;

    component sq[n];

    // template initiation with the component keyword
    var y = 0;
    var sum;
    for(var i = 0; i < n; i++){       
       // use square
       sq[i] = Square();
       sq[i].in <== a[i];
       sum += sq[i].out; 
       log("cycle: ", y, "Partial sum ", sum);
       y++;
    }
    out <== sum;
    expectedOut === out;
}

component main {public [a]} = SumOfSquaresm(2);

