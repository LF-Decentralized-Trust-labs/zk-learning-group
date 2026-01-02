//const snarkjs = require("snarkjs");
const fs = require("fs");
const path = require('path');
const { exit } = require("process");
const { newMemEmptyTrie } = require("circomlibjs");

const convertSiblings = (siblings, trie) => {
  let result = []
  for (let i = 0; i < siblings.length; i++) result.push(trie.F.toObject(siblings[i]));
  while (result.length < 10) result.push(0);
  return result
}

async function main() {

    // circomlibjs sparse merkle tree usage
    // 1. Initialize a new in-memory Sparse Merkle Tree
    //const tree = await newMemEmptyTrie();
    // 2. Insert a key-value pair
    // Keys and values are typically BigInts or field elements
    //const key = 1n;
    //const value = 100n;
    //await tree.insert(key, value);
    // 3. Update an existing key
    //await tree.update(key, 200n);
    // 4. Retrieve information
    //const root = tree.root;

    // siblings list
    console.log("current path : ",process.cwd());
    // create new sparse merkle tree
    const trie = await newMemEmptyTrie();

    // mock NFT at mock address
    // NFT 1 at address 100
    await trie.insert(1, 100);
    // NFT 2 at address 200
    await trie.insert(2, 200);
    // calculate old root
    const oldRoot = trie.F.toObject(trie.root);
    // send NFT 1 to the 200 address
    await trie.update(1, 200);
    // calculate new root
    const newRoot = trie.F.toObject(trie.root);
    // get siblings for the 
    // finding siblings for the updated key
    const res = await trie.find(1);
    console.log(res.siblings);
    let siblingsList = [];
    siblingsList.push(convertSiblings(res.siblings, trie));

    console.log("old root",oldRoot);
    console.log("new root",newRoot);
    for (const item of siblingsList) {
      console.log("sibling ", item);
    }

    exit(0);
}

main();


