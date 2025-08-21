// arrays with noir
pub fn main(input: u8) {
    // arrays, implicit type detection but same type (!)
    // array: fix size !
    // non mutable
    let a = [1, 2, 3, 4, 5];
    let first = a[0];
    let second = a[1];
    // mutuable array
    let mut arr = [1, 2, 3, 4, 5];
    assert(arr[0] == 1);
    arr[0] = 42;
    assert(arr[0] == 42);
    // initializing with repeating
    let myarray: [u8; 32] = [1; 32];
    assert (myarray[12] == 1);
}