// normal sudoku: 9x9
fn main(solution: [Field; 81], puzzle: pub [Field; 81]) -> pub bool {

    // checking if the solution matches the puzzle or null
    for i in 0..81 {
        assert(
            (puzzle[i] == 0) | (solution[i] == puzzle[i]), "Solution does not match the puzzle!"
        );
        // numbers are between 1 and 9 for the solution
        assert(solution[i] as u8 >= 1);
        assert(solution[i] as u8 <= 9);
    }

    // rows:
    let mut row_values: [Field; 9] = [0; 9];
    for row in 0..9 {
        row_values = [0; 9];
        for col in 0..9 {
            row_values[col] = solution[row * 9 + col];
        }
        assert(check_all_unique(row_values));
    }

    // columns:
    let mut col_values: [Field; 9] = [0; 9];
    for col in 0..9 {
        col_values = [0; 9];
        for row in 0..9 {
            col_values[row] = solution[row * 9 + col];
        }
        assert(check_all_unique(col_values));
    }

    // 3x3 subgrids
    let mut box_values: [Field; 9] = [0; 9];
    for box_row in [0, 3, 6] {
        for box_col in [0, 3, 6] {
            box_values = [0; 9];
            let mut index = 0;
            for i in 0..3 {
                for j in 0..3 {
                    box_values[index] = solution[(box_row + i) * 9 + (box_col + j)];
                    index += 1;
                }
            }
            assert(check_all_unique(box_values));
        }
    }

true
}

fn check_all_unique(numbers: [Field; 9]) -> bool {
    let mut all_unique: bool = true;
    for i in 0..9 {
        for j in (i + 1)..9 {
            if numbers[i] == numbers[j] {
                all_unique = false;
            }
        }
    }
    all_unique
}

