;; -----------------------------------------------------------------------------
;; ### tests.wat
;; Tests for string.wasm module
;; By: anachan01h
;; -----------------------------------------------------------------------------

;; Importing functions from string.wasm ----------------------------------------
(import "string" "strcat" (func $strcat (param i32 i32) (result i32)))
(import "string" "strcmp" (func $strcmp (param i32 i32) (result i32)))
(import "string" "strcpy" (func $strcpy (param i32 i32) (result i32)))
(import "string" "strlen" (func $strlen (param i32) (result i32)))

;; Data Section ----------------------------------------------------------------
(import "js" "memory" (memory 1))
(data (i32.const 0x00) "Hello \00")
(data (i32.const 0x80) "Hello World\00")

;; Code Section ----------------------------------------------------------------
;; Test 1: strlen
(func $test1 (export "test1") (result i32)
    i32.const 0x00
    call $strlen
    i32.const 6
    i32.eq
    
    i32.const 0x80
    call $strlen
    i32.const 11
    i32.eq
    
    i32.and
)

;; Test 2: strcmp
(func $test2 (export "test2") (result i32)
    i32.const 0x00
    i32.const 0x00
    call $strcmp
    i32.const 0
    i32.eq

    i32.const 0x80
    i32.const 0x00
    call $strcmp
    i32.const 87
    i32.eq

    i32.and
)

;; Test 3: strcpy
(func $test3 (export "test3") (result i32)
    i32.const 0x100
    i32.const 0x00
    call $strcpy
    i32.const 0x00
    call $strcmp
    i32.const 0
    i32.eq
)

;; Test 4: strcat
(func $test4 (export "test4") (result i32)
    i32.const 0x00
    i32.const 0x86
    call $strcat
    i32.const 0x80
    call $strcmp
    i32.const 0
    i32.eq
)
