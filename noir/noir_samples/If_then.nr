// if-then with noir
fn main(input: u8) {
  let a = 0;
  let mut x: u32 = 0;

  if a == input {
      if a != 0 {
          x = 6;
      } else {
          x = 2;
      }
  } else {
      x = 5;
      assert(x == 5);
  }
  assert(x == 2);
}