// simple data types with noir
pub fn main(input: u8) {
    // integer size : 1, 8, 16, 32, 64 and 128
    // unisgned integer 8 bit
    let x: u8 = 2;
    // signed integer 8 bit
    let y: i8 = -1;

    assert(input == x + x);

    // boolean
    let f: bool = false;
    // strings
    let message = "hello world";
    
    println(message);
    assert(message == "hello world");    
}