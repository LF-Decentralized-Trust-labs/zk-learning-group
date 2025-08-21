// slice: dynamic sized arrays
fn main() -> pub u32 {
    let mut slice: [Field] = &[0; 2];

    // adding a new element to the end of the "array"
    let mut new_slice = slice.push_back(6);
    assert(new_slice.len() == 3);
    assert(new_slice[2] == 6); 
    new_slice.len()
}
