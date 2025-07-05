pragma circom 2.0.0;

/*
Simple Sudoku circuit
*/  

// include module from circom circomlib
include "./node_modules/circomlib/circuits/comparators.circom";

template Sudoku(N) {
    signal input board[N][N];
    signal input solved[N][N];

    // check if each value is between 1 and 3
    component ge[N][N];
    component le[N][N];

    for(var column = 0; column < N; column++){
        for(var row = 0; row < N; row++){
            ge[column][row] = GreaterThan(16);
            ge[column][row].in[0] <== solved[column][row];
            ge[column][row].in[1] <== 1;
            le[column][row] = LessThan(16);
            le[column][row].in[0] <== solved[column][row];
            le[column][row].in[1] <== 4;
        }
    }

    // equal row components
    component equalR[N][N][N];

    // check if each row contains only one from 1,2,3 ...
    for(var column = 0; column < N; column++){
        // outer row
        for(var rowO = 0; rowO < N; rowO++){
            // inner row
            for(var rowI = 0; rowI < N; rowI++){
                equalR[column][rowO][rowI] = IsEqual();
                equalR[column][rowO][rowI].in[0] <== solved[column][rowO];
                equalR[column][rowO][rowI].in[1] <== (rowI == rowO) ? 0 : solved[column][rowI];
                equalR[column][rowO][rowI].out === 0;
            }
        }
    }

    // equal column components
    component equalC[N][N][N];

    // check if each row contains only one from 1,2,3 ...
    for(var row = 0; row < N; row++){
        // outer row
        for(var columnO = 0; columnO < N; columnO++){
            // inner row
            for(var columnI = 0; columnI < N; columnI++){
                equalC[row][columnO][columnI] = IsEqual();
                equalC[row][columnO][columnI].in[0] <== solved[columnO][row];
                equalC[row][columnO][columnI].in[1] <== (columnI == columnO) ? 0 : solved[columnI][row];
                equalC[row][columnO][columnI].out === 0;
            }
        }
    }

    // solution equals to problem wherewer it is defined
    // except zero, zero is the joker
    component equals[N][N];
    component zero[N][N];
    signal isEquals[N][N];
    signal isZero[N][N];
    signal notZeroNotEqual[N][N];
    component greaterZero[N][N];

    for(var column = 0; column < N; column++){
        for(var row = 0; row < N; row++){
            equals[column][row] = IsEqual();
            equals[column][row].in[0] <== board[column][row];
            equals[column][row].in[1] <== solved[column][row];
            isEquals[column][row] <== equals[column][row].out; 
            zero[column][row] = IsZero();
            zero[column][row].in <== board[column][row];
            isZero[column][row] <== zero[column][row].out;
            // isEquals, isZero, out
            // 1,         1    ,  1
            // 0,         1    ,  1
            // 1,         0    ,  1
            // 0          0    ,  0
            notZeroNotEqual[column][row] <== isEquals[column][row] + isZero[column][row];
            greaterZero[column][row] = GreaterThan(16);
            greaterZero[column][row].in[0] <== notZeroNotEqual[column][row];
            greaterZero[column][row].in[1] <== 0;
            greaterZero[column][row].out === 1;
        }
    }
}

component main {public [board,solved]} = Sudoku(3);


