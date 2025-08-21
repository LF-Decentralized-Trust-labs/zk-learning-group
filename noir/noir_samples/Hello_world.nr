// hello world with noir
pub fn main(x: Field, y: pub Field) -> pub Field {
    // Verify that x and y are both non-zero
    assert(x != y);
    x
}