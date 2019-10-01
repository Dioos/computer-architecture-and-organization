# function fibonacci(n)
#  integer a = 1
#    integer b = 0
#    integer t  to 25

#    for i from 1 to n
#        t = a + b
#        b = a
#        a = t
#    return a
.data
   message: .asciiz"After  fibonacci done,the number is : "
.text


main:
   li   $v0, 4        # print the character of the address pointer in the $a0
   la	$a0, message	# point to string in msg
   syscall

    ########################
    # add your code here^^ #
    ########################
    lw $a0,-1($a0)
    addi $a0, $zero,25
    jal fib
    add  $t0, $v0, $zero  
    jal end
    addi $v0,$zero,10
    syscall
    
    
fib:
    
    ########################
    # add your code here^^ #
    ########################
    addi $t1, $t1, 1        #a = 1
    add $t2, $t2, $zero     #b = 0
    addi $t3, $t3, 1        #counter i
Loop:
    slt $t4, $t3, $a0       # t4 = i < n
    beq $t4, $zero, Exit   
    add $t5, $t1, $t2       # t = a + b
    add $t2, $t1, $zero     # b = a
    add $t1, $t5, $zero     # a = t
    addi $t3, $t3, 1        # i++
    j Loop
Exit:
    add $v0, $t1, $zero 
    jr $ra   
end: 
    add $a0, $zero, $t0  #temp=a
    li   $v0, 1
    syscall  #print the number  in $a0
    jr $ra # Return address
