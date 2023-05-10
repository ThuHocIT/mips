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
xor $t2, $s1, $s3
bltz $t2, OVERFLOW
j EXIT
OVERFLOW:
li $t0,1 #the result is overflow
EXIT: