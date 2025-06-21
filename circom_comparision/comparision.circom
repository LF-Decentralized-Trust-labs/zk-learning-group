pragma circom 2.0.0;

/*
Advanced circuit for demonstration
*/  

// include module from circom circomlib
include "node_modules/circomlib/circuits/comparators.circom";

template Calc_Add() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b;
}

template Calc_Add_10() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b + 10;
}

template Calc_Mul() {
    signal input a;
    signal input b;
    signal output out;

    out <== a * b;
}

template Calc_Mul_10() {
    signal input a;
    signal input b;
    signal output out;

    out <== a * b + 10;
}

template condition() {
    // input signals for calculation
    signal input a;
    signal input b;
    // control signals
    signal input zero;
    // internal condition signal
    signal isZero;
    signal isNonZero;
    // internal output 0
    signal out_0;
    // internal output 1
    signal out_1;
    // internal calc
    signal calc;
    // major end output
    signal output out;
    // expected output
    signal input expectedOut;

    // if zero == 0, execute Calc_Add
    // else execute Calc_Add_10

    component zeroc = IsZero();
    zeroc.in <== zero;
    isZero <== zeroc.out;

    isNonZero <== 1 - isZero;

    // calculate 0 condition
    component calcaddc = Calc_Add();
    calcaddc.a <== a;
    calcaddc.b <== b;
    out_0 <== calcaddc.out;

    // calculate 1 condition
    component calcaddc10 = Calc_Add_10();
    calcaddc10.a <== a;
    calcaddc10.b <== b;
    out_1 <== calcaddc10.out;

    calc <== out_0 * isZero; 
    out <== calc + out_1 * isNonZero;
    log ("OUT : ", out);
    expectedOut === out;
}

component main {public [a,b,zero,expectedOut]} = condition();

