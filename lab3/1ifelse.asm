#Laboratory Exercise 3, Home Assignment 1
start:
	li $s1, 3
	li $s2, 5
	slt $t0,$s2,$s1 # j<i nếu s2<s1 thì t0=1
	bne $t0,$zero,else # branch to else if j<i nếu t0 bằng 1 thì nhảy đến else
	addi $t1,$t1,1 # then part: x=x+1
	addi $t3,$zero,1 # z=1
	j endif # skip “else” part
else:   addi $t2,$t2,-1 # begin else part: y=y-1
	add $t3,$t3,$t3 # z=2*z
endif: