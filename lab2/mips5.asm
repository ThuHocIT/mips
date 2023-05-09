.text
li $t1, 23
li $t2, 3
div $t1, $t2
mfhi $s1
mflo $s2
mul $s0, $t1, $t2
mul $s0, $s0, 3