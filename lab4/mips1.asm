.text
	#li $t0, -1
	#sra $t1, $t0, 31
	#xor $t0, $t0, $t1
	#sub $t0, $t0, $t1
	
#	addi $t0, $zero, 1
#	add $t1, $t0, $zero
	
#	addi $t0, $zero, 1
#	nor $t1, $t0, $zero
	li $s1 , 4
	li $s2, 4
	slt $t0, $s2, $s1 #s2 < s1 t0 = 1, s2 >= s1 t0 = 0
	beqz $t0, L
L: