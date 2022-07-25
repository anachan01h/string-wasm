;; -----------------------------------------------------------------------------
;; ### string.wat
;; A simple implementation of strcat, strcmp, strcpy and strlen from libc
;; By: anachan01h
;; -----------------------------------------------------------------------------

(import "js" "memory" (memory 1))

;; -----------------------------------------------------------------------------
;; char *strcat(char *dest, char *src)
(func $strcat (export "strcat") (param $dest i32) (param $src i32) (result i32)
    local.get $dest
    local.get $dest
    call $strlen
    i32.add
    local.get $src
    call $strcpy
    drop
    local.get $dest
)

;; -----------------------------------------------------------------------------
;; int strcmp(char *str1, char *str2)
(func $strcmp (export "strcmp") (param $str1 i32) (param $str2 i32) (result i32)
    (local $c1 i32)
    (local $c2 i32)

    loop $iter
    block $break
        local.get $str1
        i32.load8_u
        local.tee $c1
        local.get $str1
        i32.const 1
        i32.add
        local.set $str1

        local.get $str2
        i32.load8_u
        local.tee $c2
        local.get $str2
        i32.const 1
        i32.add
        local.set $str2

        local.get $c1
        i32.eqz
        br_if $break
        i32.eq
        br_if $iter
    end
    end

    local.get $c1
    local.get $c2
    i32.sub
)

;; -----------------------------------------------------------------------------
;; char *strcpy(char *dest, char *src)
(func $strcpy (export "strcpy") (param $dest i32) (param $src i32) (result i32)
    (local $ptr i32)
    local.get $dest

    loop $iter
    block $break
        local.get $dest
        local.get $src
        i32.load8_u
        i32.store8
        
        local.get $src
        i32.load8_u
        i32.eqz
        br_if $break

        local.get $dest
        i32.const 1
        i32.add
        local.set $dest

        local.get $src
        i32.const 1
        i32.add
        local.set $src
        br $iter
    end
    end
)

;; -----------------------------------------------------------------------------
;; int strlen(char *str)
(func $strlen (export "strlen") (param $str i32) (result i32)
    (local $ptr i32)
    local.get $str
    local.set $ptr

    loop $iter
    block $break
        local.get $ptr
        i32.load8_u
        i32.eqz
        br_if $break
        local.get $ptr
        i32.const 1
        i32.add
        local.set $ptr
        br $iter
    end
    end

    local.get $ptr
    local.get $str
    i32.sub
)
