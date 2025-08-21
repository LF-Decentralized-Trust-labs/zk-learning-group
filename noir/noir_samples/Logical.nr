// logical operator with noir
pub fn main(input: u8) {
  let mut flag = 1;
  if (input > 6) | (input == 0) {
      flag = 0; 
  }
  assert(flag == 1);
}