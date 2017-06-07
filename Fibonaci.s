			.data
			.org 0x400
N:	 		.byte 10

			.code
			.org 0x0
			addui r30, r0, 0x4FC
			addu r28, r0, r0
			lb r24, N(r0)
			call r31, FIB(r0)
			halt



FIB:
			; Vstopna tocka
			; push r31
			sw 0(r30), r31
			subui r30, r30, #4
			; push r29
			sw 0(r30), r29
			subui r30, r30, #4
			addu r29, r0, r30
			; push r24
			sw 0(r30), r24
			subui r30, r30, #4
			; push r2
			sw 0(r30), r2
			subui r30, r30, #4
			; push r3
			sw 0(r30), r3
			subui r30, r30, #4
			; Preveri ce smo pod 0
			slti r2, r24, #0
			bne r2, IZTOPNA
			; Preveri ce je 1 ali 0
			slti r2, r24, #2
			bne r2, KONEC
			subui r24, r24, #1
			; FIB(n - 1)
			call r31, FIB(r0)
			addu r3, r0, r28
			subui r24, r24, #1
			; FIB(n - 2)
			call r31, FIB(r0)
			addu r28, r28, r3


IZTOPNA:	; pop r3
			addui r30, r30, #4
			lw r3, 0(r30)
			; pop r2
			addui r30, r30, #4
			lw r2, 0(r30)
			; pop r24
			addui r30, r30, #4
			lw r24, 0(r30)
			; pop r29
			addui r30, r30, #4
			lw r29, 0(r30)
			; pop r31
			addui r30, r30, #4
			lw r31, 0(r30)

			j 0(r31)


KONEC:	addi r28, r0, #1
		j IZTOPNA(r0)


; Template push
;PUSH:
;			sw 0(r30), rx
;			subui r30, r30, #4

; Template pop
;POP:
;			addui r30, r30, #4
;			lw rx, 0(r30)