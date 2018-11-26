; Data
section     .data
extern  printMSG
extern  printEndl
extern  printReg
extern  printRAX
extern  exitNormal
extern  getRand


; Code 
section     .text



;-----------------------------------------
; declare functions
global mulby4
global printXtimes  
global getRandNum
global getMax
global getMin
global getAve

;-----------------------------------------
; the first 6 parameters are in this order
;-----------------------------------------
;param  64bit   32bit   16bit   8bit
;1      rdi     edi     di      dil
;2      rsi     esi     si      sil
;3      rdx     edx     dx      dl
;4      rcx     ecx     cx      cl
;5      r8      r8d     r8w     r8b
;6      r9      r9d     r8w     r8b
;-----------------------------------------

;-----------------------------------------
; return valuesare in
;       rax     eax     ax      al
;-----------------------------------------


;-----------------------------------------
; the callee must preserve these registers 
;-----------------------------------------
;   rbx rbp r12 r13 r14 r15 
; 
;   The stack must be cleared

;-----------------------------------------------------------------------------------
; mulby4
; description:      multiplies the first parameter by 4
;
; precondition:     rdi has the value to be multiplied by 4
;
; postcondition:    rax has the value of rdi shifted left twice
;                   effectively multiplying by 4       
;
; return            rax has the value of rdi shifted left twice
;-----------------------------------------------------------------------------------
mulby4:
	mov rax, rdi
	shl rax, 2
	ret 
;-----------------------------------------------------------------------------------
; printXtimes 
; description:      prints the value in rdi 
;                   the value of rsi times
;
; precondition:     rdi has the value to be displayed
;                   rsi has the number of times to repeat
;
; postcondition:    the value in rdi has been displayed rsi times
;
; return            n/a
;-----------------------------------------------------------------------------------
printXtimes:
	mov rcx, rsi
	printLoop:
	call printReg
	loop printLoop

	ret
;-----------------------------------------------------------------------------------
; getRandNum 
; description:      returns a random number 
;                   between 0 and rdi
;
; precondition:     rdi has the max value to be generated
;
; postcondition:    rax holds a number between 0 and rdi
;           
;
; return            a number between 0 and rdi, in rax
;-----------------------------------------------------------------------------------
getRandNum:
	call getRand
	;divide by max value
	mov rdx, 0x0
	div rdi
	mov rax, rdx
	inc rax
	;ret the remainder
	ret
;-----------------------------------------------------------------------------------
; getMax 
; description:      returns a the largest number passed into the function 
;
; precondition:     rdi, rsi, rdx, rcx, r8 and r9 have numbers in them
;
; postcondition:    rax has the largest value passed in above
;           
;
; return            rax has the largest value passed in above
;-----------------------------------------------------------------------------------
getMax:
mov rax, rdi
cmp rax, rsi
ja next
mov rax, rsi
next:
cmp rax, rdx
ja next2
mov rax, rdx

next2:
cmp rax, rcx
ja next3
mov rax, rcx

next3:
cmp rax, r8
ja next4
mov rax, r8

next4:
cmp rax, r9
ja next5
mov rax, r9

next5:
nd:

ret

;-------------------------------------------------------------------------
;-
;getMin
;description:	return the smallest number
;
;precondition: rdi, rsi, rdx, r8, r9
;
;postcondition: rax hast the smallest value passed in above
;
;
;return		rax has the smallest value
;-------------------------------------------------------------------------

getMin:
mov rax, rdi
cmp rax, rsi
jl ext
mov rax, rsi
ext:

cmp rax, rdx
jl ext2
mov rax, rdx

ext2:
cmp rax, rcx
jl next3
mov rax, rcx

ext3:
cmp rax, r8
jl ext4
mov rax, r8

ext4:
cmp rax, r9
jl ext5
mov rax, r9

ext5:
end:

ret

;------------------------------------------------------------------------
;---
;getAve
;description: adds them up and divides by how many
;
;precondition:
;
;postcondition:
;
;
;return average
;------------------------------------------------------------------------

getAve:

mov rax, 0x0
;add
add rax, rdi
add rax, rsi
add rax, rdx
add rax, rcx
add rax, r8
add rax, r9

mov rdx, 0x0

mov rcx, 0x6

div rcx


ret
