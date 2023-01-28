#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <time.h>

bool* erato (int max) {
    bool* primes = malloc(max*sizeof(bool));
    memset(primes, true, sizeof(bool)*max);
    primes[0] = false;
    primes[1] = false;
    for (int p = 2; p*p < max; p++) {
        if (primes[p]) {
            for (int i = p*p; i < max; i+= p) {
                primes[i] = false;
            }
        }
    }
    return primes;
}

int main (int argc, char *argv[]) {
    long int max;
    if( argc == 2 ) {
        max = (long int)atoi(argv[1]);
    }    
    else {
        max = 10;
    }
    
    clock_t start = clock();
    bool* primes = erato(max);
    clock_t end = clock();
    double time = ((double)(end - start))/CLOCKS_PER_SEC;
    printf("time: %lf \n", time);
    return 0;
}
