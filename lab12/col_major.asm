                .data
data:    .word     0 : 256       # storage for 16x16 matrix of words
         .text
         li       $t0, 16        # $t0 = number of rows
         li       $t1, 16        # $t1 = number of columns
         move     $s0, $zero     # $s0 = row counter
         move     $s1, $zero     # $s1 = column counter
         move     $t2, $zero     # $t2 = the value to be stored
loop:    mult     $s0, $t1       # $s2 = row * #cols  (two-instruction sequence)
         mflo     $s2            # move multiply result from lo register to $s2
         add      $s2, $s2, $s1  # $s2 += column counter
         sll      $s2, $s2, 2    # $s2 *= 4 (shift left 2 bits) for byte offset
         sw       $t2, data($s2) # store the value in matrix element
         addi     $t2, $t2, 1    # increment value to be stored
         addi     $s0, $s0, 1    # increment column counter
         bne      $s0, $t1, loop # not at end of row so loop back
         move     $s0, $zero     # reset column counter
         addi     $s1, $s1, 1    # increment row counter
         bne      $s1, $t0, loop # not at end of matrix so loop back
#  We're finished traversing the matrix.
         li       $v0, 10        # system service 10 is exit
         syscall                 # we are outta here.
         
         
         
         
