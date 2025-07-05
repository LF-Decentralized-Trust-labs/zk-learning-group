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
        const circuit = await wasm_tester(path.join(__dirname, "sudokufull.circom"));
        const w = await circuit.calculateWitness(
            {
                "board":[[0,1,3,0,0,0,0,7,0],[0,2,0,0,0,0,5,0,0],[0,7,5,0,1,3,0,8,0],[0,0,4,0,5,0,0,0,0],[0,0,0,3,0,8,0,0,0],[0,0,0,0,6,0,7,0,0],[0,5,0,9,7,0,1,4,0],[0,0,2,0,0,0,0,0,3],[0,4,0,0,0,0,6,5,0]],
                "solved":[[8,1,3,6,9,5,2,7,4],[9,2,6,7,8,4,5,3,1],[4,7,5,2,1,3,9,8,6],[2,8,4,1,5,7,3,6,9],[6,9,7,3,2,8,4,1,5],[5,3,1,4,6,9,7,2,8],[3,5,8,9,7,6,1,4,2],[7,6,2,5,4,1,8,9,3],[1,4,9,8,3,2,6,5,7]]
            });
        await circuit.checkConstraints(w);
    });

    it("2.Duplication in row", async function () {
        const circuit = await wasm_tester(path.join(__dirname, "sudokufull.circom"));
        let errori = false;
        const w = await circuit.calculateWitness(
            {
                "board":[[0,1,3,0,0,0,0,7,0],[0,2,0,0,0,0,5,0,0],[0,7,5,0,1,3,0,8,0],[0,0,4,0,5,0,0,0,0],[0,0,0,3,0,8,0,0,0],[0,0,0,0,6,0,7,0,0],[0,5,0,9,7,0,1,4,0],[0,0,2,0,0,0,0,0,3],[0,4,0,0,0,0,6,5,0]],
                "solved":[[8,1,3,8,9,5,2,7,4],[9,2,6,7,8,4,5,3,1],[4,7,5,2,1,3,9,8,6],[2,8,4,1,5,7,3,6,9],[6,9,7,3,2,8,4,1,5],[5,3,1,4,6,9,7,2,8],[3,5,8,9,7,6,1,4,2],[7,6,2,5,4,1,8,9,3],[1,4,9,8,3,2,6,5,7]]
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
        const circuit = await wasm_tester(path.join(__dirname, "sudokufull.circom"));
        let errori = false;
        const w = await circuit.calculateWitness(
            {
                "board":[[0,1,3,0,0,0,0,7,0],[0,2,0,0,0,0,5,0,0],[0,7,5,0,1,3,0,8,0],[0,0,4,0,5,0,0,0,0],[0,0,0,3,0,8,0,0,0],[0,0,0,0,6,0,7,0,0],[0,5,0,9,7,0,1,4,0],[0,0,2,0,0,0,0,0,3],[0,4,0,0,0,0,6,5,0]],
                "solved":[[8,1,3,6,9,5,2,7,4],[9,2,3,7,8,4,5,3,1],[4,7,5,2,1,3,9,8,6],[2,8,4,1,5,7,3,6,9],[6,9,7,3,2,8,4,1,5],[5,3,1,4,6,9,7,2,8],[3,5,8,9,7,6,1,4,2],[7,6,2,5,4,1,8,9,3],[1,4,9,8,3,2,6,5,7]]
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
        const circuit = await wasm_tester(path.join(__dirname, "sudokufull.circom"));
        let errori = false;
        const w = await circuit.calculateWitness(
            {
                "board":[[0,1,3,0,0,0,0,7,0],[0,2,0,0,0,0,5,0,0],[0,7,5,0,1,3,0,8,0],[0,0,4,0,5,0,0,0,0],[0,0,0,3,0,8,0,0,0],[0,0,0,0,6,0,7,0,0],[0,5,0,9,7,0,1,4,0],[0,0,2,0,0,0,0,0,3],[0,4,0,0,0,0,6,5,0]],
                "solved":[[8,1,3,9,6,5,2,7,4],[9,2,6,7,8,4,5,3,1],[4,7,5,2,1,3,9,8,6],[2,8,4,1,5,7,3,6,9],[6,9,7,3,2,8,4,1,5],[5,3,1,4,6,9,7,2,8],[3,5,8,9,7,6,1,4,2],[7,6,2,5,4,1,8,9,3],[1,4,9,8,3,2,6,5,7]]
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

