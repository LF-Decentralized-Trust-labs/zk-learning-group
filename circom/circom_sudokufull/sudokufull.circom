pragma circom 2.0.0;

/*
Complex Sudoku circuit
*/  

// include module from circom circomlib
include "./node_modules/circomlib/circuits/comparators.circom";

// checking if each element is contained only once in the input array
// input numbers must be bigger than 1
// input N: size of the matrix
template ContainsOnce(N) {
    signal input in[N]; 

    // equal components
    component equalR[N][N];

    // outer row
    for(var rowO = 0; rowO < N; rowO++){
        // inner row
        for(var rowI = 0; rowI < N; rowI++){
            equalR[rowO][rowI] = IsEqual();
            equalR[rowO][rowI].in[0] <== in[rowO];
            equalR[rowO][rowI].in[1] <== (rowI == rowO) ? 0 : in[rowI];
            equalR[rowO][rowI].out === 0;
        }
    }
}

template Sudoku(N) {
    signal input board[N][N];
    signal input solved[N][N];

    // check if each value is between 1 and N
    component ge[N][N];
    component le[N][N];

    for(var column = 0; column < N; column++){
        for(var row = 0; row < N; row++){
            ge[column][row] = GreaterThan(8);
            ge[column][row].in[0] <== solved[column][row];
            ge[column][row].in[1] <== 0;
            le[column][row] = LessThan(8);
            le[column][row].in[0] <== solved[column][row];
            le[column][row].in[1] <== N;
        }
    }

    // equal row subcircuit
    component containsRowOne[N];

    // check if each row contains only one from 1,2,3 ...
    for(var column = 0; column < N; column++){
        containsRowOne[column] = ContainsOnce(N);
        // wire row
        for(var row = 0; row < N; row++){
           // log("column: ", column, "row ", row, "value ", solved[column][row]);
            containsRowOne[column].in[row] <== solved[column][row];
        }
    }

    // equal column subcircuit
    component containsColumnOne[N];

    // check if each row contains only one from 1,2,3 ...
    for(var row = 0; row < N; row++){
        containsColumnOne[row] = ContainsOnce(N);
        // outer row
        for(var column = 0; column < N; column++){
            containsColumnOne[row].in[column] <== solved[column][row];
        }
    }

    // check if each submatric contain only one from each number 
    // equal submatrics subcircuit
    component containsSubmatrixOne[N];

    var iterrator = 0;
    // fixed for 3x3 submatrixes
    for(var column = 0; column < 3; column++){
        for(var row = 0; row < 3; row++){
            containsSubmatrixOne[iterrator] = ContainsOnce(N);
            var columnM = column * 3;
            var rowM = row * 3;
            //log("column: ", columnM, "row ", rowM, "iterrator ", iterrator);
            containsSubmatrixOne[iterrator].in[0] <== solved[columnM][rowM];
            //log(solved[columnM][rowM]);
            containsSubmatrixOne[iterrator].in[1] <== solved[columnM+1][rowM];
            //log(solved[columnM+1][rowM]);
            containsSubmatrixOne[iterrator].in[2] <== solved[columnM+2][rowM];
            //log(solved[columnM+2][rowM]);
            containsSubmatrixOne[iterrator].in[3] <== solved[columnM][rowM+1];
            //log(solved[columnM][rowM+1]);
            containsSubmatrixOne[iterrator].in[4] <== solved[columnM+1][rowM+1];
            //log(solved[columnM+1][rowM+1]);
            containsSubmatrixOne[iterrator].in[5] <== solved[columnM+2][rowM+1];
            //log(solved[columnM+2][rowM+1]);
            containsSubmatrixOne[iterrator].in[6] <== solved[columnM][rowM+2];
            //log(solved[columnM][rowM+2]);
            containsSubmatrixOne[iterrator].in[7] <== solved[columnM+1][rowM+2];
            //log(solved[columnM+1][rowM+2]);
            containsSubmatrixOne[iterrator].in[8] <== solved[columnM+2][rowM+2];
            //log(solved[columnM+2][rowM+2]);
            iterrator ++;
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
            log("board, column: ", column, "row ", row, "value ", board[column][row]);
            log("solved column: ", column, "row ", row, "value ", solved[column][row]);

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
            greaterZero[column][row] = GreaterThan(8);
            greaterZero[column][row].in[0] <== notZeroNotEqual[column][row];
            greaterZero[column][row].in[1] <== 0;
            greaterZero[column][row].out === 1;
        }
    }
}

component main {public [board,solved]} = Sudoku(9);


