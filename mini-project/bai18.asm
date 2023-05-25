.data
sequence:   .word   1, 3, 2, 5, 4, 6   # Đặt dãy số trong mảng sequence
length:     .word   6              # Độ dài của dãy số
Message: .asciiz "Day co the la day tang ngat: "
True: .asciiz "true"
False: .asciiz "false"
.text
main:
    la      $t0, sequence           # Lấy địa chỉ của mảng sequence
    lw      $t1, length             # Lấy độ dài của dãy số
    addi    $t1, $t1, -1            # Trừ đi 1 để tính index cuối cùng

    j  	     almostIncreasingSequence # Gọi hàm almostIncreasingSequence  al 

#Hàm in kết quả đúng
true:
   	li $v0, 59
 	la $a0, Message
 	la $a1, True 
 	syscall
endtaskwithtrue:
 	li      $v0, 10                 # Exit program
    	syscall 
# Hàm kiểm tra dãy số tăng gần đúng
almostIncreasingSequence:
    li      $t2, 0                  # Đặt biến đếm là 0

#Hàm vòng lặp chính
checkIncreasing:
    beq     $t1, $zero, true    # Kiểm tra nếu index đã đạt đến đầu dãy số mà vẫn hợp lệ, nhảy đến true

    lw      $t3, 0($t0)             # Lấy giá trị tại index hiện tại
    lw      $t4, 4($t0)             # Lấy giá trị tại index kế tiếp

    bgt      $t4, $t3, checkRemoval      # Kiểm tra nếu dãy số tăng (a[i+1] > a[i]

    addi    $t2, $t2, 1            # Tăng biến đếm lỗi

    # Kiểm tra nếu có hơn 1 lỗi, chạy đến hàm false
    bgt     $t2, 1, false

#Hàm cập nhật giá trị	        
checkRemoval:
    addi    $t1, $t1, -1            # Giảm index đi 1
    addi    $t0, $t0, 4             # Đi đến index tiếp theo
    j       checkIncreasing         # Quay lại vòng lặp kiểm tra
    
#Hàm in kết quả sai
false:
    li $v0, 59
    la $a0, Message
    la $a1, False
    syscall

