.data
hex: .asciiz "0123456789ABCDEF"
result_prompt: .asciiz "Hexadecimal: "
result_format: .asciiz "%s\n"
prompt: .asciiz "Nhap vao mot so nguyen i: "
result: .space 9     # Mảng kết quả có thể chứa tối đa 8 ký tự hex
newline: .asciiz "\n"
result_header: .asciiz "i\t\t2^i\t\ti^2\t\tHexadecimal(i)\n"
result_row: .asciiz "%d\t\t%d\t\t%d\t\t%s\n"
tab: .asciiz "\t"
prefix: .asciiz "0x"

.text
.globl main

main:
    # Hiển thị thông báo nhập số nguyên
    li $v0, 4
    la $a0, prompt
    syscall

    # Nhập số nguyên từ người dùng
    li $v0, 5
    syscall
    move $t0, $v0    # Lưu giá trị số vào thanh ghi $t0

    # Gọi các hàm con để tính toán
    jal calculate_power
    jal calculate_square
    jal convert_to_hex

    # Hiển thị tiêu đề
    li $v0, 4
    la $a0, result_header
    syscall

    # In ra giá trị của i
    li $v0, 1
    move $a0, $t0
    syscall

    # In ra ký tự tab
    li $a0, 9
    li $v0, 11
    syscall
    li $a0, 9
    li $v0, 11
    syscall

    # In ra giá trị của 2^i
    li $v0, 1
    move $a0, $t1
    syscall

    # In ra ký tự tab
    li $a0, 9
    li $v0, 11
    syscall
    li $a0, 9
    li $v0, 11
    syscall

    # In ra giá trị của i^2
    li $v0, 1
    move $a0, $t2
    syscall

    # In ra ký tự tab
    li $a0, 9
    li $v0, 11
    syscall
    li $a0, 9
    li $v0, 11
    syscall

    # Hiển thị giá trị Hexadecimal(i)
    li $v0, 34       # Mã số syscall 34 để gọi hàm itoa
    move $a0, $t0    # Đưa giá trị số i vào thanh ghi $a0
    li $a2, 16       # Đưa cơ số 16 vào thanh ghi $a2
    la $a1, result   # Đưa địa chỉ mảng kết quả vào thanh ghi $a1
    syscall

    # In xuống dòng
    li $v0, 11
    la $a0, newline
    syscall

    # Kết thúc chương trình
    li $v0, 10
    syscall

# Hàm con để tính 2^i
calculate_power:
    li $t1, 1        # Khởi tạo giá trị ban đầu của thanh ghi $t1 là 1

    loop_power:
        beqz $t0, end_power   # Nếu i = 0, thoát khỏi vòng lặp

        mul $t1, $t1, 2   # Tính 2^i bằng phép nhân
        addi $t0, $t0, -1   # Giảm giá trị của i đi 1
        j loop_power   # Quay lại vòng lặp

    end_power:
    jr $ra

# Hàm con để tính i^2
calculate_square:
    move $a0, $t0     # Chuyển giá trị của $t0 vào $a0
    mul $t2, $a0, $a0  # Tính i^2 bằng phép nhân
    jr $ra

convert_to_hex:
    move $t3, $t0   # Lưu giá trị của i vào thanh ghi $t3
    move $t4, $t3   # Sao chép giá trị của i vào thanh ghi $t4
    li $t5, 8       # Khởi tạo độ dài tối đa của mảng kết quả là 8 (bao gồm ký tự null terminator)
    la $t6, result  # Địa chỉ bắt đầu của mảng result

    loop_hex:
        beqz $t4, end_hex   # Nếu giá trị của i = 0, thoát khỏi vòng lặp

        andi $t7, $t4, 0xF   # Lấy 4 bit cuối cùng của giá trị của i
        addi $t7, $t7, 0x30  # Chuyển sang mã ASCII tương ứng

        # Xử lý các giá trị hex lớn hơn 9
        addi $t8, $t7, -0x30   # Chuyển giá trị ASCII sang số
        slti $t9, $t8, 10   # Kiểm tra giá trị có nhỏ hơn 10 hay không
        beqz $t9, hex_greater_than_9   # Nếu giá trị lớn hơn 9, nhảy đến xử lý đặc biệt

        sb $t7, 0($t6)   # Lưu ký tự hex vào mảng result
        srl $t4, $t4, 4    # Dịch phải 4 bit giá trị của i
        addi $t5, $t5, -1   # Giảm độ dài còn lại của mảng kết quả
        addi $t6, $t6, 1   # Tăng địa chỉ mảng result lên 1
        j loop_hex   # Quay lại vòng lặp

    hex_greater_than_9:
        addi $t7, $t7, 7   # Chuyển ký tự sang 'A' đến 'F'
        sb $t7, 0($t6)   # Lưu ký tự hex vào mảng result
        srl $t4, $t4, 4    # Dịch phải 4 bit giá trị của i
        addi $t5, $t5, -1   # Giảm độ dài còn lại của mảng kết quả
        addi $t6, $t6, 1   # Tăng địa chỉ mảng result lên 1
        j loop_hex   # Quay lại vòng lặp

    end_hex:
    li $t7, 8   # Số ký tự hex cần in là 8 (bao gồm ký tự null terminator)
    move $t6, $t6   # Địa chỉ bắt đầu của mảng kết quả

    loop_print_hex:
        lb $a0, 0($t6)   # Lấy ký tự hex từ mảng kết quả
        beqz $a0, end_print_hex   # Nếu gặp ký tự null terminator, thoát khỏi vòng lặp

        li $v0, 11   # Gán giá trị 11 vào thanh ghi $v0 để in ký tự
        syscall

        addi $t6, $t6, 1   # Tăng địa chỉ mảng kết quả lên 1
        addi $t7, $t7, -1   # Giảm số ký tự còn lại
        j loop_print_hex   # Quay lại vòng lặp

    end_print_hex:
    jr $ra

