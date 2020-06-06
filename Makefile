naive1: naive1.c
	gcc naive1.c -g -o builds/naive1

# addv_sse1.S: addv_sse1.c
# 	gcc -S addv_sse1.c -o addv_sse1.S

addv_sse1: addv_sse1.S
	as addv_sse1.S -o builds/addv_sse1.o
	ld builds/addv_sse1.o -lSystem -o builds/addv_sse1