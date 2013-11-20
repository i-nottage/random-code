#
#  Programmed by:	iAN nOTTAGE
#  Section:		CDA 3101
#   File Name:		quickitty.s
# 
#

.data

Fat:		.asciiz  "FAT"
Cat:		.asciiz  "\n   CAT"
Ran:		.asciiz  "\n    RAN"
Fast:		.asciiz  "\nFAST...FASTER"

.text

main:

	li    $v0    4
	la   $a0,   Fat
	syscall

	li    $v0    4
	la   $a0,   Cat
	syscall

	li    $v0    4
	la   $a0,   Ran
	syscall


	li    $v0    4
	la   $a0,   Fast
	syscall