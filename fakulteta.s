.data
.org 0x400
NUM: .word 5
SKP: .word 0

.code
.org 0x0

;setting stack pointer
addi r30, r0, #0x4F0

;push r3
sw 0(r30),r3
subui r30,r30,#4

;loading variable
lw r3,NUM(r0)

call r31,FAK(r0)

;pop r3
addui r30,r30,#4
lw r3,0(r30)

halt

FAK:
bne r3,NEXT
addui r28,r0,#1
j 0(r31)

NEXT:
;push r31
sw 0(r30),r31
subui r30,r30,#4

;push r3
sw 0(r30),r3
subui r30,r30,#4

subui r3,r3,#1

call r31,FAK(r0)

; pop r3
addui r30,r30,#4
lw r3,0(r30)

;pop r31
addui r30,r30,#4
lw r31,0(r30)

;push r2,counter
;subui r30,r30,#4
;sw 0(r30),r2

;addu r2,r0,r3

;push r1, current sum
subui r30,r30,#4
sw 0(r30),r1

addu r1,r0,r28

LOOP:
addu r28,r28,r1
subui r3,r3,#1
bne r3,LOOP

sub r28,r28,r1

;pop r1
addui r30,r30,#4
lw r1,0(r30)

j 0(r31)
