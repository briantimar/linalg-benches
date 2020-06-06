#include <stdio.h>
#include <sys/time.h>
#include <stdlib.h>


typedef float floattype;
typedef double timetype;


timetype timediff(struct timeval t2, struct timeval t1) {
    return ((timetype) (t2.tv_sec - t1.tv_sec)) + 1e-6 * ((timetype) (t2.tv_usec - t1.tv_usec));
}

// adds second vector to the first, writes the result first.
void addv( floattype v1[], floattype v2[], int size){
    int i;
    for (i=0; i<size; i++) {
        v1[i] += v2[i];
    }
}

// fill the given array with a bunch of random float values.
// size = number of els in the array
// maxabs = max absolute value (outputs are signed)
void fillarray(floattype v[], int size, floattype maxabs) {
    int i;
    floattype r;
    for (i = 0; i < size; i++)
    {
        r = (((floattype) rand()) / ((floattype) RAND_MAX) - 0.5) * 2.0 * maxabs;
        v[i]=r;
        
    }
}

timetype benchmark(int nsamp, floattype*v1, floattype* v2, int size, floattype maxabs){
    timetype t = 0.0;
    struct timeval t1, t2;
    int i;
    fillarray(v1, size, maxabs);
    fillarray(v2, size, maxabs);
    gettimeofday(&t1, NULL);
    for (i=0; i< nsamp; i++) {
        addv(v1, v2, size);
    }
    gettimeofday(&t2, NULL);
    return timediff(t2, t1) / ((float) nsamp);
}

int main(int argc, char* argv[]) {
    int i;
    int size;
    int nsamp;
    floattype maxabs = 1.0;
    timetype t;
    int r1, r2;
    
    if (argc != 3){
        fprintf(stderr, "usage: %s size nsamp\n", argv[0]);
        exit(1);
    }

    if (((size=atoi(argv[1]))<=0) || ((nsamp=atoi(argv[2]))<=0)) {
        fprintf(stderr, "invalid args");
        exit(1);
    }

    // populate the arrays
    floattype* v1 = malloc(size * sizeof(floattype));
    floattype* v2 = malloc(size * sizeof(floattype));
    fillarray(v1, size, maxabs);
    fillarray(v2, size, maxabs);

    printf("Size of float type: %lu\n", sizeof(floattype));
    printf("Number of samples: %d\n", nsamp);
    printf("Vector size: %d\n", size);
    t = benchmark(nsamp, v1, v2, size, maxabs);
    printf("Average time per vector: %.6e s\n", t);
    printf("Average time per entry: %.6e s\n", t/((timetype) nsamp));

    free(v1);
    free(v2);
    exit(0);

}