#Laboratory Exercise 4, Home Assignment 2
.text
li $s0, 0x20215144 #load test value for these function
#andi $t0, $s0, 0xff #Extract the LSB of $s0 k hiểu rõ lắm, nhưng có vẻ như là số s0 có 1 ở vị trí nào thì lấy ở vị trí đó
#andi $t1, $s0, 0x0400 #Extract bit 10 of $s0
andi $t0, $s0, 0xff000000 #ý 1
andi $t1, $s0, 0xffffff00 #ý 2
ori $t2, $s0, 0x000000ff #ý 3
and $t3, $s0, 0x00000000 #ý 4