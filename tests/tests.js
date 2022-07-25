/* -----------------------------------------------------------------------------
### tests.js
By: anachan01h
----------------------------------------------------------------------------- */

const fs = require("fs");

async function main() {
    // WebAssembly Import Object
    const imports = {
        js: {
            memory: new WebAssembly.Memory({initial: 1}),
            log: (ptr, len) => console.log(getString(ptr, len)),
        },
    };

    // Instantiating Modules
    let wasmBuffer = fs.readFileSync("./build/string.wasm");
    let obj = await WebAssembly.instantiate(wasmBuffer, imports);
    imports["string"] = obj.instance.exports;

    wasmBuffer = fs.readFileSync("./build/string_opt.wasm");
    obj = await WebAssembly.instantiate(wasmBuffer, imports);
    imports["string_opt"] = obj.instance.exports;

    wasmBuffer = fs.readFileSync("./tests/tests.wasm");
    obj = await WebAssembly.instantiate(wasmBuffer, imports);
    let tests = obj.instance.exports;

    // Running Tests
    console.log("Running tests...");
    testResult(1, tests.test1());
    testResult(2, tests.test2());
    testResult(3, tests.test3());
    testResult(4, tests.test4());
}

function testResult(n, value) {
    if(value) {
        console.log("✅️ Test " + n + " passed");
    } else {
        console.log("❌️ Test " + n + " failed");
    }
}

main();
