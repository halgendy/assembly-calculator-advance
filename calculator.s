# A terminal calculator
#
# Reads a line of input, interprets it as a simple arithmetic expression,
# and prints the result. The input format is
# <long_integer> <operation> <long_integer>

# Make `main` accessible outside of this module
.global main

# Start of the code section
.text

main:
  # Function prologue
  enter $0, $0

  # Use scanf to retrieve and process a line of input
  # Essentially, telling it the addresses for later when it runs
  movq $scanf_fmt, %rdi
  movq $a, %rsi
  movq $op, %rdx
  movq $b, %rcx
  movb $0, %al
  call scanf
  # Input results now exist in a, b, op variables

  # Analyze operation and execute
  # if plus
  cmpb $'+', op
  je plus_op

  # if minus
  cmpb $'-', op
  je minus_op

  # if multiply
  cmpb $'*', op
  je multiply_op

  # if divide
  cmpb $'/', op
  je divide_op

  # else
  movq $unknown_msg, %rdi
  jmp error

# Prepare and print result
# Print error if operation cannot be (safely) performed
plus_op:
  # move a to rax register, add with b; save result to print
  movq a, %rax
  addq b, %rax
  movq %rax, rslt
  jmp print_op
minus_op:
  # move a to rax register, subtract with b; save result to print
  movq a, %rax
  subq b, %rax
  movq %rax, rslt
  jmp print_op
multiply_op:
  # move a to rax register, signed multiply with b; save result to print
  movq a, %rax
  imulq b, %rax
  movq %rax, rslt
  jmp print_op
divide_op:
  # check divide 0
  cmp $0, b
  movq $byzero_msg, %rdi
  je error

  # move a to rax register, handle sign with cqo, signed divide with b; save result to print
  movq a, %rax
  # have to put cqo to sign the div
  cqo

  idivq b
  movq %rax, rslt
  jmp print_op
print_op:
  movq $output_fmt, %rdi
  movq rslt, %rsi
  movb $0, %al
  call printf

  # return 0 (win)
  movq $0, %rax
  jmp end
error:
  movb $0, %al
  call printf

  # return 1 (fail)
  movq $1, %rax
  jmp end
end:
  leave
  ret

# Start of the data section
.data

# Error message
unknown_msg:
  .asciz "Unknown operation\n"
byzero_msg:
  .asciz "Cannot divide by 0\n"
# Print output format
output_fmt:
  .asciz "%ld\n"
# Scan input type format
scanf_fmt:
  .asciz "%ld %c %ld"

# "Slots" for scanf
a:  .quad 0
b:  .quad 0
op: .byte 0

# "Slot" for calculation result
rslt: .quad 0
