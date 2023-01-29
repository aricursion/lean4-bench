import time
import sys

def erato(top):
    primes = [True] * top
    p = 2
    while p*p < top:
        if primes[p]:
            for i in range(p*p, top, p):
                primes[i] = False

        p += 1

    return primes

def main():
    if len(sys.argv) > 1:
        top = int(sys.argv[1])
    else:
        top = 100

    start = time.time()
    res = erato(top)
    total = time.time() - start
    print(total)
    return total

if __name__ == "__main__":
    main()
