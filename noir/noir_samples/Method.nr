// struct with noir
struct AppleStruct {
    size: u8,
}
// implementation : method
impl AppleStruct {
    fn new() -> AppleStruct {
        AppleStruct {
            size: 2,
        }
    }
    fn get_size(self) -> u8 {
        self.size + 1
    }
}

fn main(input: u8) {
    let s = AppleStruct::new();
    assert(s.get_size() == 3);
}