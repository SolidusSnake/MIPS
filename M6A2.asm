.text
.globl __start
__start:

la $a0,array
lw $a1,count				# in the jal statement
jal sort					# jump to "sort:"
j print						# jump to "print:"

# start subroutine
sort:	sw $ra,-4($sp)		# load the return address in to the stack ptr
move $t6,$a1				# outter counter
outter:	sub $t6,$t6,1		# sub outter counter
move $t7,$a0				# save address for "array" into $t7
move $t5,$a1				# inner counter

inner:	sub $t5,$t5,1		# sub 1 from inner counter
lw $s0,($t7)				# load the two variables to be tested
lw $s1,4($t7)				# ^^^

ble $s0,$s1,next			# if $s0 < $s1 branch
sw $s1,($t7)				# else switch the two
sw $s0,4($t7)

next:	add $t7,$t7,4		# add 4 to saved address for next loop
bnez $t5,inner				# if inner counter !=0 then branch
bnez $t6,outter				# if outter counter !=0 then branch

lw $ra,-4($sp)				# if outter counter =0 load top
jr $ra						# stack point and exit sub

print:						# print final memory locations
la $t7,array
lw $t0,($t7)
lw $t1,4($t7)
lw $t2,8($t7)

.data
array:	.word 3,2,1
count:	.word 3
## EOF
