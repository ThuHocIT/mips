##Nguyễn Anh Thứ - 20215144##
#tìm số có gttd lớn nhất trong này
#các ẩn cần: biến đếm i, step, số phần tử , biến lớn nhất 0, 
#b1 hàm đổi giá trị nếu nhỏ hơn 0, giữ nguyên nếu lớn hơn 0
#b2 hàm so sánh, nếu lớn hơn thì thay giá trị của max bằng nó ai<0 bằng 1
.data
A: .word 1, 2, 3, 4, 5, 9, 7, 8, 0
.text
li $s1, -1 #gán i = -1
la $s2, A #s2 chứa địa chỉ của mảng A
li $s3, 9 #số phần tử
li $s4, 1 #step
li $s5, 0 #max k cần
loop: 
	add $s1,$s1,$s4 #i=i+step
	beq $s1,$s3, end #if i = n , stop
	add $t1,$s1,$s1 #t1=2*s1
	add $t1,$t1,$t1 #t1=4*s1
	#sll $t1, $s1, 2 là bằng 2 lệnh add trên
	add $t1,$t1,$s2 #t1 store the address of A[i] tính địa chỉ của a[i]
	lw $t0,0($t1)
	j sosanhvoi0 #load value of A[i] in $t0  mở ngoặc (0) kia là độ lệch so với t1, ở đây là 0
sosanhvoi0:
	slt $t2, $t0, $zero #nếu t0 < 0, t2 = 1
	bgtz $t2, layabs	#nếu t0 < 0 là đúng, nhảy đếnn lấy abs
	beqz $t2, sosanh #nếu t0 >= 0, nhảy đến sosanh
layabs:
	negu $t2, $t2
	j sosanh
hoandoi:
	move $5 $t2
	j loop
sosanh:
	slt $t3, $t2, $s5 #nếu t2 < max thì là t3 là 1, t2 >= max thì là 0
	beq $t3, $zero, hoandoi
	bne $t3, $zero, loop #nếu t3 khác 0 thì nhảy về loop
	
end:
	
	
	
