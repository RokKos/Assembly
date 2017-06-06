.data
.org 0x400
A: .word 1
B: .word 2
C: .word 10
SUM: .word 0

.code
.org 0x0

;testing
addi r6,r0,#-1

;setting stack pointer
lhi r26, #0x40002FF0
addui r26,r26,#0x40002FF0
addu r30,r0,r26

;variables
lw r24,A(r0)
lw r25,B(r0)

;3. variable
lw r3,C(r0)
;PUSH r3
sw 0(r30),r3
subui r30,r30,#4

call r31,SESTEJ(r0)

;deleting r3
addui r30,r30,#4
halt

SESTEJ:
;PUSH r31
sw 0(r30),r31
subui r30,r30,#4

;PUSH r29
sw 0(r30),r29
subui r30,r30,#4

addu r29,r30,r0

subui r30,r30,#4 ; making room for SUM

;PUSH r6
sw 0(r30),r6
subui r30,r30,#4

lw r6,12(r29)
add r6,r24,r6
add r6,r24,r6

sw 0(r29),r6
lw r28,0(r29)

;POP r6
addui r30,r30,#4
lw r6,0(r30)

add r30,r0,r29

;POP r29
addui r30,r30,#4
lw r29,0(r30)

;POP r31
addui r30,r30,#4
lw r31,0(r30)

j 0(r31)
