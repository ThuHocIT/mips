#Laboratory Exercise 2, Assignment 6
.data # DECLARE VARIABLES
X : .word 5 # Variable X, word type, init value = 10010004
Y : .word -1 # Variable Y, word type, init value =  10010008 *nếu không có giá trị z, z không được cho địa chỉ
Z : .word 4# Variable Z, word type, no init value = 1001000c, cứ tăng dần theo chiều ngang ở bảng bên dưới
str : .asciiz "ABCD1234abcd"
.text # DECLARE INSTRUCTIONS 
 # Load X, Y to registers_--_ dùng load adress để lấy địa chỉ vào t8, t9, sau đó đọc địa chỉ bàng load read để lưu giá trị x, y vào t1, t2
 la $t8, X # Get the address of X in Data Segment
 la $t9, Y # Get the address of Y in Data Segment
 lb $t6, 12($t8)# là dịch sang thêm 12 bit địa chỉ
 lw $t1, 0($t8) # $t1 = X
 lw $t2, 0($t9) # $t2 = Y
 # Calcuate the expression Z = 2X + Y with registers only
 add $s0, $t1, $t1 # $s0 = $t1 + $t1 = X + X = 2X
 add $s0, $s0, $t2 # $s0 = $s0 + $t2 = 2X + Y
 # Store result from register to variable Z
 la $t7, Z # Get the address of Z in Data Segment 
 sw $s0, 0($t7) # Z = $s0 = 2X + Y 
 
 #----BIẾN-----
 #biến có bản chất giống thanh ghi, nhưng nằm ở trong bộ nhớ chính (ram), mỗi biến có địa chỉ riêng trong ram và kích thước riêng
 #sw là lưu lại vào ngăn nhớ của Z giá trị của z qua địa chỉ của z với lệnh la $t7, z
 #
 #
