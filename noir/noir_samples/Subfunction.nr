// subfunction with noir
pub fn main(input: u8) {
  let z = add_subf(input,input);
  assert(z == 2);
}

fn add_subf(x : u8, y : u8) -> u8 {
    x + y
}
