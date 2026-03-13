.section .data
fmt:
    .string "Max = %d\n"
Numbers: 
    .long 1
    .long 15
    .long 4
    .long 2
    .long 7
    .long 9
    .long 23
    .long 7
    .long 3
    .long 11

Array_length:
    .long 10

max_value:
    .long 0

.section .text
.globl main
.extern printf
.type main, @function

main:
    pushl %ebp
    movl %esp, %ebp
    # setting i equal to 0
    movl $0, %ecx
    # setting the intial maximum as the
    # first element of the array
    movl Numbers, %eax
    # length = length of array
    movl Array_length, %ebx
    # while jump to check first
    jmp .Lcheck

.Lloop:
    # Numbers[i] is equivalent to current number
    movl Numbers(,%ecx,4), %edx
    # If current number is greater than max number, max = current
    cmpl %eax, %edx
    jle .Lskip
    movl %edx, %eax
.Lskip:
    # incrementing i, i++
    incl %ecx

.Lcheck:
    # while i is less than length of array
    cmpl %ebx, %ecx
    jl .Lloop
    # storing the max value in max_value
    movl %eax, max_value
    # printing the max value
    pushl max_value
    pushl $fmt
    call printf
    addl $8, %esp

    # exit
    movl $0, %eax
    leave
    ret