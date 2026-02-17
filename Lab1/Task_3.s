.section .bss
.globl ram
.lcomm ram, 256  # Reserve 256 bytes of ram

.section .text
.globl fill_ram  # Make a function visible to c program

fill_ram:

    mov $ram, %rsi  # Load the base address of ram into rsi
    add $0x50, %rsi  # Move the pointer to the starting address (50h)
    mov $9, %ecx  # Set the loop counter to 9 (for addresses 50h to 58h)

fill_loop:
    movb $0x00, (%rsi)  # Store 00h at the memory location pointed to by rsi
    inc %rsi  # Move to the next memory location
    dec %ecx  # Decrement the loop counter
    jnz fill_loop  # Jump back to the start of the loop if counter is not zero

    ret     # Return control back to C program
.section .note.GNU-stack,"",@progbits