// loop with noir
// only in unconstrained function
unconstrained fn main(input: u8) {
    let mut i = 10;

    loop {
        i -= 1;
        if i == 0 {
            break;
        }
    }
}