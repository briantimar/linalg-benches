naive1: naive1.c
	gcc naive1.c -g -o builds/naive1
	gcc -S naive1.c -o builds/naive1.asm
