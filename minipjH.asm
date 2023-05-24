    .data
str:    .asciiz "cabca"
result: .space 26

    .text
    .globl main

main:
    # Load string address
    la $t0, str
    
    # Initialize result array to zeros
    li $t1, 0
    li $t2, 26
    li $t3, 0
    
    loop:
        # Load current character
        lb $t4, 0($t0)
        
        # Check if end of string
        beqz $t4, done
        
        # Convert character to index
        sub $t5, $t4, 'a'
        
        # Check if character has been counted before
        lw $t6, result($t5)
        beqz $t6, count
        
        # Character already counted, skip counting
        j next
        
        count:
            # Increment count for current character
            addi $t3, $t3, 1
            sw $t3, result($t5)
        
        next:
            # Move to next character
            addi $t0, $t0, 1
            j loop
    
    done:
        # Print the number of different characters
        move $a0, $t3
        li $v0, 1
        syscall
        
        # Exit program
        li $v0, 10
        syscall
