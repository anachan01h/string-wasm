all: build/string.wasm build/string_opt.wasm

build/string.wasm: src/string.wat
	wat2wasm -o build/string.wasm src/string.wat

build/string_opt.wasm: src/string_opt.wat
	wat2wasm -o build/string_opt.wasm src/string_opt.wat

tests/tests.wasm: tests/tests.wat
	wat2wasm -o tests/tests.wasm tests/tests.wat

tests: tests/tests.wasm build/string.wasm build/string_opt.wasm
	node tests/tests.js
