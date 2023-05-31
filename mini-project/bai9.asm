.data 
	hs1: .asciiz "\nBui Duy Thanh "
	hs2: .asciiz "\nHa Quynh Trang "
	hs3: .asciiz "\nNguyen Anh Thu "
	ten : .word hs1,hs2,hs3
	diem : .word  3,3,10
	soSV : .word 3
	Message0: .asciiz "\nLop co so sinh vien la :"
	Message: .asciiz "\nNhung hoc sinh khong vuot qua ki thi Toan la:"
.text
	la $t1 , ten	#gan t1 la dia chi cua mang ten
	la $t2 , diem	#gan t2 la dia chi cua mang diem
	la $t3 , soSV	#gan t3 la dia chi cua so sinh vien
	lw $t3 ,0($t3)	#gan t3 la so sinh vien	
	li $t0, 0	#$t0 la con tro i 
	li $t4,0	#t4 la con tro goi mang
	li $a2,4
	li $a0,0		#lam moi bien a0
 	li $v0,4		#ham goi in ra xau
 	la $a0, Message0 	#gan Message vao $a0
 	syscall
 	li $a0 ,0		#lam moi bien a0
 	la $t7,soSV		#gan t3 la dia chi cua so sinh vien
 	lw $a0 ,0($t7)	        #load gia tri so sinh vien 
	li $v0,1		#ham goi in ra so nguyen
	syscall		
loop:   beq $t0,$t3,exit	#neu nhu i vuot qua so luong sinh vien thi exit
	add $t4,$t0,$t0		#tang t4 len = t1+t1 
	add $t4,$t4,$t4		#tang t4 len 2 lan va t4= 4t1
	jal doc_ten_diem	#doc ten va diem cua sv jal xuong ham doc ten diem
	addi $t0,$t0,1		#tang bien dem i len mot don vi i= i+1
	j loop			#tiep tuc vong lap
 doc_ten_diem:
 	li $a1,0		#khoi tao bien doc gia tri a1=0
	add $a1,$t4,$t1		#cho a1 la dia chi cua phan tu thu i mang ten
	lw  $a0,0($a1)		#load gia tri cua phan tu thu i cua mang ten
	li $v0,4		#ham goi in ra xau
	syscall			#tien hanh ham
	li $a0 ,0		#lam moi bien a0
	add $a1,$t4,$t2		#gan a1 bang dia tri cua phan tu thu i mang diem
	lw $a0 , 0($a1)		#load gia tri cua phan tu thu i cua mang diem
	li $v0,1		#ham goi in ra so nguyen
	syscall			#tien hanh ham
	jr $ra			#jump lai ve vi tri goi lệnh jal				#thoat khoi vong lap ghi ten va diem tat ca sv va bat dau tim sv truot mon
exit:
	li $a0,0		#lam moi bien a0
 	li $v0,4		#gam goi in ra xau
 	la $a0, Message	 	#gan Message vao $a0
 	syscall
 	li $t0, 0		#set lai $t0 = 0 la con tro i 
	li $t4,0		# set lai t4 =0 la con tro goi mang
check:
	beq $t0,$t3,exitct	#neu nhu i vuot qua so luong sinh vien thi exit
	add $t4,$t0,$t0		#tang t4 len = t1+t1 
	add $t4,$t4,$t4		#tang t4 len 2 lan va t4= 4t1
	add $a1,$t4,$t2		#gan a1 bang dia chi cua phan tu thu i mang diem
	lw  $t8,0($a1)		#gan gia tri diem vao t8
	addi $t0,$t0,1		#tang bien dem i len mot don vi i= i+1
	slt $t5,$t8,$a2		#kiem tra xem diem co nho hon 4 khong
	bne $t5,$0, doc_ten_diem_1	#neu dung thi nhay xuong ham doc diem
	
	j check			#tiep tuc vong lap
doc_ten_diem_1:
	jal doc_ten_diem	#goi ham doc diem	
	j check			#tro ve voi vong lap xet hoc sinh tiep theo
	
exitct:	#ket thuc ct
