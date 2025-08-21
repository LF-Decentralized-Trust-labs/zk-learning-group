// structs in noir
struct Animal {
    hands: Field,
    legs: Field,
    eyes: u8,
}

fn main() {
    let legs = 4;

    let dog = Animal {
        eyes: 2,
        hands: 0,
        legs,
    };
    assert(dog.eyes == 2);
    assert(dog.hands == 0);
    assert(dog.legs == 4);
}
