.data
string:		.space 50
rstring:	.space 50
Message1:	.asciiz "Nhap xau "
Message2:	.asciiz "Chuoi in nguoc: "
.text
main:
get_string:
	li	$v0,4
	la	$a0,Message1
	syscall
	li	$v0,8
	la	$a0,string
	li	$a1,20
	syscall
get_length:
	la	$a0,string
	xor	$s0,$zero,$zero
	xor	$t0,$zero,$zero
check_char:
	add	$t1,$a0,$t0
	lb	$t2,0($t1)
	beq	$t2,$zero,end_of_str
	addi	$s0,$s0,1
	addi	$t0,$t0,1
	j	check_char
end_of_str:
end_of_get_length:
print_reverse:
	la	$a1,rstring
	add 	$s0,$s0,-1
	add	$s1,$zero,$zero
L1:
	add 	$t3,$s0,$a0
	lb 	$t4,0($t3)
	add 	$t5,$s1,$a1
	sb	$t4,0($t5)
	beq	$t4,$zero,end_of_printreverse
	nop	
	addi	$s0,$s0,-1
	addi	$s1,$s1,1
	j	L1
	nop
end_of_printreverse:
	li	$v0,59
	la	$a0,Message2
	syscall