.data
message: .asciiz "The answer is : "
.text
.globl main
main:


    addi $v0,$zero, 4   # print the character of the address pointer in the $a0
    la $a0, message	   # set $a0  point to string in message
    syscall


	########################
	# add your code here^^ #
	########################
	addi $t0, $t0, 3
	addi $t1, $t1, 5
	addi $t2, $t2, 9
	addi $t3, $t3, 10
	sub  $t0, $t0, $t1 
	sub  $t2, $t2, $t3 
	add  $t0, $t0, $t2
	
	

	add $a0, $t0, $zero

	
end:
	addi $v0,$zero, 1 # Sets $v0 to "1" to print $a0
	syscall
	addi $v0,$zero,10
	syscall
	
