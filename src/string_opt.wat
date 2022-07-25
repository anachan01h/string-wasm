;; -----------------------------------------------------------------------------
;; ### string_opt.wat
;; Optimized versions of strcat, strcpy and strlen
;; By: anachan01h
;; -----------------------------------------------------------------------------

(import "js" "memory" (memory 1))

;; -----------------------------------------------------------------------------
;; char *strcat(char *dest, char *src)

;; -----------------------------------------------------------------------------
;; char *strcpy(char *dest, char *src)

;; -----------------------------------------------------------------------------
;; int strlen(char *str)
(func $strlen (export "strlen") (param $str i32) (result i32)
    (local $ptr i32)
    (local $dword i32)
    local.get $str
    local.set $ptr

    block $break
    loop $iter
        local.get $ptr
        i32.load
        local.tee $dword
        
        local.get $ptr
        i32.const 4
        i32.add
        local.set $ptr

        i32.const 0x01010101
        i32.sub
        i32.const 0xFFFFFFFF
        local.get $dword
        i32.xor
        i32.const 0x80808080
        i32.and
        i32.and
        i32.eqz
        br_if $iter

        local.get $ptr
        i32.const 4
        i32.sub
        local.tee $ptr
        i32.load8_u
        i32.eqz
        br_if $break

        local.get $ptr
        i32.const 1
        i32.add
        local.tee $ptr
        i32.load8_u
        i32.eqz
        br_if $break

        local.get $ptr
        i32.const 1
        i32.add
        local.tee $ptr
        i32.load8_u
        i32.eqz
        br_if $break

        local.get $ptr
        i32.const 1
        i32.add
        local.set $ptr
    end
    end

    local.get $ptr
    local.get $str
    i32.sub
)
