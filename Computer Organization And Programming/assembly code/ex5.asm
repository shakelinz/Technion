.global _start

.section .text
_start:
#your code here


xor %rdi, %rdi
xor %rcx, %rcx

mov $command, %rbx#save the string
movl $0, %eax          # the finished number
search_loop_HW1:
movb (%rbx), %cl    # Load the next character from the string
cmpb $'$', %cl         # Compare the character with '$'
je make_number_HW1     # If it's not '$', continue searching

inc %rbx               # Move to the next character after '$'

jmp search_loop_HW1    # Continue searching

make_number_HW1:
inc %rbx
movb (%rbx), %cl    # Load the next character from the string
testb %cl, %cl         # Check if it's null terminator 
je bad_end_search_HW1  # If it is, end the search


cmpb $'0', %cl		 
je case_0_HW1

#dec
cmpb $'0', %cl         # Check if it is between 0-9
jl bad_end_search_HW1          
cmpb $'9', %cl        
jg bad_end_search_HW1

parse_number_dec_HW1:


cmpb $'0', %cl         # Check if it is between 0-9

jl end_search_HW1          
cmpb $'9', %cl        
jg end_search_HW1     

sub $'0', %cl          # Convert ASCII to number
imul $10, %eax         # Multiply the current result by 10
add %ecx, %eax

inc %rbx               # Move to the next character
movb (%rbx), %cl    # Load the character after '$'
testb %cl, %cl         # Check if it's null terminator 
je bad_end_search_HW1  # If it is, end the search

jmp parse_number_dec_HW1



case_0_HW1:

#hexa

inc %rbx               # Move to the next character
movb (%rbx), %cl    # Load the character after '$'
testb %cl, %cl         # Check if it's null terminator 
je bad_end_search_HW1  # If it is, end the search
cmpb $'x', %cl         # Check if it is hexadecimal
jne two_more_options_HW1


inc %rbx               # Move to the next character
movb (%rbx), %cl    # Load the character after '$'
testb %cl, %cl         # Check if it's null terminator 
je bad_end_search_HW1  # If it is, end the search

cmpb $'0', %cl         # Check if it is between 0-9
jl bad_end_search_HW1          
cmpb $'F', %cl         # Check if it is between 0-9
jg bad_end_search_HW1      
cmpb $'9', %cl         # Check if it is between 0-9
jg another_case_HW1
jmp parse_number_hex_HW1
another_case_HW1:
cmpb $'A', %cl         # Check if it is between 0-9
jl bad_end_search_HW1

parse_number_hex_HW1:
cmpb $'0', %cl         # Check if it is between 0-9
jl end_search_HW1          
cmpb $'9', %cl         
jg search_AF_HW1


sub $'0', %cl          # Convert ASCII to number
shl $4, %eax         # Multiply the current result by 16
add %ecx, %eax

inc %rbx               # Move to the next character
movb (%rbx), %cl    # Load the character after '$'
testb %cl, %cl         # Check if it's null terminator 
je bad_end_search_HW1  # If it is, end the search
jmp parse_number_hex_HW1

search_AF_HW1:
cmpb $'A', %cl         # Check if it is between AF
jl end_search_HW1          
cmpb $'F', %cl         #check if it is higher then 9
jg end_search_HW1


sub $'A', %cl          # Convert ASCII to number
add $10, %cl
shl $4, %eax         # Multiply the current result by 16
add %ecx, %eax

inc %rbx               # Move to the next character
movb (%rbx), %cl    # Load the character after '$'
testb %cl, %cl         # Check if it's null terminator 
je bad_end_search_HW1  # If it is, end the search
jmp parse_number_hex_HW1

two_more_options_HW1:


#bin


cmpb $'b', %cl         # Check if it is binary
jne octal_option_HW1

inc %rbx               # Move to the next character
movb (%rbx), %cl    # Load the character after '$'
testb %cl, %cl         # Check if it's null terminator 
je bad_end_search_HW1  # If it is, end the search
cmpb $'0', %cl         # Check if it is between 0-1
jl bad_end_search_HW1          
cmpb $'1', %cl        
jg bad_end_search_HW1     

parse_number_bin_HW1:

cmpb $'0', %cl         # Check if it is between 0-1
jl end_search_HW1          
cmpb $'1', %cl        
jg end_search_HW1     

sub $'0', %cl          # Convert ASCII to number
shl $1, %eax         # Multiply the current result by 2
add %ecx, %eax

inc %rbx               # Move to the next character
movb (%rbx), %cl    # Load the character after '$'
testb %cl, %cl         # Check if it's null terminator 
je bad_end_search_HW1  # If it is, end the search
jmp parse_number_bin_HW1

octal_option_HW1:


#just zero


cmpb $',', %cl         # Check if it is just 0
jne continue_octal_HW1
movl $0, %eax
jmp end_search_HW1


#oct
continue_octal_HW1:

cmpb $'0', %cl         # Check if it is between 0-7
jl bad_end_search_HW1          
cmpb $'7', %cl        
jg bad_end_search_HW1     


parse_number_oct_HW1:

cmpb $'0', %cl         # Check if it is between 0-7
jl end_search_HW1          
cmpb $'7', %cl        
jg end_search_HW1     

sub $'0', %cl          # Convert ASCII to number
shl $3, %eax         # Multiply the current result by 8
add %ecx, %eax

inc %rbx               # Move to the next character
movb (%rbx), %cl    # Load the character after '$'
testb %cl, %cl         # Check if it's null terminator 
je bad_end_search_HW1  # If it is, end the search
jmp parse_number_oct_HW1


#end


end_search_HW1:
cmpb $',', %cl
jne bad_end_search_HW1
movl %eax, (integer)
movb $1, (legal)
jmp end_HW1


bad_end_search_HW1:
movb $0, (legal)


end_HW1:
