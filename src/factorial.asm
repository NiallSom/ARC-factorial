.begin
    x:5
    .org 2048

.macro mult_macro a, b, counter, out, sum 
    or %r0,0, out
    or %r0,0, counter
    
    loop:
        cmp counter, b
        bge done
        add out, a, out
        inc counter
        ba loop
    done:
        cmp out, %r0
        be end
        mov out,sum
    end:
        .endmacro

_start:
    ld[x], %r1
    sub %r1, 1, %r2
    mult_macro %r1, %r2, %r3, %r4, %r5

factorial:
    cmp %r2, %r0
    ble done
    sub %r2, 1, %r2
    mult_macro %r5, %r2, %r3, %r4, %r5
    ba factorial

done:
    halt
.end
