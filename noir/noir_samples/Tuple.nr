// tuples with noir
fn main(input: u8) {
    let tup : (u8,u8,u8,u8,u8) = (5, 6, 7, 8, input);

    let five = tup.0;
    let eight = tup.3;
    assert(tup.0 == 5);
    assert(tup.3 == 8);
    assert(input == 25);
}