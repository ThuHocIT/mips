#Laboratory 3, Home Assigment 2
.data
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
.text
li $s1, -1 #gán i = -1
la $s2, A #s2 chứa địa chỉ của mảng A
li $s3, 9 #số phần tử
li $s4, 1 #step
li $s5, 0 #sum
loop: 
	add $s1,$s1,$s4 #i=i+step
	add $t1,$s1,$s1 #t1=2*s1
	add $t1,$t1,$t1 #t1=4*s1
	#sll $t1, $s1, 2 là bằng 2 lệnh add trên
	add $t1,$t1,$s2 #t1 store the address of A[i] tính địa chỉ của a[i]
	lw $t0,0($t1) #load value of A[i] in $t0  mở ngoặc (0) kia là độ lệch so với t1, ở đây là 0
	add $s5,$s5,$t0 #sum=sum+A[i]
	bne $s1,$s3,loop #if i != n, goto loop
	
	#a) i < n
	#slt $t1, $s1, $s3
	#bne $t1, $zero, loop
	
	#b) i <= n
	#slt $t1, $s3, $s1
	#li $t2, 1
	#bne $t1, $t2, loop
	
	#c) sum >= 0
	#slt $t1, $s5, $zero
	#li $t2, 1
	#bne $t1, $t2, loop
	
	#d)A[i]==0
	#beq $s5, $zero, loop
	
	
	