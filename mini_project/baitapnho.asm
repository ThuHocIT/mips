.data
sequence:   .word   1, 3, 2, 1     # Đặt dãy số trong mảng sequence
length:     .word   4               # Độ dài của dãy số

.text
.globl  main

main:
    la      $t0, sequence           # Lấy địa chỉ của mảng sequence
    lw      $t1, length             # Lấy độ dài của dãy số
    addi    $t1, $t1, -1            # Trừ đi 1 để tính index cuối cùng

    jal     almostIncreasingSequence # Gọi hàm almostIncreasingSequence

    li      $v0, 10                 # Exit program
    syscall

# Hàm kiểm tra dãy số tăng gần đúng
almostIncreasingSequence:
    addi    $sp, $sp, -8            # Cấp phát không gian cho biến cục bộ
    sw      $ra, 4($sp)             # Lưu trữ địa chỉ trở về

    move    $s0, $t1                # Sao chép index cuối cùng vào $s0
    li      $t2, 0                  # Đặt biến đếm là 0

checkIncreasing:
    beq     $t1, $zero, checkRemoval    # Kiểm tra nếu index đã đạt đến đầu dãy số

    lw      $t3, 0($t0)             # Lấy giá trị tại index hiện tại
    lw      $t4, 4($t0)             # Lấy giá trị tại index kế tiếp

    ble     $t3, $t4, checkRemoval      # Kiểm tra nếu dãy số tăng

    addi    $t2, $t2, 1            # Tăng biến đếm lỗi

    # Kiểm tra nếu có hơn 1 lỗi, quay trở lại main
    bgt     $t2, 1, returnMain     

checkRemoval:
    addi    $t1, $t1, -1            # Giảm index đi 1
    addi    $t0, $t0, 4             # Đi đến index tiếp theo

    j       checkIncreasing         # Quay lại vòng lặp kiểm tra

returnMain:
    lw      $ra, 4($sp)             # Lấy địa chỉ trở về
    addi    $sp, $sp, 8             # Giải phóng không gian biến cục bộ
    jr      $ra                     # Trở về địa chỉ gọi

