#Laboratory Exercise 2, Assignment 5
.text
 # Assign X, Y
 addi $t1, $zero, 4 # X = $t1 = ?
 addi $t2, $zero, 5 # Y = $t2 = ?
 # Expression Z = 3*XY
 mul $s0, $t1, $t2 # HI-LO = $t1 * $t2 = X * Y ; $s0 = LO
 mul $s0, $s0, 3 # $s0 = $s0 * 3 = 3 * X * Y
 # Z' = Z
 mflo $s1
 #----PHÉP NHÂN----
 #KHI NHÂN, 2 toán hạng 32 bit nhân tjao ra 1 toán hạng 64 bit, nên phải dùng 2 thnah ghi hi và lo để chứa 32 bit cao và 32 bit thấp
 #khi chia, tương tự nhưng hi và lo để chứa thương và số dư.
 #