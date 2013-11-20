.data

prompt:	.asciiz    "Enter value:"
two:		.word    2
num:		.word
ans1:		.word
ans2:		.word
answer:	.word

main:

	li    $v0    5
	sw    $a0   num
	syscall

	add	num,$t1,$t2
	syscall