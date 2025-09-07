// simple sudoku: 3x3
fn main(solution: [u8; 9], puzzle: pub [u8; 9]) -> pub bool {

    // checking if the solution matches the puzzle
    for i in 0..9 {
        assert(
            (puzzle[i] == 0) | (solution[i] == puzzle[i]), "Solution does not match the puzzle!"
        );
    }
    // checking if there are no duplicates per row and per column
    // brute force
    let mut row1 = [solution[0],solution[1],solution[2]];
    assert(row1.sort() == [1, 2, 3], "Invalid column");

    let mut row2 = [solution[3],solution[4],solution[5]];
    assert(row2.sort() == [1, 2, 3], "Invalid column");

    let mut row3 = [solution[6],solution[7],solution[8]];
    assert(row3.sort() == [1, 2, 3], "Invalid column");

    let mut column1 = [solution[0],solution[3],solution[6]];
    assert(column1.sort() == [1, 2, 3], "Invalid column");

    let mut column2 = [solution[1],solution[4],solution[7]];
    assert(column2.sort() == [1, 2, 3], "Invalid column");

    let mut column3 = [solution[2],solution[5],solution[8]];
    assert(column3.sort() == [1, 2, 3], "Invalid column");

true
}