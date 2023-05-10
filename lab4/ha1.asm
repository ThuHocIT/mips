#Laboratory Exercise 4, Home Assignment 1
.text
start:
li $s1, 0x7FFFFFFF
li $s2, 0x20215144
li $t0,0 #t0 = 0, k overflow, = 1 là có overflow
addu $s3,$s1,$s2 # s3 = s1 + s2 l
xor $t1,$s1,$s2 #xor xem s1 và s2 có cùng dấu không, nếu không cùng thì số đầu của t1 là 1
bltz $t1,EXIT #nếu ko cùng dấu, nhảy sang exit, bởi k cùng thì cộng sẽ ra số nhỏ hơn

#bài 4
#xor $t2, $s1, $3
#bltz $t2, OVERFLOW
#j EXIT
slt $t2,$s3,$s1 
bltz $s1,NEGATIVE  #nếu s1 nhỏ hơn 0, nó là số âm và nhảu sang negative
beq $t2,$zero,EXIT #s1 and $s2 are positive
	 # if $s3 > $s1 then the result is not overflow
j OVERFLOW
NEGATIVE:
bne $t2,$zero,EXIT #s1 and $s2 are negative
 # if $s3 < $s1 then the result is not overflow bởi nhỏ hơn là do 2 số âm coojgn với nhau, nếu overflow thì nó sẽ mất số và ra một số lớn hơn
OVERFLOW:
li $t0,1 #the result is overflow
EXIT:
#so sánh dấu à bài 4