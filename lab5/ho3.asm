.data
string: .space 50
Message1: .asciiz "Nhap xau:”
Message2: .asciiz "Do dai la "
.text
main:
get_string:
    li $v0, 4 #a print "Nhap xau: "
    la $a0, Message1
    syscall

    li $v0, 8 # read string
    la $a0, string
    li $a1, 50 # maximum length
    syscall
    jal get_length # jump to get_length function

get_length:
    la $a0, string # a0 = Address(string[0])
    xor $v0, $zero, $zero # v0 = length = 0
    xor $t0, $zero, $zero # t0 = i = 0
check_char:
    add $t1, $a0, $t0 # t1 = a0 + t0 
    # = Address(string[0]+i) 
    lb $t2, 0($t1) # t2 = string[i]
    beq $t2,$zero,end_of_str # Is null char? 
    addi $v0, $v0, 1 # v0=v0+1->length=length+1
    addi $t0, $t0, 1 # t0=t0+1->i = i + 1
    j check_char
end_of_str: 
    li $v0, 4 # print "Do dai la "
    la $a0, Message2
    syscall
    move $a0, $v0 # move length to a0
    li $v0, 1 # print integer
    syscall
    jr $ra # return to main

