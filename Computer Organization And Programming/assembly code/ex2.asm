.global _start

.section .text
_start:



xor %rax, %rax
xor %rbx, %rbx
xor %rcx, %rcx
xor %rdx, %rdx
xor %r8, %r8
xor %r9, %r9
xor %r10, %r10
xor %r11, %r11
xor %r12, %r12
movq $vertices, %r8

counter_build_HW1:

movzx %ax, %rax
leaq (%r8,%rax,8), %rbx
cmp $0, (%rbx)
je end_counter_HW1
inc %ax
jmp counter_build_HW1

end_counter_HW1:

xor %rbx, %rbx
xor %rcx, %rcx
xor %rdx, %rdx

movb $-1 , %dl
movw %ax, %cx
sal %cl , %dl


cmp $0,(%r8)
je determin_the_end_HW1

open_case_HW1:
movzx %r9w, %r9
leaq (%r8,%r9,8), %rbx
cmp $0,(%rbx)
je determin_the_end_HW1

movb %dl, %r10b
movw %r9w, %cx
ror %cl, %r10b 
and $1, %r10b

cmp $0 , %r10b
je closed_HW1
inc %r9w

cmp $0 , (%rbx)
je determin_the_end_HW1

jmp open_case_HW1

closed_HW1:
movq (%rbx), %r11
itirate_the_ver_HW1:
xor %r12w, %r12w
cmp $0 , (%r11)
je hole_HW1

edge_HW1:
movzx %r12w, %r12
leaq (%r8,%r12,8), %r13
movq (%r13), %rcx
cmp (%r11), %rcx
je changed_ver_HW1
inc %r12w
jmp edge_HW1

changed_ver_HW1:
movb %dl, %bl
movb %dl, %cl
ror %cl, %bl
and $1, %bl
xor %rcx, %rcx
cmp $0 , %bl
je no_hole_HW1

leaq 8(%r11), %r11
jmp itirate_the_ver_HW1

no_hole_HW1:
inc %r9w
jmp open_case_HW1

hole_HW1:

movb $1, %bl
movw %r9w , %cx
rol %cl, %bl
or %bl, %dl
xor %r9w, %r9w
jmp open_case_HW1

determin_the_end_HW1:
mov $-1 , %cl
cmp %cl, %dl
je bad_end_HW1

movb $1, circle
jmp end_HW1

bad_end_HW1:
movb $-1, circle

end_HW1:
