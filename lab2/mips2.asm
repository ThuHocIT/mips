#Laboratory Exercise 2, Assignment 1 + 2
.text
	#addi	$s0, $zero, 0x2110003d
	lui $s0,0x2110 #put upper half of pattern in $s0
	ori $s0,$s0,0x003d #put lower half of pattern in $s0
	#addi	$s0, $zero, 0x3007 # $s0 = 0 + 0x3007 = 0x3007; I-type 2 lệnh có 2 format khác khau,
	add 	$s0, $zero, $0	    # $s0 = 0 + 0 = 0		; R-type