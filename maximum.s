# PURPOSE: This program finds the maximum number if a set of data items.
#
# VARIABLES: The registers have the following uses:
#
# %edi: - Holds the index of the data item being examined
# %ebx: - Largest data item found
# %eax: - Current data item
#
# The following memory locations are used:
# 
# data_items - contains the item data. A 0 is used to terminate the data
#

 .section .data

data_items:
 .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

 .section .text

 .global _start

_start:
 movl $0, %edi                        # initialize the index to zero
 movl data_items(, %edi, 4), %eax     # load the first element in the data_item
 movl %eax, %ebx                      # initilize the first element to maximum

start_loop:
 cmp $0, %eax                         # check to see if we're hit the end
 je loop_exit
 incl %edi
 movl data_items(, %edi, 4), %eax
 cmpl %ebx, %eax                      # compare the current element to the maximum element
 jle start_loop
 movl %eax, %ebx
 jmp start_loop

loop_exit:
 # %ebx is the status code for the exit system call and it already has the maximum number
 movl $1, %eax
 int $0x80

