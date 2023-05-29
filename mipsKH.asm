.data
    n_prompt: .asciiz "Nhập vào một số nguyên n: "
    result_prompt: .asciiz "i\t\t2^i\t\ti^2\t\tHexadecimal(i)\n"
    result_format: .asciiz "%d\t\t%d\t\t%d\t\t"
    result_hex_format: .asciiz "0x%s\n"
    hex_digits: .asciiz "0123456789ABCDEF"
    result: .space 9   # Khai báo mảng result với kích thước 9 byte

.text
.globl main

main:
    # Hiển thị thông báo nhập số nguyên
    li $v0, 4
    la $a0, n_prompt
    syscall

    # Nhập số nguyên từ người dùng
    li $v0, 5
    syscall
    move $a0, $v0   # Lưu giá trị số nguyên vào $a0

    # Tính toán và hiển thị bảng kết quả
    li $v0, 4
    la $a0, result_prompt
    syscall

    # Tính toán giá trị 2^i và i^2
    move $t0, $a0   # Lưu giá trị số nguyên vào $t0 (i)
    move $t1, $a0   # Sao chép giá trị số nguyên vào $t1 (i)
    sll $t2, $a0, 1    # Tính giá trị 2^i bằng cách dịch trái 1 bit
    mult $t1, $t1      # Tính i^2 bằng phép nhân

    # Hiển thị giá trị 2^i
    li $v0, 1
    move $a0, $t2
    syscall

    # Hiển thị giá trị i^2
    li $v0, 1
    mflo $a0    # Lấy kết quả nhân từ thanh ghi lo
    syscall

    # Chuyển đổi giá trị i sang hệ 16
    move $a0, $t0   # Lưu giá trị số nguyên vào $a0
    jal hexadecimal

    # Kết thúc chương trình
    li $v0, 10
    syscall

hexadecimal:
    # Lấy giá trị i từ $a0
    move $v0, $a0

    # Khởi tạo mảng kết quả
    la $t3, result
    li $t4, 7    # Đếm số chữ số hexa

    # Chuyển đổi từ phải qua trái
    loop:
        andi $t5, $v0, 0xF    # Lấy 4 bit cuối cùng của giá trị
        add $t5, $t5, $zero   # Sao chép giá trị sang $t5

        # Lưu ký tự hexa tương ứng vào mảng result
        lb $t6, hex_digits($t5)
        sb $t6, 0($t3)

        srl $v0, $v0, 4   # Dịch phải 4 bit để xét phần tử tiếp theo
        subi $t3, $t3, 1  # Di chuyển đến vị trí kế tiếp trong mảng result
        subi $t4, $t4, 1  # Giảm đếm số chữ số hexa

        bgtz $t4, loop    # Lặp lại cho đến khi đã chuyển đổi đủ số chữ số

    # In giá trị hexa
    li $v0, 4
    la $a0, result_hex_format
    syscall

    jr $ra  # Trả về từ hàm

end: