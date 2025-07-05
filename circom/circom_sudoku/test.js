const chai = require("chai");
const path = require("path");
const wasm_tester = require("circom_tester").wasm;
const c_tester = require("circom_tester").c;

const F1Field = require("ffjavascript").F1Field;
const Scalar = require("ffjavascript").Scalar;
exports.p = Scalar.fromString("21888242871839275222246405745257275088548364400416034343698204186575808495617");
const Fr = new F1Field(exports.p);

const assert = chai.assert;

describe("Checking conditions", function () {
    this.timeout(100000);

    it("1.Solution 1", async function () {
        const circuit = await wasm_tester(path.join(__dirname, "sudoku.circom"));
        const w = await circuit.calculateWitness(
            {
                "board":[[1,2,3],[0,0,0],[0,0,0]],
                "solved":[[1,2,3],[2,3,1],[3,1,2]]
            });
        await circuit.checkConstraints(w);
    });

    it("2.Duplication in row", async function () {
        const circuit = await wasm_tester(path.join(__dirname, "sudoku.circom"));
        let errori = false;
        const w = await circuit.calculateWitness(
            {
                "board":[[1,2,3],[0,0,0],[0,0,0]],
                "solved":[[1,2,3],[3,3,1],[3,1,2]]
            }).then(function(result) {
                assert(false, "Must give error message");                     
            }).catch(function(error) {
                errorMessage = error.toString();
                assert.include(errorMessage, 'Assert Failed', 'string contains substring');
                assert(true, "must be true");   
                errori = true;
            });
            if(errori == false){
                await circuit.checkConstraints(w);
            }
    });

    it("3.Duplication in column", async function () {
        const circuit = await wasm_tester(path.join(__dirname, "sudoku.circom"));
        let errori = false;
        const w = await circuit.calculateWitness(
            {
                "board":[[1,2,3],[0,0,0],[0,0,0]],
                "solved":[[1,2,3],[2,3,1],[2,1,3]]
            }).then(function(result) {
                assert(false, "Must give error message");                     
            }).catch(function(error) {
                errorMessage = error.toString();
                assert.include(errorMessage, 'Assert Failed', 'string contains substring');
                assert(true, "must be true");   
                errori = true;
            });
            if(errori == false){
                await circuit.checkConstraints(w);
            }
    });

    it("4.Board and solved pattern does not match", async function () {
        const circuit = await wasm_tester(path.join(__dirname, "sudoku.circom"));
        let errori = false;
        const w = await circuit.calculateWitness(
            {
                "board":[[1,2,3],[0,0,0],[0,0,0]],
                "solved":[[1,2,2],[2,3,1],[3,1,2]]
            }).then(function(result) {
                assert(false, "Must give error message");                     
            }).catch(function(error) {
                errorMessage = error.toString();
                assert.include(errorMessage, 'Assert Failed', 'string contains substring');
                assert(true, "must be true");   
                errori = true;
            });
            if(errori == false){
                await circuit.checkConstraints(w);
            }
    });

});

