// for loop with noir
fn main(input: u8) {
  let mut x: u8 = 0;
  x = x + input;  

  for i in 0 .. 10 {
    println(i);
    x = x +1;
  }
  assert(x == input + 10);
}