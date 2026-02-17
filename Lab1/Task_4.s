.section .bss
.globl ram
.lcomm ram, 256  # Reserve 256 bytes of ram

.section .text
.globl fill_ram  # Make a function visible to c program

fill_ram:

    mov $1, %ecx # Set the loop counter to 1
    mov $0, %eax # Sum is 0

fill_loop:
    add %ecx, %eax # Add the current value of ecx to eax
    inc %ecx # Increment the loop counter
    cmp $11, %ecx # Compare the loop counter with 11
    jl fill_loop # Jump back to the start of the loop if counter is less than 11

    # Storing the result in ram[0x50]
    mov $ram, %rsi  # Load the base address of ram into rsi
    add $0x50, %rsi  # Move the pointer to the starting address (50h)
    movb %al, (%rsi)  # Store the sum in ram[0x50]

    ret     # Return control back to C program
.section .note.GNU-stack,"",@progbits