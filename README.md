# Benches

Playing around with some ways to make very simple linear algebra operations fun faster, on my laptop CPU.

# addv()

The goal here is perform an in-place addition of two 32bit floating point vectors as quickly as possible.
## Assumptions
    * both vectors have already been loaded into main memory as contiguous fp arrays

## naive1
This solution is the obvious one - loop over the arrays and add elements one at a time into the destination array. Written in C, compiled without any flags. The for loop ends up compiling to N 32-bit FP additions in the XMM0 register, where N is the vector size - in other words it doesn't make any use of the SSE capability.

## addv_sse1
To produce this solution I took the naive1 assembly and rewrote the for loop to put 4 32fp elements at a time into the xmm0 register and add the second vector with `addps`. 