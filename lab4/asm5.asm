.text
start:
	addi $s0, $zero, 0
	addi $s2, $zero, 4
	addi $s3, $zero, 0x00000001
loop:
	sll $s3, $s3, 1
	add $s0, $s0, 1
	slt $t0, $s0, $s2
	beq $t0, 1, loop
	j EXIT
EXIT: