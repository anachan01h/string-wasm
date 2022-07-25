# [string-wasm](https://github.com/anachan01h/string-wasm/)
A simple implementation of some string functions from libc in WebAssembly.

## Modules

### [string.wasm](https://github.com/anachan01h/string-wasm/blob/main/src/string.wat)
Contains a simple implementation of strcat, strcmp, strcpy and strlen functions 
from libc.

### [string_opt.wasm](https://github.com/anachan01h/string-wasm/blob/main/src/string_opt.wat)
For now, contains only an optimized version of strlen function, that reads four 
bytes per iteration.

## Building and Testing

### Prerequisites:
 - wat2wasm (from WebAssembly Binary Toolkit)
 - Node.js (only for running tests)

### Build .wasm files
To build string.wasm:
```console
$ wat2wasm -o build/string.wasm src/string.wat
```

To build string_opt.wasm:
```console
$ wat2wasm -o build/string_opt.wasm src/string_opt.wat
```

Or build the two using Makefile:
```console
$ make all
```

### Test the .wasm modules
First, build the tests.wasm module:
```console
$ wat2wasm -o tests/tests.wasm tests/tests.wat
```

Then, run the tests with Node.js:
```console
$ node tests/tests.js
```
**Note:** For now, only string.wasm is tested.

### Build .wasm files and run tests (using Makefile)
```console
$ make tests
```
