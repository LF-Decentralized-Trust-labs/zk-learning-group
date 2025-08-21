// Fibonacci calculation with private input
pub fn main(input: u32, output: pub u32) {
  let mut x1: u32 = 0;
  let mut x2: u32 = input;
  let mut res: u32 = 0;

  for i in 0 .. 3 {
    println(i);
    res = x1 + x2;
    x1 = x2;
    x2 = res;
  }
  assert(res == output);
}