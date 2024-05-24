.global _start

.section .text
_start:
#your code here

mov $character, %eax
testb %al, %al         # Check if it's null terminator 
je bad_end_HW1         

#special characters

cmpl $49, (%rax)
je case_1_HW1
cmpl $50, (%rax)
je case_2_HW1
cmpl $51, (%rax)
je case_3_HW1
cmpl $52, (%rax)
je case_4_HW1
cmpl $53, (%rax)
je case_5_HW1
cmpl $54, (%rax)
je case_6_HW1
cmpl $55, (%rax)
je case_7_HW1
cmpl $56, (%rax)
je case_8_HW1
cmpl $57, (%rax)
je case_9_HW1
cmpl $48, (%rax)
je case_0_HW1
cmpl $96, (%rax)
je case_left_one_HW1
cmpl $45, (%rax)
je case_45_HW1
cmpl $61, (%rax)
je case_61_HW1
cmpl $91, (%rax)
je case_91_HW1
cmpl $93, (%rax)
je case_93_HW1
cmpl $59, (%rax)
je case_59_HW1
cmpl $39, (%rax)
je case_39_HW1
cmpl $92, (%rax)
je case_92_HW1
cmpl $44, (%rax)
je case_44_HW1
cmpl $46, (%rax)
je case_._HW1
cmpl $47, (%rax)
je case_47_HW1

#not a special
jmp not_a_special_HW1


case_1_HW1:
mov $'!', %rdx
jmp end_HW1
case_2_HW1:
mov $'@', %rdx
jmp end_HW1
case_3_HW1:
mov $'#', %rdx
jmp end_HW1
case_4_HW1:
mov $'$', %rdx
jmp end_HW1
case_5_HW1:
mov $'%', %rdx
jmp end_HW1
case_6_HW1:
mov $'^', %rdx
jmp end_HW1
case_7_HW1:
mov $'&', %rdx
jmp end_HW1
case_8_HW1:
mov $'*', %rdx
jmp end_HW1
case_9_HW1:
mov $'(', %rdx
jmp end_HW1
case_0_HW1:
mov $')', %rdx
jmp end_HW1

case_left_one_HW1:
mov $'~', %rdx
jmp end_HW1

case_45_HW1:
mov $'_', %rdx
jmp end_HW1

case_61_HW1:
mov $'+', %rdx
jmp end_HW1

case_91_HW1:
mov $'{', %rdx
jmp end_HW1

case_93_HW1:
mov $'}', %rdx
jmp end_HW1

case_59_HW1:
mov $':', %rdx
jmp end_HW1

case_39_HW1:
mov $'"', %rdx
jmp end_HW1

case_92_HW1:
mov $'|', %rdx
jmp end_HW1
case_44_HW1:
mov $'<', %rdx
jmp end_HW1

case_._HW1:
mov $'>', %rdx
jmp end_HW1

case_47_HW1:
mov $'?', %rdx
jmp end_HW1

not_a_special_HW1:

#in case of letter
cmpl $97, (%rax)
jl bad_end_HW1
cmpl $122, (%rax)
jg bad_end_HW1

sub $32, (%rax)

mov (%rax), %rdx
jmp end_HW1

#in case anything else 
bad_end_HW1:
mov $0xff, %rdx
end_HW1:
mov %rdx, shifted
