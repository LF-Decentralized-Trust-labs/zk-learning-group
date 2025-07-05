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

    it("1.Equals one", async function () {
        const circuit = await wasm_tester(path.join(__dirname, "comparision.circom"));
        const w = await circuit.calculateWitness(
            {
                a: 2, 
                b: 2, 
                zero: 1, 
                expectedOut : 14 
            });
        await circuit.checkConstraints(w);
    });

    it("2.Bigger than one", async function () {
        const circuit = await wasm_tester(path.join(__dirname, "comparision.circom"));
        const w = await circuit.calculateWitness(
            {
                a: 2, 
                b: 2, 
                zero: 11, 
                expectedOut : 14 
            });
        await circuit.checkConstraints(w);
    });

    it("3.Zero", async function () {
        const circuit = await wasm_tester(path.join(__dirname, "comparision.circom"));
        const w = await circuit.calculateWitness(
            {
                a: 2, 
                b: 2, 
                zero: 0, 
                expectedOut : 4 
            });
        await circuit.checkConstraints(w);
    });

});

